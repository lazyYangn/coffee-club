<template>
  <div style="margin-top:10px;">
    <div class="order-box">
      <div class="order-good-info">
        <div class="order-good-img"></div>
        <div class="order-good-desc">
          <div style="font-weight:bold;font-size:20px;font-weight:bold;">商品名称咖啡</div>
          <div style="font-size:20px;margin:10px 0;color:#02d126">￥32.00</div>
          <!-- 订单完成状态 -->
          <div class="iconfont icon-wancheng icon-box" v-if="accomplishflag"></div>
          <!-- 订单关闭状态 -->
          <div class="iconfont icon-guanbi icon-box" style="color:#e74c3c" v-else-if="isCancel"></div>
          <!-- 订单等待状态 -->
          <div class="iconfont icon-dengdai icon-box" style="font-size:28px;color:#f39c12" v-else></div>
        </div>
      </div>
      <div class="order-info">
        <div class="order-id"> <span style="font-weight:bold;">订单编号：</span>12345678901234</div>
        <div style="margin-top:5px"><span style="font-weight:bold;">创建订单时间：</span> 2020-10-09 19:43:22</div>
      </div>
    </div>
    <div class="order-more">
      <a-collapse :expand-icon-position="expandIconPosition">
        <a-collapse-panel key="1" header="订单详情">
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
</template>
<script>
export default {
  data () {
    return {
      expandIconPosition: 'right',
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
    handleClick (event) {
      // If you don't want click extra trigger collapse, you can prevent this:
      event.stopPropagation();
    },
  },
}
</script>
<style scoped>
.order-box {
  background-color: #fff;
  display: flex;
  padding: 20px;
  flex-direction: column;
}
.order-good-info {
  display: flex;
  position: relative;
}

.order-good-img {
  height: 80px;
  width: 80px;
  background-color: #eee;
  margin-right: 20px;
}
.order-good-desc {
  display: flex;
  flex-direction: column;
}
.order-info {
  display: flex;
  flex-direction: column;
  margin-top: 20px;
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
.iconfont {
  font-size: 30px;
  color: #02d126;
}
.icon-box {
  position: absolute;
  right: 10px;
  top: 20px;
}
</style>