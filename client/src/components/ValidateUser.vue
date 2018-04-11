<template>
  <div class="container">
    <div class="border border-success">
      You can now login :)
    </div>
  </div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import { VALIDATE_USER_MUTATION } from '../constants/graphql'

export default {
  name: 'ValidateUser',
  components: {
    FontAwesomeIcon
  },

  data () {
    return {
      validation: false
    }
  },

  methods: {
    createTwitt () {
      const validationToken = this.$route.query.validationToken
      const email = this.$route.query.email
      alert(validationToken, email)
      if (!validationToken || !email) {
        console.error('arguments for validation are missing')
        return
      }

      this.$apollo.mutate({
        mutation: VALIDATE_USER_MUTATION,
        variables: {
          email: email,
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
