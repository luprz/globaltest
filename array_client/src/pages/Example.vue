<template>
  <q-page>
    <!-- <div v-if="$q.platform.is.desktop"> -->
    <div class="desktop-only">
      <CarDesktop/>
    </div>

    <div class="mobile-only">
      <CarPhone/>
    </div>
  </q-page>
</template>

<script>
import app from '../../app.json'
import CarDesktop from 'components/CarDesktop'
import CarPhone from 'components/CarPhone'

export default {
  name: 'PageExample',
  components: {
    CarDesktop,
    CarPhone
  }
}
</script>
