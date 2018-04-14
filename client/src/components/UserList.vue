<template>
  <div class="container">
    <h4 v-if="loading">Loading...</h4>
    <span v-if="!allUser">Woa, such emply</span>
    <user-item
      v-for="user in allUser"
      :key="user.id"
      :user="user">
    </user-item>
  </div>
</template>

<script>
import { ALL_USER } from '../constants/graphql'

// import { ALL_USER, FOLLOWED_USER } from '../constants/graphql'
// import { T_USER_ID } from '../constants/settings'
import UserItem from './UserItem'

export default {
  name: 'UserList',

  data () {
    return {
      allUser: null,
      loading: 0
    }
  },
  components: {
    UserItem
  },
  apollo: {
    allUser: {
      query: ALL_USER
    }
    // followed: {
    //   query: FOLLOWED_USER,
    //   variables () {
    //     return {
    //       user_id: localStorage.getItem(T_USER_ID)
    //     }
    //   }
    // }
  },
  computed: {
    img () {
      return this.myUser.image
    }
  }
}
</script>
