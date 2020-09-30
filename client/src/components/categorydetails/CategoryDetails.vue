<template>
  <div>
    <top-bar>
      <div slot="left">
        <span class="iconfont icon-fanhui" style="font-size:30px;line-height: 60px;" @click="goback"></span>
      </div>
      <div slot="middle" style="font-size:20px;line-height: 60px;font-weight:bold;">
        {{product.name}}
      </div>
    </top-bar>
    <div class="prodcut-show">
      <div class="favorite-section">
        <div class="title">收藏</div>
      </div>
      <div class="product-card-list line">
        <favorite-product-card></favorite-product-card>
        <favorite-product-card></favorite-product-card>
        <favorite-product-card></favorite-product-card>
        <favorite-product-card></favorite-product-card>
      </div>
    </div>
    <div class="menu-section">
      <div class="title">菜单</div>
      <div>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
        <menu-product-card></menu-product-card>
      </div>
    </div>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from '@/components/topbar/TopBar'
// 引入内容组件
import FavoriteProductCard from '@/components/product/FavoriteProductCard'
import MenuProductCard from '@/components/product/MenuProductCard'
export default {
  name: 'CategoryDetails',
  data () {
    return {
      product: null
    }
  },
  methods: {
    // 返回到上一个页面
    goback () {
      this.$router.go(-1)
    },
    // 路由跳转
    goto (name, params) {
      this.$router.push({})
    }
  },
  components: {
    TopBar,
    FavoriteProductCard,
    MenuProductCard
  },

  created () {
    this.product = this.$store.state.routerVal
  },
}
 </script>
<style>
body {
  background-color: #fff !important;
}
.prodcut-show {
  margin-top: 80px;
}
.favorite-section {
  width: 100%;
}
.menu-section {
  margin-top: 25px;
}
.favorite-section .title {
  font-size: 16px;
  padding: 0px 20px;
  display: flex;
  justify-content: flex-start;
  font-weight: bold;
}
.menu-section .title {
  font-size: 16px;
  padding: 0px 20px;
  display: flex;
  justify-content: flex-start;
  font-weight: bold;
}
.line {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.product-card-list {
  display: flex;
  overflow-x: auto;
}
</style>