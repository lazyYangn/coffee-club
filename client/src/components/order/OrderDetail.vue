<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size: 30px; line-height: 60px" @click="goback"></div>
      <div slot="middle">
        <div style="font-size: 20px; line-height: 60px;">订单详情</div>
      </div>
    </top-bar>
    <my-content class="my-contnet">
      <div class="top-box">
        <div class="order-state">
          <div>订单明细</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
      </div>
      <div class="main-box">
        <order-com-item-card v-for="item in order.foodList" :food="item" :key="item.food_id"></order-com-item-card>
      </div>
      <div class="footer-box">
        <div class="order-info">
          <div class="sum-box">
            <div class="sum-item">
              <span style="font-weight:bold;font-size:16px">总价：</span> <span style="font-weight:bold;font-size:18px;color:#02d126">￥ {{order.pricesum}}</span>
            </div>
          </div>
          <div><span style="font-weight:bold;">支付方式：</span>在线支付</div>
          <div style="margin:10px 0px"> <span style="font-weight:bold;">订单编号：</span>{{order.id}}</div>
          <div><span style="font-weight:bold;">下单时间：</span> {{order.orderdate}}</div>
        </div>
        <div class="btn-group">
          <div class="btn-item" @click="goto('/problemback')">问题反馈</div>
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
import OrderComItemCard from '@/components/order/OrderComItemCard'
export default {
  name: "Order",
  data () {
    return {
      order:{}
    }
  },
  created() {
     this.order = this.$store.state.selectedOrder
  },
  methods: {
    goback () {
      this.$router.go(-1)
    },
    goto (path) {
      this.$router.push(path)
    }
  },
  components: { TopBar, MyContent, OrderComItemCard }
}
</script>
<style scoped>
.top-bar {
  background-color: #fff;
}
.my-content {
  padding: 0 !important;
}

.top-box {
  background-color: #fff;
  position: fixed;
  right: 0;
  left: 0;
}

.order-state {
  padding: 10px 10px;
  font-size: 18px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.main-box {
  background-color: #fff;
  padding: 10px;
  height: 100%;
  margin-top: 30px;
}

.item-box {
  margin-top: 10px;
  display: flex;
}
.good-img {
  width: 80px;
  height: 80px;
  background-color: #ccc;
  border-radius: 10px;
}
.good-info {
  flex: 8;
  padding-left: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.good-price {
  font-size: 24px;
  font-weight: bold;
  display: flex;
  justify-content: center;
  align-items: center;
}
.footer-box {
  background-color: #fff;
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
}
.sum-box {
  margin-bottom: 10px;
  position: relative;
  height: 20px;
}
.sum-item {
  position: absolute;
  right: 10px;
}
.order-info {
  display: flex;
  flex-direction: column;
  padding: 10px;
}
.btn-group {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}
.btn-item {
  margin: 10px 0;
  width: 90%;
  height: 45px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  background-color: #02d126;
}
</style>
