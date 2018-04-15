<template>
<div class="row">
  <div class="col-1">
    <button v-bind:class="[follow ? 'btn-outline-success' : 'btn-outline-danger']" class="btn btn-sm  my-3 my-sm-0" @click="followHim()">{{ follow ? 'Followed' :'Not Follow' }}</button>
  </div>
  <div class="col-10">
    <h3>{{user.name}}</h3>
  </div>
</div>
</template>

<script>
import FontAwesomeIcon from '@fortawesome/vue-fontawesome'
import Avatar from 'vue-avatar'
import { EDIT_FOLLOW, FOLLOWED_USER } from '../constants/graphql'
import { T_USER_ID } from '../constants/settings'

export default {
  name: 'UserItem',
  props: ['user'],
  components: {
    FontAwesomeIcon,
    Avatar
  },
  data () {
    return {
      followed: [],
      fol: null
    }
  },
  apollo: {
    followed: {
      query: FOLLOWED_USER,
      variables () {
        return {
          user_id: localStorage.getItem(T_USER_ID)
        }
      }
    }
  },
  computed: {
    follow () {
      for (var i = 0; i < this.followed.length; i++) {
        console.log(this.followed[i].followed_id)
        if (this.followed[i].followed_id === this.user.id) {
          console.log('found')
          return true
        }
      }
      console.log('nop')
      return false
    }
  },
  methods: {
    followHim () {
      const userId = localStorage.getItem(T_USER_ID)
      this.$apollo.mutate({
        mutation: EDIT_FOLLOW,
        variables: {
          user_id: userId,
          followed_id: this.user.id
        }
      }).catch((error) => {
        console.error(error)
      })
      this.$router.push({
        path: '/searchuser'
      })
    }
  }
}
</script>

<style lang="scss">
.container {
  padding-top: 40px;
  padding-bottom: 20px;
}

</style>
