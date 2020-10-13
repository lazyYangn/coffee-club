<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size: 30px; line-height: 60px;" @click="goback"></div>
      <div slot="middle">
        <div style="font-size: 18px; line-height:10px;">关于coffee-club</div>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div class="about-box">
        <div class="about-item">
          <div>新版本检测</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-item">
          <div>版权信息</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-item">
          <div>软件许可使用协议</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-item">
          <div>平台服务协议</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-item">
          <div>隐私权政策</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-item">
          <div>证照信息</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-item" style="border-bottom:none;">
          <div>帮助中心</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
      </div>
      <div class="version-box">
        当前版本号:1.1.0
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
    return {}
  },
  methods: {
    goback () {
      this.$router.go(-1)
    }
  },
  components: {
    TopBar,
    MyContent
  }
}
</script>
<style scoped>
.my-content {
  padding: 0 !important;
}
.about-box {
  margin-top: 10px;
}
.about-item {
  display: flex;
  padding: 15px 20px;
  justify-content: space-between;
  background-color: #fff;
  position: relative;
}
.about-item::after {
  content: "";
  width: 100%;
  position: absolute;
  bottom: 0;
  border-bottom: solid #eee 1px;
}
.version-box {
  margin-top: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>