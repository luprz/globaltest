<template>
  <q-page class="flex">
    <template>
      <div class="q-pa-md" style="width: 100%">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Genere un array</div>
            <q-form ref="arrayForm" @submit="generate" class="q-gutter-md">
              <div class="text-subtitle2">
                <div class="row">
                  <div class="col-9">
                    <q-input outlined 
                            label="Numero de elementos" 
                            stack-label
                            type="number"
                            min="10"
                            v-model="arrayNumber"/>
                    <span style="color:red">{{errors}}</span>
                  </div>
                  <div class="col-3">
                    <q-btn color="purple" size="lg" label="Generar" icon="done" type="submit"/>
                  </div>
                </div>
              </div>
            </q-form>
          </q-card-section>
          <q-markup-table>
            <thead>
              <tr>
                <th class="text-left">Id</th>
                <th class="text-right">Input</th>
                <th class="text-right">Output</th>
                <th class="text-right">Control</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="array in arrays">
                <td class="text-left">{{array.id}}</td>
                <td class="text-right">{{array.data}}</td>
                <td class="text-right">{{array.output}}</td>
                <td class="text-right">
                  <q-btn color="white" text-color="black" icon="refresh" label="Obtener Output" @click="generateOutput(array.id)"/>
                </td>
              </tr>
            </tbody>
          </q-markup-table>
        </q-card>
      </div>
      <q-dialog ref="dialogEnpoint" v-model="prompt" persistent>
        <q-card style="min-width: 350px">
          <q-card-section>
            <div class="text-h6">Backend Endpoint</div>
          </q-card-section>

          <q-card-section class="q-pt-none">
            <q-input dense v-model="endpoint" autofocus @keyup.enter="addEndpoint" />
          </q-card-section>

          <q-card-actions align="right" class="text-primary">
            <q-btn flat label="Add endpoint" @click="addEndpoint" v-close-popup />
          </q-card-actions>
        </q-card>
      </q-dialog>
    </template>
  </q-page>
</template>

<script>
import app from '../../app.json'

export default {
  name: 'ArrayPhone',
  data () {
    return {
      errors: '',
      arrayNumber: 10,
      arrays: this.loadArrays(),
      endpoint: 'http://localhost:3000/',
      prompt: false
    }
  },
  methods: {
    generate (e) {
      e.preventDefault();
      this.generateArray()
      // ...
    },
    loadArrays () {
      this.$axios.get(localStorage.endpoint + '/array_list', { headers: { Authentication: app.api.key } })
        .then((response) => {
          this.arrays = response.data
        })
        .catch(() => {
          this.prompt = true
        })
    },
    generateArray () {
      if (!this.arrayNumber) {
        this.errors = 'El tamaño de array es obligatorio'
      }

      this.$axios.post(localStorage.endpoint + '/generate', { array: this.arrayNumber },{ headers: { Authentication: app.api.key } })
        .then((response) => {
          this.arrays.push(response.data)
          this.errors = ''
        })
        .catch(() => {
          console.log(response)
          this.prompt = true
        })
    },
    generateOutput (id) {
      this.$axios.get(localStorage.endpoint + '/output/'+id, { headers: { Authentication: app.api.key } })
        .then((response) => {
          this.arrays.find(data => data.id == id).output = response.data.result;
        })
        .catch(() => {
          this.prompt = true
        })
    },
    addEndpoint () {
      localStorage.endpoint = this.endpoint
      this.loadArrays()
    }
  }
}
</script>
