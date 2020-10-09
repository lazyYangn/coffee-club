<template>
  <div class="top">
    <div class="top-left">
      <slot name="left">
        <span class="iconfont icon-caidan" @click="showDrawer"></span>
        <a-drawer width="280px" placement="left" :closable="false" :visible="visible" @close="onClose">
          <div class="user-box">
            <div class="img-box" :style="imgPath"></div>
            <div class="user-info">
              <div class="user-name">{{userName}}</div>
              <div class="user-id">id:{{userId}}</div>
            </div>
          </div>
          <div class="user-list">
            <div class="order-box" @click="goto('/order')">
              <div class="box-title">历史订单</div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="account-box">
              <div class="box-title">账户</div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="pay-box">
              <div class="box-title">支付设置</div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="question-box">
              <div class="box-title">问题反馈</div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="about-box">
              <div class="box-title">关于</div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
          </div>
          <div class="btn-group" v-if="btnflag">
            <div class="left-btn" @click="goto('/register')">注册</div>
            <div class="right-btn" @click="goto('/login')">登录</div>
          </div>
          <div class="btn-group" v-else>
            <div class="left-btn" @click="logout">退出</div>
            <div class="right-btn" @click="goto('/setting')">设置</div>
          </div>
        </a-drawer>
      </slot>
    </div>
    <div class=" top-middle">
      <slot name="middle"></slot>
    </div>
    <div class="top-right">
      <slot name="right"></slot>
    </div>
  </div>
</template>
<script>
import { getCacheVal, getArray, clearCache } from "@/kits/LocalStorage";
import { ImgUrl } from "@/kits/Http";
export default {
  data () {
    return {
      visible: false,
      btnflag: true,
      userName: '',
      userAva: '',
      userId: ''
    };
  },
  methods: {
    goto (path) {
      this.$router.push({ path });
    },
    showDrawer () {
      this.visible = true;
    },
    onClose () {
      this.visible = false;
    },
    logout () {
      clearCache();
      this.btnflag = true
      this.visible = false
      this.$router.push({ path: "/login" });
    }
  },
  created () {
    this.userName = getCacheVal("username")
      ? getCacheVal("username")
      : "咖啡小强";
    this.userAva = getCacheVal("userAva")
      ? ImgUrl + getCacheVal("userAva")
      : "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=476262993,2239475519&fm=11&gp=0.jpg";

    this.userId = getCacheVal("userId")
      ? getCacheVal("userId")
      : "coffeeClub@qq.com";
    this.btnflag = this.userName !== '咖啡小强' ? false : true;
  },
  computed: {
    imgPath () {
      return {
        backgroundImage: `url(${this.userAva})`,
        backgroundSize: "cover",
      };
    },
  },
  components: {},
};
</script>
<style scoped>
body {
  margin: 0;
}
.top {
  z-index: 999;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 60px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0px 18px;
  background-color: #f5f5f5;
}
.top-left {
  font-weight: bold;
}
.top-middle {
  width: 80%;
  text-align: center;
}
.top-right .iconfont {
  font-size: 24px;
}
.ant-drawer-body {
  padding: 0 !important;
}
.user-box {
  display: flex;
  position: relative;
  padding: 0 0 10px 0;
}
.user-box::after {
  content: "";
  display: block;
  width: 130%;
  border-bottom: 1px solid #eee;
  position: absolute;
  left: -25px;
  bottom: 0;
}
.img-box {
  height: 60px;
  width: 60px;
  border-radius: 50%;
  background-color: #ddd;
  color: #eee;
}
.user-info {
  padding: 0 0 0 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.user-name {
  font-size: 16px;
  margin-bottom: 5px;
  font-weight: bold;
}
.user-id {
  color: #ddd;
}
.ant-drawer-body {
  background-color: greenyellow !important;
}
.order-box,
.pay-box,
.account-box,
.question-box,
.about-box {
  padding: 20px 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
}
.order-box::after {
  content: "";
  display: block;
  width: 130%;
  border-bottom: 1px solid #eee;
  position: absolute;
  left: -25px;
  bottom: 0;
  box-shadow: 0px 1px 8px rgb(0 0 0 /0.2);
}
.account-box::after {
  content: "";
  display: block;
  width: 130%;
  border-bottom: 1px solid #eee;
  position: absolute;
  left: -25px;
  bottom: 0;
  box-shadow: 0px 1px 8px rgb(0 0 0 /0.2);
}
.pay-box::after {
  content: "";
  display: block;
  width: 130%;
  border-bottom: 1px solid #eee;
  position: absolute;
  left: -25px;
  bottom: 0;
  box-shadow: 0px 1px 8px rgb(0 0 0 /0.2);
}
.question-box::after {
  content: "";
  display: block;
  width: 130%;
  border-bottom: 1px solid #eee;
  position: absolute;
  left: -25px;
  bottom: 0;
  box-shadow: 0px 1px 8px rgb(0 0 0 /0.2);
}
.about-box::after {
  content: "";
  display: block;
  width: 130%;
  border-bottom: 1px solid #eee;
  position: absolute;
  left: -25px;
  bottom: 0;
  box-shadow: 0px 1px 8px rgb(0 0 0 /0.2);
}

.box-title {
  font-size: 14px;
}
.btn-group {
  margin-top: 20px;
  display: flex;
}
.left-btn {
  flex: 1;
  height: 44px;
  border: 1px solid #eee;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;
}
.right-btn {
  margin-left: 10px;
  flex: 1;
  background-color: greenyellow;
  height: 44px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;
  color: #ffffff;
}
</style>
