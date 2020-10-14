<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size: 30px; line-height: 60px" @click="goback"></div>
      <div slot="middle">
        <div style="font-size: 20px; line-height: 60px;">全部订单</div>
      </div>
    </top-bar>
    <my-content class="my-contnet">
      <div class="order-box" v-for="item in orderList" :key="item.id">
        <div class="order-item-box">
          <div class="goods-box" v-for="item1 in item.foodList" :key="item1.food_id">
            <div class="goods-img" :style="imgStyle(item1.food_pic)"></div>
            <div class="goods-name">{{item1.food_name}}</div>
          </div>
        </div>
         <div class="text-order">
          <div>订单号：{{item.id}}</div>
        </div>
        <div class="text-order">
          <div>下单时间：{{item.orderdate}}</div>
          <div>合计：<span style="font-size:16px;font-weight:bold;">￥ {{item.pricesum}}</span></div>
        </div>
        <div class="order-footer" @click="goto('orderdetail',item)">
          <div>查看订单详情</div>
          <div class="iconfont icon-iconfontjiantou5" style="color: #262626;font-size:14px;"></div>
        </div>
        <div class="order-more">
          <a-collapse :expand-icon-position="expandIconPosition">
            <a-collapse-panel key="1" header="订单状态">
              <div style="padding:0 10px">
                <a-steps progress-dot :current="item.status" direction="vertical">
                  <a-step title="支付完成" description="支付完成"  />
                  <a-step title="备餐中" description="支付完成，后厨忙碌中"  />
                  <a-step title="待取餐" description="支付完成,等待取餐"  />
                  <a-step title="取餐完成" description="您已取餐，订单已完成" />
                </a-steps>
              </div>
            </a-collapse-panel>
          </a-collapse>
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
import { HttpGql, ImgUrl } from '@/kits/Http'
import { getCacheVal } from '@/kits/LocalStorage'
export default {
  data () {
    return {
      expandIconPosition: 'right',
      start:0,
      count:5,
      orderList:[]
    }
  },
  created() {
    this.initData()
  },
  methods: {
    goback () {
      this.$router.go(-1)
    },
    goto (name,item) {
        this.$store.commit("setSelectedOrder",item)
        this.$router.push({name})
    },
    handleClick (event) {
      // If you don't want click extra trigger collapse, you can prevent this:
      event.stopPropagation();
    },
    async initData(){
      let gql = {
        query: `
          {
            userOrder(u_id:"${getCacheVal('userid')}",start:${this.start},count:${this.count}){
            id
            pricesum
            countsum
            orderdate
            status
            foodList{
              id
              cartskus
              food_name
              food_price
              food_pic
              countbuy
              food_id
              cartskus
            }
          }
          }
        `
      }
      let res = await HttpGql(gql)
      console.log(res)
      this.orderList = res.data.userOrder
      this.orderList.forEach(item => {
        item.foodList.forEach(item1=>{
          item1.cartskus =  item1.cartskus.split('_')
        })
       
      });
    }
  },
  components: {
    TopBar,
    MyContent,
  },
  watch: {
    activeKey (key) {
      console.log(key);
    },
  },
  computed: {
    imgStyle(){
      return (url)=>{
        return {
          backgroundImage:`url(${url})`,
          backgroundSize:'cover',
          backgroundPosition:'center center'
        }
      }
    }
  }
}
</script>
<style scoped>
.top-bar {
  background-color: #fff;
}
.my-content {
  padding: 0 !important;
}
.goods-box {
  display: flex;
  flex-direction: column;
  height: 110px;
  width: 100px;
  justify-content: center;
  align-items: center;
  margin-left: 10px;
}
.goods-img {
  background-color: #ccc;
  height: 80px;
  width: 80px;
  border-radius: 10px;
}
.goods-name {
  max-width: 80px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.order-box {
  background-color: #fff;
  position: relative;
}
.order-item-box {
  display: flex;
  overflow-x: auto;
  margin-top: 16px;
}
.text-order {
  padding: 10px 16px;
  display: flex;
  justify-content: space-between;
  color: #262626;
}
.order-footer {
  display: flex;
  padding: 10px 16px;
  justify-content: space-between;
  align-items: center;
  color: #262626;
}
.ant-collapse {
  background-color: #f5f5f5 !important;
  border: none;
}
.ant-collapse-item {
  background-color: #fff !important;
  border-radius: 0 0 20px 20px !important;
  border: 0px;
  box-shadow: 0 10px 20px -15px rgb(0 0 0 /0.3);
}
</style>