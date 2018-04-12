import Vue from 'vue'
import Router from 'vue-router'

import TwittList from '@/components/TwittList'
import AppLogin from '@/components/AppLogin'
import ValidateUser from '@/components/ValidateUser'
import MyProfile from '@/components/MyProfile'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'TwittList',
      component: TwittList
    },
    {
      path: '/login',
      component: AppLogin
    },
    {
      path: '/validation',
      component: ValidateUser
    },
    {
      path: '/me',
      component: MyProfile
    }
    // {
    //   path: '/Twitt/:twittid',
    //   component: MyProfile
    // }
  ],
  // no hash in the url
  mode: 'history'
})
