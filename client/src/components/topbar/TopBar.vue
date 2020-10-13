<template>
  <div class="top">
    <div class="top-left">
      <slot name="left">
        <span class="iconfont icon-caidan" @click="showDrawer"></span>
        <a-drawer width="280px" placement="left" :closable="false" :visible="visible" @close="onClose">
          <div class="user-box">
            <div class="img-box" :style="imgPath"></div>
            <div class="user-name">{{userName}}</div>
            <div class="user-id">id:{{userId}}</div>
          </div>
          <div class="user-list">
            <div class="order-box" @click="goto('/order')">
              <div class="box-title">
                <span class="iconfont icon-dingdan" style="font-size:16px;"></span>
                <span style="padding-left:20px;">历史订单</span>
              </div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="account-box" @click="goto('/main/account')">
              <div class="box-title">
                <span class="iconfont icon-zhanghu" style="font-size:18px;line-height:24px;"></span>
                <span style="padding-left:20px;">账户</span>
              </div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="setting-box" @click="goto('/setting')">
              <div class="box-title">
                <span class="iconfont icon-shezhi1" style="font-size:20px;line-height:24px;"></span>
                <span style="padding-left:20px;">设置</span>
              </div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="question-box" @click="goto('/problemback')">
              <div class="box-title">
                <span class="iconfont icon-wenti" style="font-size:20px;"></span>
                <span style="padding-left:20px;">问题反馈</span>
              </div>
              <div class="box-icon">
                <span class="iconfont icon-iconfontjiantou5"></span>
              </div>
            </div>
            <div class="about-box" @click="goto('/about')">
              <div class="box-title">
                <span class="iconfont icon-guanyu" style="font-size:20px;"></span>
                <span style="padding-left:20px;">关于</span>
              </div>
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
.ant-drawer-body {
  padding: 0 !important;
  margin: 0 !important;
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
  padding: 20px 0;
  display: flex;
  position: relative;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-bottom: 10px;
}
.img-box {
  height: 100px;
  width: 100px;
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
  margin-top: 10px;
  font-weight: bold;
}
.user-id {
  color: #ddd;
}
.order-box,
.setting-box,
.account-box,
.question-box,
.about-box {
  padding: 20px 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
  font-size: 20px;
}

.box-title {
  font-size: 16px;
  display: flex;
  align-items: center;
}
.btn-group {
  display: flex;
  margin-top: 10px;
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
  background-color: #02d126;
  height: 44px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 16px;
  color: #ffffff;
}
</style>
