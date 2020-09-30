<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left" class="top-left">
        <span class="iconfont icon-caidan" style="color:#fff;"></span>
      </div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:20px;line-height: 60px;color:#fff; ">菜单</div>
      </div>
      <div slot="right">
        <span class="iconfont icon-shezhi" style="color:#fff;"></span>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div class="img-content">
        <div class="user">
          <div class="user-name">张三</div>
          <div class="user-desc">asdfghjkl;'wertyui</div>
        </div>
        <div class="zx-box">
          <span class="iconfont icon-zhaoxiangji" style="font-size: 56px;color:#fff;"></span>
        </div>
      </div>
      <div class="btn-content">
        <div class="user-menu">
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
          <div class="menu-item">
            <div class="item-num">33</div>
            <div class="item-title">喜欢</div>
          </div>
        </div>
        <div class="user-desc-box">
          1ssssqwertyuiopasdfghjklzxcvbnm,.wertyu1ssssqwertyuiopasdfghjklzxcvbnm,.wertyu1ssssqwertyuiopasdfghjklzxcvbnm,
        </div>
        <div class="btn-box">
          关注
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
  name: 'Account',
  data () {
    return {}
  },
  methods: {},
  components: {
    TopBar,
    MyContent
  }
}
 </script>
<style scoped>
.top-bar {
  background-color: rgb(0 0 0 /0);
}
.my-content {
  padding: 0 !important;
}
.main-content {
  position: relative;
}
.img-content {
  background-color: #808080;
  height: 55%;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 0;
}
.btn-content {
  background-color: #f7f7ff;
  border-radius: 25px 25px 0 0;
  height: 50%;
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 2;
  padding: 20px;
  display: flex;
  flex-direction: column;
}
.user-name {
  font-size: 24px;
  padding: 0 20px;
  font-weight: bold;
  color: #fff;
  position: absolute;
  bottom: 80px;
}
.user-desc {
  font-size: 16px;
  padding: 0 20px;
  color: #fff;
  position: absolute;
  bottom: 50px;
}
.zx-box {
  padding: 0 20px;
  color: #fff;
  position: absolute;
  bottom: 35px;
  right: 0px;
}
.user-menu {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.menu-item {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  flex: 1;
}
.item-num {
  font-size: 24px;
  font-weight: bold;
}
.item-title {
  font-size: 16px;
}
.user-desc-box {
  margin-top: 20px;
  padding: 0 30px;
  overflow-wrap: break-word;
}
.btn-box {
  background-color: #02d126;
  width: 200px;
  height: 60px;
  border-radius: 15px;
  margin: 20px auto;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 20px;
  font-weight: bold;
}
</style>