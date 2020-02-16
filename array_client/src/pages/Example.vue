<template>
    <q-page class="flex">
    <template>
      <div class="q-pa-md" style="width: 100%">
        <q-card class="my-card">
          <q-card-section>
            <div class="text-h6">Obtener formato</div>
            <q-form ref="arrayForm" @submit="getFormat" class="q-gutter-md">
              <div class="text-subtitle2">
                <div class="row">
                  <div class="col-2">
                    <q-input outlined 
                            label="Año" 
                            stack-label
                            type="number"
                            v-model="car.year"/>
                  </div>
                  <div class="col-3">
                    <q-input outlined 
                            label="Marca" 
                            stack-label
                            v-model="car.make"/>
                  </div>
                  <div class="col-2">
                    <q-input outlined 
                            label="Modelo"
                            stack-label
                            v-model="car.model"/>
                  </div>
                  <div class="col-2">
                    <q-input outlined 
                            label="Trim" 
                            stack-label
                            v-model="car.trim"/>
                  </div>
                  <div class="col-3">
                    <q-btn color="purple" size="lg" label="Obtener Formato" icon="done" type="submit"/>
                  </div>
                </div>
              </div>
            </q-form>
          </q-card-section>
          <q-markup-table>
            <thead>
              <tr>
                <th class="text-left">Año</th>
                <th class="text-right">Marca</th>
                <th class="text-right">Modelo</th>
                <th class="text-right">Trim</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="car in cars">
                <td class="text-left">{{car.year}}</td>
                <td class="text-right">{{car.make}}</td>
                <td class="text-right">{{car.model}}</td>
                <td class="text-right">{{car.trim}}</td>
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
  name: 'PageExample',
  data () {
    return {
      cars: [],
      car: {
        year: 2000,
        make: 'ford',
        model: 'focus se',
        trim: ''
      }
    }
  },
  methods: {
    getFormat () {
      this.$axios.post(localStorage.endpoint + '/cars/format', { input: this.car },{ headers: { Authentication: app.api.key } })
        .then((response) => {
          this.cars = [response.data]
        })
        .catch(() => {
          console.log(response)
          this.prompt = true
        })
    },
    addEndpoint () {
      localStorage.endpoint = this.endpoint
    }
  }
}
</script>
