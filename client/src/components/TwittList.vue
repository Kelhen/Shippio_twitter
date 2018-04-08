<template>
  <div>
    <create-twitt></create-twitt>
    <h4 v-if="loading">Loading...</h4>
    <span v-if="!allTwitt">Woa, such emply</span>
    <twitt-item
      v-for="twitt in allTwitt"
      :key="twitt.id"
      :twitt="twitt">
    </twitt-item>
  </div>
</template>

<script>
import { ALL_TWITT_QUERY } from '../constants/graphql'
import TwittItem from './TwittItem'
import CreateTwitt from './CreateTwitt'

export default {
  name: 'TwittList',

  data () {
    return {
      allTwitt: null,
      loading: 0
    }
  },
  components: {
    TwittItem,
    CreateTwitt
  },
  apollo: {
    allTwitt: {
      query: ALL_TWITT_QUERY,
      variables: {
        orderBy: {field: 'id', direction: 'DESC'}
      }
    }
  }
}
</script>
