<template>
  <div>
    <top-bar>
      <div slot="left">
        <span
          class="iconfont icon-fanhui"
          style="font-size: 30px; line-height: 60px"
          @click="goback"
        ></span>
      </div>
      <div slot="middle">
        <div style="font-weight: blod; font-size: 18px; line-height: 60px">
          设置
        </div>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div class="content-top-box">
        <div class="user-box">
          <div class="user-img">
            <div class="img-item" :style="imgStyle"></div>
          </div>
          <div class="user-name">
            <div class="name-box1">{{ userName }}</div>
            <div class="name-box2">用户ID:{{ userId }}</div>
          </div>
        </div>
        <div class="address-set-box">
          <div class="address-text">发票管理</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
      </div>
      <div class="user-id">
        <div class="user-id-text">账户</div>
        <div class="iconfont icon-iconfontjiantou5"></div>
      </div>
      <div class="pay-box">
        <div class="pay-text">支付设置</div>
        <div class="iconfont icon-iconfontjiantou5"></div>
      </div>
      <div class="user-footer-box">
        <div class="question-box">
          <div class="question-text">问题反馈</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
        <div class="about-box">
          <div class="about-text">关于</div>
          <div class="iconfont icon-iconfontjiantou5"></div>
        </div>
      </div>
      <div class="btn-group">
        <div class="btn">切换用户</div>
        <div class="btn" @click="logout">退出登录</div>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from "@/components/topbar/TopBar";
// 引入内容组件
import MyContent from "@/components/content/MyContent";
import { getCacheVal, getArray, clearCache } from "@/kits/LocalStorage";
import { ImgUrl } from "@/kits/Http";
export default {
  name: "Setting",
  data() {
    return {
      userName: "",
      userAva: "",
      userId: "",
    };
  },
  created() {
    this.userName = getCacheVal("username")
      ? getCacheVal("username")
      : "咖啡小强";
    this.userAva = getCacheVal("userAva")
      ? ImgUrl + getCacheVal("userAva")
      : "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=476262993,2239475519&fm=11&gp=0.jpg";
    this.userId = getCacheVal("userId")
      ? getCacheVal("userId")
      : "coffeeClub@qq.com";
  },
  computed: {
    imgStyle() {
      return {
        backgroundImage: `url(${this.userAva})`,
        backgroundSize: "cover",
      };
    },
  },
  methods: {
    // 点击返回
    goback() {
      this.$router.go(-1);
    },
    logout() {
      clearCache();
      this.$router.push({ path: "/login" });
    },
  },
  components: {
    TopBar,
    MyContent,
  },
};
</script>
<style scoped>
.my-content {
  padding: 0 !important;
}
.content-top-box {
  background-color: #fff;
}
.user-box {
  height: 100px;
  display: flex;
  padding: 0px 20px 10px 20px;
  position: relative;
}
.user-box::after {
  position: absolute;
  content: "";
  display: block;
  width: 95%;
  bottom: 0;
  border-bottom: 1px solid #ccc;
}
.user-img {
  flex: 2;
  display: flex;
  justify-content: center;
  align-items: center;
}
.img-item {
  width: 80px;
  height: 80px;
  background-color: #ccc;
  border-radius: 50%;
}
.user-name {
  padding-left: 20px;
  flex: 6;
  display: flex;
  align-items: flex-start;
  justify-content: center;
  flex-direction: column;
}
.name-box1 {
  font-size: 20px;
}
.name-box2 {
  font-size: 16px;
  color: #ddd;
}
.address-set-box {
  padding: 15px 20px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  font-size: 16px;
}
.user-id {
  margin-top: 15px;
  padding: 15px 20px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  font-size: 16px;
  background-color: #fff;
}
.pay-box {
  margin-top: 15px;
  padding: 15px 20px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  font-size: 16px;
  background-color: #fff;
}
.user-footer-box {
  margin-top: 15px;
  height: 100px;
  display: flex;
  flex-direction: column;
  background-color: #fff;
}
.question-box {
  padding: 15px 20px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  font-size: 16px;
  position: relative;
}
.question-box::after {
  content: "";
  position: absolute;
  bottom: 0;
  width: 95%;
  border-bottom: 1px #ccc solid;
}
.about-box {
  padding: 15px 20px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  font-size: 16px;
}
.btn {
  margin-top: 15px;
  padding: 15px 20px;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 18px;
  background-color: #fff;
}
</style>