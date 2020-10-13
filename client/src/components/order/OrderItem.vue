<template>
  <div>
    <div class="order-box">
      <div class="order-item-box">
        <order-item-card></order-item-card>
        <order-item-card></order-item-card>
        <order-item-card></order-item-card>
        <order-item-card></order-item-card>
        <order-item-card></order-item-card>
        <order-item-card></order-item-card>
        <order-item-card></order-item-card>
      </div>
      <div class="text-order">
        <div>下单时间：2020-10-11 13:34:00</div>
        <div>合计：<span style="font-size:16px;font-weight:bold;">￥53</span></div>
      </div>
      <div class="order-footer" @click="goto('/orderdetail')">
        <div>查看订单详情</div>
        <div class="iconfont icon-iconfontjiantou5" style="color: #262626;font-size:14px;"></div>
      </div>
      <div class="order-more">
        <a-collapse :expand-icon-position="expandIconPosition">
          <a-collapse-panel key="1" header="订单状态">
            <div style="padding:0 10px">
              <a-steps progress-dot :current="1" direction="vertical">
                <a-step title="待支付" description="您还未支付请先支付" status="finish" />
                <a-step title="支付完成" description="支付完成" status="wait" />
                <a-step title="待取餐" description="支付完成,等待取餐" />
                <a-step title="取餐完成" description="您已取餐，订单已完成" />
              </a-steps>
            </div>
          </a-collapse-panel>
        </a-collapse>
      </div>
    </div>
  </div>
</template>
<script>
// 引入订单单个组件
import OrderItemCard from '@/components/order/OrderItemCard'
export default {
  data () {
    return {
      expandIconPosition: 'right',
    }
  },
  methods: {
    goback () {
      this.$router.go(-1)
    },
    goto (path) {
      this.$router.push(path)
    },
    handleClick (event) {
      // If you don't want click extra trigger collapse, you can prevent this:
      event.stopPropagation();
    },
  },
  watch: {
    activeKey (key) {
      console.log(key);
    },
  },
  components: {
    OrderItemCard
  }
}
</script>
<style scoped>
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