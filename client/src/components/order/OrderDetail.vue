<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size: 30px; line-height: 60px" @click="goback"></div>
      <div slot="middle">
        <div style="font-size: 20px; line-height: 60px;">订单详情</div>
      </div>
    </top-bar>
    <my-content class="my-contnet">
      <order-detail-item></order-detail-item>
      <order-detail-item></order-detail-item>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from '@/components/topbar/TopBar'
// 引入内容组件
import MyContent from '@/components/content/MyContent'
import OrderDetailItem from '@/components/order/OrderDetailItem'
export default {
  name: "Order",
  data () {
    return {}
  },
  methods: {
    goback () {
      this.$router.go(-1)
    }
  },
  components: { OrderDetailItem, TopBar, MyContent }
}
</script>
<style scoped>
.top-bar {
  background-color: #fff;
}
.my-content {
  padding: 0 !important;
}
</style>
