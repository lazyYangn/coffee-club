import Vue from 'vue'
import Vuex from 'vuex'
import {Http} from '@/kits/Http'
import { getCacheVal } from "@/kits/LocalStorage";

Vue.use(Vuex)

const store = new Vuex.Store({
  state: {
    // 搜索框内容
    searchInput: '',
    // 路由跳转需要传递的参数
    cartData: [],
    orderInfo:{},
    selectedOrder:{}
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
    resetCart(state){
      state.cartData = []
    },
    setSelectedOrder(state,item){
      state.selectedOrder = item
  }
    
  },
  actions: {
    pushCart(context,item){
      context.commit("pushCart",item)
      let cartitem = context.state.cartData.filter((t)=>(t.food_id === item.food_id))
      doCart(item.food_id,cartitem.length >0 ? cartitem[0].countbuy : 0,item.skus)
    },
    increaseCart(context,index){
      context.commit("increaseCart",index)
      let cartitem = context.state.cartData[index]
      doCart(cartitem.food_id,cartitem.countbuy,cartitem.cartskus)
    },
    decreaseCart(context,index){
      context.commit("decreaseCart",index)
      let cartitem = context.state.cartData[index]
      doCart(cartitem.food_id,cartitem.countbuy,cartitem.cartskus)
      context.commit("removeCart",index)
    },
    removeCart(context,index){
      let cartitem = context.state.cartData[index]
      doCart(cartitem.food_id,0,cartitem.cartskus)
      context.state.cartData[index].countbuy = 0
      context.commit("removeCart",index)
    },
    async order(context){
      const p = {
          userid:getCacheVal("userid"),
          orderlist:context.state.cartData,
          countSum:context.getters.countSum,
          priceSum:context.getters.priceSum,
      }
      try {
          let res = await Http("/createorder",p)
          console.log(res)
          if (res.code === 1) {
              await Http("/resetcart",{
                  userid:getCacheVal("userid")
              })
              context.commit('resetCart')
              return res
          }
      } catch (e) {
          return e
      }
  }
    
  },
  getters: {
    priceSum(state) {
      let total = 0
      return state.cartData.reduce((pre, item) => pre + item.food_price * item.countbuy, total)
    },
    countSum(state){
      let total = 0
      return state.cartData.reduce((pre, item) => pre + item.countbuy, total)
    }
  }
})
const doCart = (foodid,num,skus) => {
  Http("/addfoodcart",{
      userid:getCacheVal("userid"),
      foodid,
      num,
      skus
  }) 
}
export default store
