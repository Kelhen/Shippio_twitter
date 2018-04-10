<template>
  <div class="container">
    <h4 >{{login ? 'Login' : 'Sign Up'}}</h4>
    <div >
      <input
        v-show="!login"
        v-model="name"
        type="text"
        placeholder="Your name">
      <input
        v-model="email"
        type="text"
        placeholder="Your email address">
      <input v-on:keyup.13="confirm()"
        v-model="password"
        type="password"
        placeholder="Password">
    </div>
    <div >
      <div class='pointer button'
        @click="confirm()">
        {{login ? 'login' : 'create an account'}}
      </div>
      <div
        class='pointer button'
        @click="login = !login">
        {{login ? 'need an account?' : 'have one?'}}
      </div>
    </div>
  </div>
</template>

<script>
import { T_USER_ID, T_AUTH_TOKEN } from '../constants/settings'
import { CREATE_USER_MUTATION, SIGNIN_USER_MUTATION } from '../constants/graphql'

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
      const { name, email, password } = this.$data
      if (this.login) {
        this.$apollo.mutate({
          mutation: SIGNIN_USER_MUTATION,
          variables: {
            email,
            password
          }
        }).then((result) => {
          const id = result.data.signinUser.user.id
          const token = result.data.signinUser.token
          this.saveUserData(id, token)
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
        }).then((result) => {
          const id = result.data.signinUser.user.id
          const token = result.data.signinUser.token
          this.saveUserData(id, token)
        }).catch((error) => {
          alert(error)
        })
      }
      this.$router.push({path: '/'})
    },
    saveUserData (id, token) {
      localStorage.setItem(T_USER_ID, id)
      localStorage.setItem(T_AUTH_TOKEN, token)
      this.$root.$data.userId = localStorage.getItem(T_USER_ID)
    }
  }
}
</script>

<style media="screen">
.container{
  margin-top: 70px;
}
</style>
