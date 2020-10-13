<template>
  <div id="app">
    <!-- <router-link to="/">a</router-link>
    <router-link to="/b">b</router-link>
    <router-link to="/c">c</router-link>
    <router-link to="/d">d</router-link> -->
    <router-view></router-view>
  </div>
</template>
<script>
// 引用组件
import Main from "@/components/pages/Main";
import { getCacheVal } from '@/kits/LocalStorage'

export default {
  name: "app",
//   watch:{
//     '$route' (to, from) {
//         //此时假设从index页面跳转到pointList页面
//         // console.log(to); // "/pointList"
//         // console.log(from); // “/index”
//         if(to.path === "/main/like" || to.path === "/main/cart"){
//           if(!getCacheVal("token") || getCacheVal("token").length <= 0 ){
//             this.$router.push({path:"/login"})
//           }
//         }
//     }
//  }
}
</script>
<style>
.ant-col-12  {
  display: flex !important;
  justify-content: center !important;
}
</style>
