<template>
  <div>
    <TopBar style="backgroundColor:rgb(0 0 0 /0)">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size:30px;line-height: 60px;" @click="goback"></div>
    </TopBar>
    <div class="favorite-box">
      <div class="top-img" :style="imgStyle(product.food_pic)"></div>
      <div class="bottom-tab">
        <div class="like-btn">
          <span class="iconfont icon-aixin like-icon"></span>
        </div>
        <div class="like-product-title">
          {{ product.food_name }}
        </div>
        <div class="like-num">
          <span class="iconfont icon-xingxing" v-for="item in product.food_rate" :key="item"></span>
        </div>
        <div class="like-description">
          <div class="like-description-top">
            <div>描述</div>
            <div>￥ {{ product.food_price }}</div>
          </div>
          <div class="like-desc">
            {{ product.food_desc }}
          </div>
        </div>
        <div class="btn-group">
          <div class="btn-item btn-left" @click="goto('/main/cart')">购买</div>
          <div class="btn-item btn-right" @click="addCart">加入购物车</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from '@/components/topbar/TopBar'
// 引入内容部分
import MyContent from '@/components/content/MyContent'
// 引入本地存储
import { setCacheVal, getCacheVal } from '@/kits/LocalStorage'
import { HttpGql, ImgUrl } from '@/kits/Http'

export default {
  data() {
    return {
      product: {},
      foodId: '',
    }
  },
  created() {
    this.foodId = this.$route.params.id
    this.initData()
  },
  computed: {
    imgStyle() {
      return (url) => {
        return {
          backgroundImage: `url(${url})`,
          backgroundSize: 'contain',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'center center',
        }
      }
    },
  },
  methods: {
    // 返回上一级
    goback() {
      this.$router.go(-1)
    },
    // 页面跳转
    goto(path) {
      this.$router.push({
        path,
      })
    },
    // 加入购物车
    addCart(product) {
      console.log('添加到购物车')
    },
    async initData() {
      let gql = {
        query: `
          {
            food(food_id:${this.foodId}){
              food_name
              food_price
              food_rate
              food_desc
              food_pic
            }
          }
        `,
      }
      let res = await HttpGql(gql)
      res.data.food.food_pic = ImgUrl + res.data.food.food_pic
      this.product = res.data.food
    },
  },
  components: {
    TopBar,
    MyContent,
  },
}
</script>
<style scoped>
.main {
  overflow-x: hidden; /* 防止横向滚动条 */
}
.favorite-box {
  position: relative;
}
.top-img {
  height: 360px;
  background-color: #ccc;
  margin: -24px 0;
}
.top-img .top {
  padding-left: 20px;
  color: #fff;
  display: flex;
}
.top-img .top .icon {
  flex: 1;
}
.bottom-tab {
  height: 350px;
  z-index: 9999;
  background-color: #fff;
  border-radius: 31px 31px 0 0;
  padding: 20px;
  position: relative;
}
.like-btn {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  position: absolute;
  top: -30px;
  right: 30px;
  background-color: #ffffff;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
}
.like-btn .iconfont {
  color: #845747;
  font-size: 30px !important;
}
.like-product-title {
  font-size: 30px;
  font-weight: bold;
  color: #000;
  margin: 10px 0px;
}
.like-num .iconfont {
  font-size: 28px;
  color: #f59d2d;
}
.like-num span {
  padding: 10px 5px 20px 0px;
}
.like-description {
  margin-top: 15px;
}
.like-description .like-description-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #000;
  font-size: 18px;
  font-weight: bold;
}
.like-desc {
  padding: 10px 10px 10px 0px;
  word-wrap: break-word;
}
.btn-group {
  margin-top: 20px;
  display: flex;
  justify-content: space-evenly;
}
.btn-group .btn-item {
  height: 50px;
  width: 140px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 11px;
}
.btn-group .btn-left {
  border: solid 1px #ccc;
  font-size: 16px;
  font-weight: bold;
  line-height: 50px;
}
.btn-group .btn-right {
  background-color: #02d126;
  color: #fff;
  font-weight: bold;
  font-size: 16px;
  line-height: 50px;
}
</style>
