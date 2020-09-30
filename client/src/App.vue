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
import Main from '@/components/pages/Main'
export default {
  name: "app",
}
</script>
<style scoped>
@import "./assets/css/common.css";
</style>
