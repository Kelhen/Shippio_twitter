<template>
  <div>
    <h4 v-if="loading">Loading...</h4>
    <span v-if="allTwitt">Woa, such emply</span>
    <twitt-item
      v-for="twitt in allTwitt"
      :key="twitt.id"
      :twitt="twitt.twitt">
    </twitt-item>
  </div>
</template>

<script>
import { ALL_TWITT_QUERY } from '../constants/graphql'
import TwittItem from './TwittItem'

export default {
  name: 'TwittList',

  method: 'POST',
  data () {
    return {
      allTwitt: [],
      loading: 0
    }
  },
  components: {
    TwittItem
  },
  apollo: {
    allTwitt: {
      query: ALL_TWITT_QUERY
    }
  }
}
</script>
