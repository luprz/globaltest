<template>
  <q-page>
    <div v-if="$q.platform.is.desktop"> 
      <ArrayDesktop/>
    </div>

    <div v-if="$q.platform.is.mobile"> 
      <ArrayPhone/>
    </div>
  </q-page>
</template>

<script>
import ArrayDesktop from 'components/ArrayDesktop'
import ArrayPhone from 'components/ArrayPhone'

export default {
  name: 'PageIndex',
  components: {
    ArrayDesktop,
    ArrayPhone
  }
}
</script>
