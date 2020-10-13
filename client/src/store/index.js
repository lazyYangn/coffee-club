import Vue from 'vue'
import Vuex from 'vuex'
import {Http} from '@/kits/Http'
import {getCachVal} from '@/kits/LocalStorage'

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    // 搜索框内容
    searchInput: '',
    // 路由跳转需要传递的参数
    cartData: [],
  },
  mutations: {
    setSearchInput(state, newVal) {
      state.searchInput = newVal
    },
    initCart(state,data){
      state.cartData = data
    },
    pushCart(state, item) {
      let index = -1
      for (let i = 0; i < state.cartData.length; i++) {
        if(state.cartData[i].food_id == item.food_id){
          index = i
          break
        }
     }
     if(index > -1){
       // this.commit('increaseCart',index) 也可以
       store.commit('increaseCart',index)
     }else{
       state.cartData.push(item)
     }
      },
    increaseCart(state, index) {
      if (state.cartData[index].countbuy < 99) {
        state.cartData[index].countbuy++
      } else {
        return
      }
    },
    decreaseCart(state, index) {
      if (state.cartData[index].countbuy < 1) {
        return
      } else {
        state.cartData[index].countbuy--
      }
    },
    removeCart(state,index){
      if(state.cartData[index].countbuy === 0){
          state.cartData.splice(index,1)
      }
    },
  },
  actions: {
    pushCart(context,item){
        context.commit("pushCart",item)
        let cartitem = context.state.cartData.filter((t)=>(t.id === item.id))
        doCart(item.id,cartitem.length >0 ? cartitem[0].countbuy : 0)
    },
    increaseCart(context,index){
      context.commit("increaseCart",index)
      let cartitem = context.state.cartData[index]
      doCart(cartitem.id,cartitem.countbuy)
    },
    decreaseCart(context,index){
      context.commit("decreaseCart",index)
      let cartitem = context.state.cartData[index]
      doCart(cartitem.id,cartitem.countbuy)
      context.commit("removeCart",index)
  },
    
  },
  getters: {
    priceSum(state) {
      let total = 0
      return '￥' + state.cartData.reduce((pre, item) => pre + item.food_price * item.countbuy, total)
    },
  }
})
const doCart = (goodid,num) => {
  Http("/addfoodcart",{
      userid:getCachVal("userid"),
      goodid,
      num,
  }) 
}
export default store
