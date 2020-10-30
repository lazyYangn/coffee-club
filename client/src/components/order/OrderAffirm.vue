<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size: 30px; line-height: 60px" @click="goback"></div>
      <div slot="middle">
        <div style="font-size: 20px; line-height: 60px;">确认订单</div>
      </div>
    </top-bar>
    <my-content class="my-contnet">
      <div class="main-box">
        <div>
          <order-com-item-card v-for="item in orderlist" :key="item.food_id" :food="item"></order-com-item-card>
        </div>
        <div class="warn-box">
          <div style="background-color:rgb(2 209 38 /.2);padding:0 5px;border-radius:5px;"><span style="color:#k">取餐前请确认数量</span></div>
        </div>
        <div class="order-box">
          <div class="num-box">
            <span style="font-weight:bold;">数量：</span> <span style="font-weight:bold;">{{$store.getters.countSum}}件</span>
          </div>
          <div class=" serve-box">
            <span style="font-weight:bold;">服务费：</span> <span style="font-weight:bold;color:#02d126">￥2.00</span>
          </div>
          <div class="sum1-box">
            <div>
              <span style="font-weight:bold;">合计：</span> <span style="font-weight:bold;color:#02d126">{{$store.getters.priceSum}}</span>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-box">
        <div class="btn-group">
          <div class="btn-left" @click="goto('/problemback')">
            <div class="sum-box">
              <span style="font-weight:bold;">总计：</span> <span style="font-weight:bold;font-size:16px;color:#02d126">￥ {{priceSum}}</span>
            </div>
          </div>
          <div class="btn-right" @click="order">
            <div class="btn-item">提交订单</div>
          </div>
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
      orderlist: []
    }
  },
  created () {
    this.orderlist = this.$store.state.cartData
  },
  methods: {
    goback () {
      this.$router.go(-1)
    },
    goto (path) {
      this.$router.push(path)
    },
    async order () {
      let res = await this.$store.dispatch("order")
      if (res.code === 1) {
        this.$router.push({ path: '/payment' })
      } else {
        this.$message.error(res.msg)
      }

    }
  },
  components: { TopBar, MyContent, OrderComItemCard },
  computed: {
    priceSum () {
      return (this.$store.getters.priceSum + 2.0 * 1).toFixed(2)
    }
  }
}
</script>
<style scoped>
.top-bar {
  background-color: #fff;
}
.my-content {
  padding: 30px 10px !important;
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
  border-radius: 10px;
}
.warn-box {
  margin-top: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
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
.order-box {
  padding: 10px;
  background-color: #fff;
  border-radius: 10px;
}
.num-box {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
.serve-box {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
.sum1-box {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
.footer-box {
  background-color: #fff;
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
}
.order-info {
  background-color: #fff;
  display: flex;
  flex-direction: column;
  padding: 10px;
  position: relative;
}
.btn-group {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}
.btn-left {
  flex: 2;
  display: flex;
  justify-content: flex-end;
}
.btn-right {
  margin: 5px 0;
  flex: 1;
  display: flex;
  justify-content: center;
}
.btn-item {
  width: 100px;
  height: 45px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 25px;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  background-color: #02d126;
}
</style>
