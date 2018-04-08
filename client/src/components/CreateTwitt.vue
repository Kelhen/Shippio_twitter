<template>
  <div>
    <form>
      <div class="form-group">
        <textarea class="form-control" id="exampleFormControlTextarea1" v-model="twitt" placeholder="What's new ?" rows="3" maxlength="140"></textarea>
      </div>
      <button @click="createTwitt()" class="btn btn-primary">Twitt me</button>
    </form>
  </div>
</template>

<script>
import { CREATE_TWITT_MUTATION } from '../constants/graphql'

export default {
  name: 'CreateTwitt',
  data () {
    return {
      twitt: ''
    }
  },
  methods: {
    createTwitt () {
      const { twitt } = this.$data
      this.$apollo.mutate({
        mutation: CREATE_TWITT_MUTATION,
        variables: {
          twitt
        }
      })
    }
  }
}
</script>
