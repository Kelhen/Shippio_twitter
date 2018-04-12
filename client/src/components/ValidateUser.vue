<template>
<div class="container">
  <a href="/login">
    <div class="btn btn-outline-success col-sm-12">
      <h4>You can now login :) clic here to go login</h4>
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

  methods: {
    createTwitt () {
      const validationToken = this.$route.query.validationToken
      const name = this.$route.query.name
      alert(validationToken, name)
      if (!validationToken || !name) {
        console.error('arguments for validation are missing')
        return
      }

      this.$apollo.mutate({
        mutation: VALIDATE_USER_MUTATION,
        variables: {
          name: name,
          povalidationToken: validationToken
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
