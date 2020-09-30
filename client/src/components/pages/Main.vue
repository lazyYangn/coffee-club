<template>
  <div>
    <router-view></router-view>
    <tab-bar>
      <tab-bar-item path="/main/home">
        <div slot="icon">
          <div class="iconfont icon-shouye" :style="{fontSize:'24px'}"></div>
        </div>
      </tab-bar-item>
      <tab-bar-item path="/main/like">
        <div slot="icon">
          <div class="iconfont icon-aixin" :style="{fontSize:'24px'}"></div>
        </div>
      </tab-bar-item>
      <tab-bar-item path="/main/cart">
        <div slot="icon">
          <div class="iconfont icon-gouwudai" :style="{fontSize:'26px'}"></div>
        </div>
      </tab-bar-item>
      <tab-bar-item path="/main/account">
        <div slot="icon">
          <div class="iconfont icon-wodedangxuan" :style="{fontSize:'22px'}"></div>
        </div>
      </tab-bar-item>
    </tab-bar>
  </div>
</template>
<script>
import TabBar from '../tabbar/TabBar'
import TabBarItem from '../tabbar/TabBarItem'
export default {
  data () {
    return {}
  },
  methods: {},
  components: {
    TabBar,
    TabBarItem
  }
}
</script>
<style scoped>
</style>