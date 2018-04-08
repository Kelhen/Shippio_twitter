import Vue from 'vue'
import Router from 'vue-router'

import TwittList from '@/components/TwittList'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'TwittList',
      component: TwittList
    }
  ],
  // no hash in the url
  mode: 'history'
})
