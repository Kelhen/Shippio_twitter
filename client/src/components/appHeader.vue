<template>
<div>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="/">
      <font-awesome-icon :icon="['fab', 'twitter']" />
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    <div  class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li v-if="userId" class="nav-item">
          <a class="nav-link disabled" href="/me">My profile</a>
        </li>
      </ul>
      <form class="form-inline">
        <input v-if="userId" class="form-control mr-sm-1" type="text" placeholder="Search" aria-label="Search">
        <button v-if="userId" class="btn btn-outline-success my-2 my-sm-0" type="submit">Search user</button>
        <button class="btn btn-outline-danger my-3 my-sm-0" v-if="userId" @click="logout()">logout</button>
        <router-link v-else to="/login" class="btn btn-outline-primary my-3 my-sm-0 float-right">login</router-link>
      </form>
    </div>
  </nav>
</div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import { T_USER_ID, T_AUTH_TOKEN } from '../constants/settings'

export default {
  name: 'AppHeader',
  components: {
    FontAwesomeIcon
  },
  computed: {
    userId () {
      return this.$root.$data.userId
    }
  },
  methods: {
    logout () {
      localStorage.removeItem(T_USER_ID)
      localStorage.removeItem(T_AUTH_TOKEN)
      this.$root.$data.userId = localStorage.getItem(T_USER_ID)
    }
  }
}
</script>

<style media="screen">
  .my-3{
    margin-left: 3px;
  }
</style>
