<template>
<div class="container">
  <form>
    <div class="form-group">
      <textarea class="form-control" id="exampleFormControlTextarea1" v-model="twitt" placeholder="What's new ?" rows="3" maxlength="140"></textarea>
    </div>
    <button @click="createTwitt()" class="btn btn-primary">Twitt me</button>
  </form>
</div>
</template>

<script >
/* eslint camelcase: "error" */
import {
  CREATE_TWITT_MUTATION,
  ALL_TWITT_QUERY
} from '../constants/graphql'

export default {
  name: 'CreateTwitt',

  data () {
    return {
      twitt: ''
    }
  },
  methods: {
    createTwitt () {
      const {
        twitt
      } = this.$data
      this.$apollo.mutate({
        mutation: CREATE_TWITT_MUTATION,
        variables: {
          twitt
        },
        update: (store, {
          data: {
            id,
            createTwitt
          }
        }) => {
          const data = store.readQuery({
            query: ALL_TWITT_QUERY
          })
          data.allTwitt.push(createTwitt)
          store.writeQuery({
            query: ALL_TWITT_QUERY,
            data
          })
        }
      }).then((data) => {
        this.$router.push({
          path: '/'
        })
      }).catch((error) => {
        console.error(error)
      })
    }
  }
}
</script>

<style media="screen">
.container{
  padding-top: 40px;
  padding-bottom: 20px;
}
textarea {
  width: auto;
  resize: vertical;
}
</style>
