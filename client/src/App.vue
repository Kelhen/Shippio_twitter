<template>
<div id="app">
    <main role="main" class="container">
      <app-header></app-header>
      <router-view></router-view>
    </main>
  </div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import AppHeader from './components/AppHeader'

export default {
  name: 'app',

  components: {
    AppHeader,
    FontAwesomeIcon
  }
}
</script>

<style lang="scss">
  @import './styles/custom_bootstrap.scss';
  @import '../node_modules/bootstrap/scss/bootstrap.scss';
</style>
