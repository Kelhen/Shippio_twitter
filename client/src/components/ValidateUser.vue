<template>
<div class="container">
  <a href="/login">
    <div @click="validate()" class="btn btn-outline-success col-sm-12">
      <h4>clic to validate your account</h4>
    </div>
  </a>
</div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import {
  VALIDATE_USER_MUTATION
} from '../constants/graphql'

export default {
  name: 'ValidateUser',
  components: {
    FontAwesomeIcon
  },

  data () {
    return {
      validation: false,
      login: false
    }
  },
  // apollo: {
  //   feed: {
  //     mutation: VALIDATE_USER_MUTATION,
  //     variables: {
  //       name: this.$route.query.name,
  //       povalidationToken: this.$route.query.validationToken
  //     }
  //   }
  // },
  methods: {
    validate () {
      const validationToken = this.$route.query.validation_token
      const name = this.$route.query.name
      alert(validationToken, name)
      if (!validationToken || !name) {
        console.error('arguments for validation are missing')
        console.log(validationToken, name)
        return
      }
      this.$apollo.mutate({
        mutation: VALIDATE_USER_MUTATION,
        variables: {
          name: name,
          token: validationToken
        }
      }).then((data) => {
        this.$router.push({
          path: '/login'
        })
      }).catch((error) => {
        console.error(error)
      })
    }
  }
}
</script>
<style media="screen">
.container {
  margin-top: 70px;
}
</style>
