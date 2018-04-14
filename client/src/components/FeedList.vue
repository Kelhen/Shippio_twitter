<template>
  <div>
    <create-twitt></create-twitt>
    <h4 v-if="loading">Loading...</h4>
    <span v-if="!feed">Woa, such emply</span>
    <twitt-item
      v-for="twitt in feed"
      :key="twitt.id"
      :twitt="twitt">
    </twitt-item>
  </div>
</template>

<script>
import { FEED_QUERY } from '../constants/graphql'
import {T_USER_ID} from '../constants/settings'
import TwittItem from './TwittItem'
import CreateTwitt from './CreateTwitt'

export default {
  name: 'FeedList',

  data () {
    return {
      feed: null,
      loading: 0
    }
  },
  components: {
    TwittItem,
    CreateTwitt
  },
  apollo: {
    feed: {
      query: FEED_QUERY,
      variables () {
        return {
          user_id: localStorage.getItem(T_USER_ID)
        }
      }
    }
  }
}
</script>
