<template>
<div class="container">
  <form>
    <div class="form-group"><span class="float-right">{{charactersLeft}}</span>
      <textarea class="form-control" id="twitt" v-model="twitt" placeholder="What's new ?" name="twitt" rows="3" minlength=1 maxlength="140"></textarea>
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

import {
  T_USER_ID
} from '../constants/settings'

export default {
  name: 'CreateTwitt',

  data () {
    return {
      twitt: ''
    }
  },
  computed: {
    charactersLeft () {
      let char = this.$data.twitt.length
      let limit = 140

      return (limit - char) + ' / ' + limit + ' characters remaining (wep old fashion)'
    }
  },
  methods: {
    createTwitt () {
      const postedById = localStorage.getItem(T_USER_ID)
      if (!postedById) {
        console.error('No user logged in')
        return
      }

      const newTwitt = this.twitt
      this.twitt = ''

      this.$apollo.mutate({
        mutation: CREATE_TWITT_MUTATION,
        variables: {
          twitt: newTwitt,
          postedById
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
.container {
  padding-top: 40px;
  padding-bottom: 20px;
}

textarea {
  width: auto;
  resize: vertical;
}
</style>
