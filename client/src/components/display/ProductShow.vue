<template>
  <div>
    <top-bar>
      <div slot="left">
        <span class="iconfont icon-fanhui icon" style="font-size:30px;line-height: 60px;" @click="goback"></span>
      </div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:20px;line-height: 60px;">菜单</div>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="goto('search')"></span>
      </div>
    </top-bar>
    <my-content>
      <div class="product-card">
        <div class="procuct-img"></div>
        <div class="product-desc">
          <div class="desc-title">{{showgood.name}}</div>
          <div class="desc-details">{{showgood.desc}}</div>
        </div>
        <div class="more-button" @click="goto('categorydetails',{content:showgood})">
          更多菜单
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
  name: 'ProductShow',
  data () {
    return {
      showgood: null
    }
  },
  methods: {
    goback () {
      this.$router.go(-1)
    },
    goto (name, params) {
      this.$store.commit('setSearchInput', name)
      this.$router.push({
        name, params
      })
    }
  },
  created () {
    // 页面创建时从vuex的state状态中获取传递的参数
    this.showgood = this.$store.state.routerVal
  },
  components: {
    TopBar,
    MyContent
  }
}
</script>
<style scoped>
.product-card {
  position: relative;
  width: 330px;
  height: 550px;
  background-color: #fff;
  border-radius: 27.5px;
  margin-top: 60px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.procuct-img {
  width: 300px;
  height: 154px;
  background-color: #cccccc;
  margin-top: 80px;
}
.product-desc {
  padding: 80px 30px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.product-desc .desc-title {
  font-size: 30px;
  font-weight: bold;
  color: #000;
}
.product-desc .desc-details {
  font-size: 20px;
}
.more-button {
  width: 160px;
  height: 50px;
  background-color: #02d126;
  border-radius: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 18px;
  position: absolute;
  bottom: -25px;
}
</style>