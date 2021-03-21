<template>
  <div>
    <top-bar class="top-bar">
      <div slot="middle">
        <div style="font-weight: blod; font-size: 20px; line-height: 60px;">
        </div>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div class="img-content">
        <div class="user_ava">
          <a-avatar v-if="imgpath == ''" :size="150" icon="user" @click="goto('/uploadimg')" />
          <a-avatar v-else :size="150" :src="imgpath" @click="goto('/uploadimg')" />
        </div>
        <div class="user">
          <div class="user-name">{{ userName }}</div>
          <div class="user-desc">{{ userId }}</div>
        </div>
        <div class="zx-box">
          <span class="iconfont icon-zhaoxiangji" style="font-size: 56px" @click="goto('/uploadimg')"></span>
        </div>
      </div>
      <div class="main-content">
        <div class="main-top-content">
          <div class="top-content-item" @click="goto('/main/like')">
            <div style="font-weight:bold;">{{likeNum}}</div>
            <div>收藏</div>
          </div>
          <div class="top-content-item" @click="goto('/main/cart')">
            <div style="font-weight:bold;">{{cartNum}}</div>
            <div>购物车</div>
          </div>
          <div class="top-content-item" @click="goto('/order')">
            <div style="font-weight:bold;">{{orderNum}}</div>
            <div>订单</div>
          </div>
        </div>
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
function getBase64 (img, callback) {
  const reader = new FileReader();
  reader.addEventListener("load", () => callback(reader.result));
  reader.readAsDataURL(img);
}
export default {
  name: "Account",
  data () {
    return {
      loading: false,
      ModalText: "Content of the modal",
      visible: false,
      confirmLoading: false,
      userName: "",
      imgpath: getCacheVal("imgpath") ? getCacheVal("imgpath") : "",
      userId: "",
      // 收藏数量
      likeNum: 0,
      // 购物车数量
      cartNum: 0,
      // 订单数量
      orderNum: 0
    };
  },
  created () {
    this.userName = getCacheVal("username") ? getCacheVal("username") : "咖啡小强";
    this.userId = getCacheVal("userId") ? getCacheVal("userId") : "coffeeClub@qq.com";
    this.likeNum = this.$store.state.likeList.length;
    console.log(this.$store.state.likeList);
    this.cartNum = this.$store.state.cartData.length;
    this.orderNum = this.$store.state.orderList.length;
  },
  methods: {
    goto (path) {
      this.$router.push({ path })
    }
  },
  components: {
    TopBar,
    MyContent,
  },
};
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
  height: 55%;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  z-index: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #afebd2;
}
.user {
  position: absolute;
  bottom: 0;
  width: 100%;
}
.main-content {
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
.user_ava {
  width: 180px;
  height: 180px;
  display: flex;
  justify-content: center;
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
  font-size: 20px;
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
.ava-list {
  margin-top: 20px;
}
.ava-list img {
  float: left;
  width: 33.33%;
  box-sizing: border-box;
  padding: 10px;
}
.img-box {
  height: 240px;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: flex-end;
  font-size: 20px;
}
.main-top-content {
  display: flex;
  justify-content: space-around;
  font-size: 16px;
}
.top-content-item {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
