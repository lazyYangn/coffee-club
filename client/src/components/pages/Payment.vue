<template>
  <div>
    <top-bar class="top-bar">
      <div slot="middle">支付成功</div>
    </top-bar>
    <my-content class="my-contnet">
      <div class="pay-box">
        <div class="icon-box">
          <span style="font-size:150px" class="iconfont icon-wancheng"></span>
        </div>
        <div class="pay-text">支付完成</div>
        <div class="footer-btn" @click="gotoOrder">
          <div class="btn-item">查看订单</div>
        </div>
        <div class="footer-btn" @click="gotoHome">
          <div class="btn-item">回到首页</div>
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
    gotoOrder () {
      this.$router.push('/order')
    },
    gotoHome(){
      this.$router.push('/')
    }
  },
  components: {
    TopBar,
    MyContent,
  }
}
</script>
<style scoped>
.pay-box {
  display: flex;
  flex-direction: column;
}
.icon-box {
  font-size: 200px;
  color: #02d126;
  display: flex;
  justify-content: center;
}
.pay-text {
  display: flex;
  justify-content: center;
  font-size: 32px;
  font-weight: bold;
  color: #bbb;
}
.footer-btn {
  margin-top: 45px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.btn-item {
  width: 260px;
  height: 50px;
  background-color: #ddd;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 18px;
  font-weight: bold;
  border-radius: 10px;
}
.top-bar {
  background-color: #fff;
}
.my-content {
  padding: 0 !important;
}
</style>