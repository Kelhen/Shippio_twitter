import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import { ApolloLink } from 'apollo-link'
import Vue from 'vue'
import VueApollo from 'vue-apollo'
import router from './router'
import moment from 'moment'
import VueMoment from 'vue-moment'
import VueLodash from 'vue-lodash'
import fontawesome from '@fortawesome/fontawesome'
import brands from '@fortawesome/fontawesome-free-brands'
import { faSpinner } from '@fortawesome/fontawesome-free-solid'
import { T_USER_ID, T_AUTH_TOKEN } from './constants/settings'

import App from './App'

Vue.config.productionTip = false
Vue.use(VueMoment, {
  moment
})
Vue.use(VueLodash)

fontawesome.library.add(brands, faSpinner)

const httpLink = new HttpLink({
  uri: 'http://localhost:3000/graphql'
})

const authMiddleware = new ApolloLink((operation, forward) => {
  // add the authorization to the headers
  const token = localStorage.getItem(T_AUTH_TOKEN)
  operation.setContext({
    headers: {
      authorization: token ? `Bearer ${token}` : null
    }
  })

  return forward(operation)
})

const apolloClient = new ApolloClient({
  link: authMiddleware.concat(httpLink),
  cache: new InMemoryCache(),
  connectToDevTools: true
})

Vue.use(VueApollo)

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
  fetchOptions: { method: 'POST' },
  defaultOptions: {
    $loadingKey: 'loading'
  }
})

let userId = localStorage.getItem(T_USER_ID)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  data: {
    userId
  },
  provide: apolloProvider.provide(),
  render: h => h(App)
})
