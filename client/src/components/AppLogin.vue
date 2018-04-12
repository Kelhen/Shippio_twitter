<template>
<div>
  <form>
    <h4>{{login ? 'Login' : 'Sign Up'}}</h4>
    <div class="form-row">
      <div class="col-md-4 mb-3">
        <label for="validationDefault01">User name</label>
        <input v-model="name" type="text" class="form-control" placeholder="User name" autofocus required>
      </div>
      <div v-show="!login" class="col-md-4 mb-3">
        <label for="validationDefault02">Email</label>
        <input type="email" v-model="email" placeholder="Your email address" class="form-control" required>
      </div>
      <div class="col-md-4 mb-3">
        <label for="validationDefaultUsername">Password</label>
        <div class="input-group">
          <input type="password" v-on:keyup.13="confirm()" v-model="password" class="form-control" id="validationDefaultUsername" aria-describedby="inputGroupPrepend2" required>
        </div>
      </div>
    </div>
    <button class="btn btn-outline-primary my-3 my-sm-0" @click="confirm()">{{login ? 'login' : 'create an account'}}</button>
    <button class="btn btn-outline-success my-3 my-sm-0" @click="login = !login">{{login ? 'need an account?' : 'have one?'}}</button>
  </form>
</div>
</template>

<script>
import {
  T_USER_ID,
  T_AUTH_TOKEN
} from '../constants/settings'
import {
  CREATE_USER_MUTATION,
  SIGNIN_USER_MUTATION
} from '../constants/graphql'

export default {
  name: 'AppLogin',
  data () {
    return {
      email: '',
      login: true,
      name: '',
      password: ''
    }
  },
  methods: {
    confirm () {
      const {
        name,
        email,
        password
      } = this.$data
      if (this.login) {
        this.$apollo.mutate({
          mutation: SIGNIN_USER_MUTATION,
          variables: {
            name,
            password
          }
        }).then((result, error) => {
          if (!error) {
            const id = result.data.signinUser.user.id
            const token = result.data.signinUser.token
            this.saveUserData(id, token)
          } else {
            this.$router.push({
              path: '/login'
            })
          }
        }).catch((error) => {
          alert(error)
        })
      } else {
        this.$apollo.mutate({
          mutation: CREATE_USER_MUTATION,
          variables: {
            name,
            email,
            password
          }
        }).then((result, error) => {
          if (result) {
            const id = result.data.signinUser.user.id
            const token = result.data.signinUser.token
            this.saveUserData(id, token)
          } else {
            this.$router.push({
              path: '/login'
            })
          }
        }).catch((error) => {
          alert(error)
        })
      }
      this.$router.push({
        path: '/'
      })
    },
    saveUserData (id, token) {
      if (id && token) {
        localStorage.setItem(T_USER_ID, id)
        localStorage.setItem(T_AUTH_TOKEN, token)
        this.$root.$data.userId = localStorage.getItem(T_USER_ID)
      }
    }
  }
}
</script>

<style media="screen">
.container {
  margin-top: 70px;
}
</style>
