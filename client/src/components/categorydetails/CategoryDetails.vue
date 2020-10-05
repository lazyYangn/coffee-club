<template>
  <div>
    <top-bar>
      <div slot="left">
        <span class="iconfont icon-fanhui" style="font-size:30px;line-height: 60px;" @click="goback"></span>
      </div>
      <div slot="middle" style="font-size:20px;line-height: 60px;font-weight:bold;">
        {{ categoryObj.name }}
      </div>
    </top-bar>
    <my-content>
      <div class="prodcut-show">
        <div class="favorite-section">
          <div class="menu-title">收藏</div>
        </div>
        <div class="product-card-list line">
          <favorite-product-card></favorite-product-card>
          <favorite-product-card></favorite-product-card>
          <favorite-product-card></favorite-product-card>
          <favorite-product-card></favorite-product-card>
        </div>
      </div>
      <div class="menu-section">
        <div class="menu-title">菜单</div>
        <div v-for="item in foods" :key="item.typeid">
          <menu-product-card :product="item"></menu-product-card>
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

import FavoriteProductCard from '@/components/product/FavoriteProductCard'
import MenuProductCard from '@/components/product/MenuProductCard'
import { HttpGql, ImgUrl } from '@/kits/Http'

export default {
  name: 'CategoryDetails',
  data() {
    return {
      categoryObj: {},
      categoryId: '',
      foods: [],
    }
  },
  methods: {
    // 返回到上一个页面
    goback() {
      this.$router.go(-1)
    },
    // 路由跳转
    goto(name, params) {
      this.$router.push({})
    },
    async initData() {
      let gql = {
        query: `
          {
             category(typeid:[${this.categoryId}]){
                  typeid
                  name
                  foods(count:10){
                    food_id
                    food_name
                    food_desc
                    food_price
                    food_pic
                  }
                }
          }
        `,
      }
      let res = await HttpGql(gql)
      console.log(res)
      this.categoryObj = res.data.category[0]
      this.foods = res.data.category[0].foods.map((item) => {
        item.food_pic = ImgUrl + item.food_pic
        return item
      })
    },
  },
  components: {
    TopBar,
    FavoriteProductCard,
    MenuProductCard,
    MyContent,
  },

  created() {
    this.categoryId = this.$route.params.id
    this.initData()
  },
}
</script>
<style>
body {
  background-color: #fff !important;
}
.favorite-section {
  width: 100%;
}
.menu-section {
  margin-top: 25px;
}
.menu-title {
  font-size: 16px;
  font-weight: bold;
  padding: 10px 0;
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
