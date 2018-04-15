<template>
  <div class="container">
    <h1>My Twitt</h1>
    <create-twitt></create-twitt>
    <h4 v-if="loading">Loading...</h4>
    <span v-if="!myTwitt">Woa, such emply</span>
    <twitt-item
      v-for="twitt in myTwitt"
      :key="twitt.id"
      :twitt="twitt">
    </twitt-item>
  </div>
</template>

<script>
import { MY_TWITT_QUERY } from '../constants/graphql'
import { T_USER_ID } from '../constants/settings'
import TwittItem from './TwittItem'
import CreateTwitt from './CreateTwitt'

export default {
  name: 'MyTwittList',

  data () {
    return {
      myTwitt: null,
      loading: 0
    }
  },
  components: {
    TwittItem,
    CreateTwitt
  },
  apollo: {
    myTwitt: {
      query: MY_TWITT_QUERY,
      variables () {
        return {
          user_id: localStorage.getItem(T_USER_ID)
        }
      }
    }
  }
}
</script>
