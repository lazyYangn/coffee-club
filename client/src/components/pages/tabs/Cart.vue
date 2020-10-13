<template>
  <div>
    <top-bar>
      <div slot="left">
      </div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:18px;line-height: 60px;">购物袋</div>
      </div>
    </top-bar>
    <my-content class="mycontent">
      <div class="main-box">
        <a-list :grid="{ gutter: 16, column: 1 }" :data-source="$store.state.cartData">
        <a-list-item slot="renderItem" slot-scope="item,index">
           <cart-product-card  
        :index="index"
        :product="item"></cart-product-card>
        </a-list-item>
      </a-list>
      </div>
      <div class="cart-footer">
        <div class="price-box">
          <div class="price-total">
            <div class="item-s1">总价</div>
            <div class="item-s2">{{$store.getters.priceSum}}</div>
          </div>
        </div>
        <div class="pay-btn">
          安全支付
        </div>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from '@/components/topbar/TopBar'
// 引入内容组件
import MyContent from '@/components/content/MyContent'
// 引入购物车单品组件
import CartProductCard from '@/components/product/CartProductCard'
import { getCacheVal } from '@/kits/LocalStorage'
import { HttpGql, ImgUrl } from '@/kits/Http'

export default {
  data() {
    return {}
  },
  methods: {
    goto() {
      this.$router.go(-1)
    },
   async initData(){
       
       if(getCacheVal("token") && getCacheVal("token").length > 0 ){
        let userid = getCacheVal('userid')
        let gql = {
        query: `
                {
                    usercart(u_id:"${userid}"){
                    food_name
                    food_pic
                    food_price
                    countbuy
                  }
                }
            `
      }
      let res = await HttpGql(gql)
      this.$store.commit("initCart",res.data.usercart ? res.data.usercart.map((item)=>{
          item.food_pic = ImgUrl + item.food_pic
          return item
        }) : [])
      }else{
        console.log('请登录')
      }
      
    }
  },
  components: {
    TopBar,
    MyContent,
    CartProductCard,
  },
  created () {
    this.initData()
  }
}
</script>
<style scoped>
.mycontent{
  position: relative;
}
.price-box {
  display: flex;
  flex-direction: column;
  margin-top: 10px;
}
.price-item {
  display: flex;
  padding: 3px 0px;
}
.price-total {
  display: flex;
  font-weight: bold;
  padding: 3px 0px;
  font-size: 16px;
}
.item-s1 {
  flex: 8;
  display: flex;
  justify-content: flex-end;
}
.item-s2 {
  flex: 2;
  display: flex;
  justify-content: flex-end;
}
.pay-btn {
  margin-top: 10px;
  width: 100%;
  height: 50px;
  background-color: #02d126;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 20px;
  font-weight: bold;
}
.cart-footer{
  width: 100%;
  position: fixed;
  bottom: 65px;
  left:0px;
  right: 0px;
  padding: 10px 24px;
}
</style>
