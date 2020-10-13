<template>
  <div style="margin-top:10px;background-color: #fff;">
    <div class="order-state">
      <div>该订单已完成</div>
      <div class="iconfont icon-iconfontjiantou5"></div>
    </div>
    <div class="order-box">
      <order-detail-item-card></order-detail-item-card>
      <order-detail-item-card></order-detail-item-card>
    </div>
    <div class="order-info">
      <div><span style="font-weight:bold;">支付方式：</span>在线支付</div>
      <div style="margin:5px 0px"> <span style="font-weight:bold;">订单编号：</span>12345678901234</div>
      <div><span style="font-weight:bold;">下单时间：</span> 2020-10-09 19:43:22</div>
    </div>
    <div class="btn-group">
      <div class="btn-item" @click="goto('/problemback')">问题反馈</div>
    </div>
  </div>
</template>
<script>
import OrderDetailItemCard from '@/components/order/OrderDetailItemCard'
export default {
  name: "OrderDetailItem",
  data () {
    return {
      // 订单状态
      accomplishflag: false,
      // 订单是否取消
      isCancel: true
    };
  },
  watch: {
    activeKey (key) {
      console.log(key);
    },
  },
  methods: {
    goto (path) {
      this.$router.push(path)
    },
    handleClick (event) {
      // If you don't want click extra trigger collapse, you can prevent this:
      event.stopPropagation();
    },
  },
  components: {
    OrderDetailItemCard
  }
}
</script>
<style scoped>
.order-state {
  padding: 10px 10px;
  border-bottom: 1px #eee solid;
  font-size: 18px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.order-box {
  background-color: #fff;
  display: flex;
  padding: 0px 10px 10px 10px;
  flex-direction: column;
  border-bottom: 1px #eee solid;
}
.order-info {
  display: flex;
  flex-direction: column;
  padding: 10px;
}
.btn-group {
  position: relative;
  padding: 0 10px 35px 10px;
}
.btn-item {
  position: absolute;
  width: 90px;
  height: 35px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 10px;
  right: 10px;
  top: -8px;
  color: #fff;
  font-size: 16px;
  font-weight: bold;
  background-color: #02d126;
}
</style>