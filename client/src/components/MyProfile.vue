<template>
<div class="container">
  <form>
    <h4>My profile</h4>
        <div class="form-row">
    <avatar :username="`${myUser.name}`" :src="require(`@/assets/${img}`)" :size="48"></avatar>
  </div>
    <div class="form-row">
      <div class="col-md-4 mb-3">
        <label for="validationDefault01">Username</label>
        <input v-model="myUser.name" type="text" class="form-control" placeholder="User name" autofocus required>
      </div>
      <div  class="col-md-4 mb-3">
        <label for="validationDefault02">Email</label>
        <input type="email" v-model="myUser.email" placeholder="Your email address" class="form-control" required>
      </div>
      <div class="col-md-4 mb-3">
        <label for="validationDefaultUsername">Password</label>
        <div class="input-group">
          <input type="password" v-on:keyup.13="confirm()" v-model="myUser.password" class="form-control" id="validationDefaultUsername" aria-describedby="inputGroupPrepend2" required>
        </div>
      </div>
    </div>
    <button class="btn btn-outline-success my-3 my-sm-0" @click="confirm()">Save</button>
  </form>
</div>
</template>

<script >
/* eslint camelcase: "error" */

import Avatar from 'vue-avatar'
import { USER_QUERY } from '../constants/graphql'
import {T_USER_ID} from '../constants/settings'

export default {
  name: 'MyProfile',
  components: {
    Avatar
  },
  data () {
    return {
      myUser: null,
      loading: 0
    }
  },
  apollo: {
    myUser: {
      query: USER_QUERY,
      variables () {
        return {
          id: localStorage.getItem(T_USER_ID)
        }
      }
    }
  },
  computed: {
    img () {
      return this.myUser.image
    }
  }
}
</script>

<style media="screen">
.container {
  padding-top: 40px;
  padding-bottom: 20px;
}

textarea {
  width: auto;
  resize: vertical;
}
</style>
