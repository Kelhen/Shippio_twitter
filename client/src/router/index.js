import Vue from 'vue'
import Router from 'vue-router'

import TwittList from '@/components/TwittList'
import AppLogin from '@/components/AppLogin'
import ValidateUser from '@/components/ValidateUser'
import MyProfile from '@/components/MyProfile'
import UserList from '@/components/UserList'

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
    },
    {
      path: '/searchuser',
      component: UserList
    }
  ],
  // no hash in the url
  mode: 'history'
})
