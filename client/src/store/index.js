import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // 搜索框内容
    searchInput: '',
    // 路由跳转需要传递的参数
    routerVal: null,
  },
  mutations: {
    setSearchInput(state, newVal) {
      state.searchInput = newVal
    },
    // 路由跳转参数
    setRouterVal(state, newVal) {
      state.routerVal = newVal
    },
  },
})
