<template>
  <div>
    <top-bar>
      <div slot="left">
        <div class="iconfont icon-fanhui" @click="goBack" style="font-size:30px;line-height: 60px;"></div>
      </div>
      <div slot="middle">
        <a-input ref="searchinput" placeholder="请输入搜索内容" size="large">
        </a-input>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="search"></span>
      </div>
    </top-bar>
    <my-content>
      <div class="main">
        <div style="color:rgb(0 0 0 /0.5),font-size:15px;font-weight:bold">有{{data.length}}个商品符合要求</div>
        <div style="margin-top:16px">
          <a-list :grid="{gutter:16,column:2}" :data-source='data'>
            <a-list-item slot="renderItem" slot-scope="item">
              <menu-product-card :product="item"></menu-product-card>
            </a-list-item>
          </a-list>
        </div>
      </div>
    </my-content>
  </div>
</template>
<script>
import TopBar from '@/components/topbar/TopBar'
import { setArray, getArray } from '@/kits/LocalStorage'
import MyContent from '@/components/content/MyContent'
import { HttpGql, ImgUrl } from '@/kits/Http'
import infiniteScroll from 'vue-infinite-scroll';
export default {
  directives: { infiniteScroll },
  name: 'Search',
  data () {
    return {
      data: [],
      busy: false,
      searchInput: "",
      historySearch: getArray('historySearch'),
    }
  },
  methods: {
    goBack () {
      this.$router.go(-1)
    },
    // 点击进行搜索
    search () {
      console.log('搜索');
    }
  },
  // 页面创建时
  created () {
    // 上一个页面的参数
    // 进行搜索
    this.searchInput = this.$store.state.searchInput
  },
  components: {
    TopBar,
    MyContent,
  }
}
</script>
<style scoped>
.main {
  margin-top: 60px;
}
.history-search-content {
  margin-top: 10px;
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  font-size: 14px;
}
.history-search-item {
  background-color: #fff;
  padding: 2px 6px;
  border-radius: 5px;
  box-shadow: 0px 1px 2px rgb(40 40 40 /0.2);
  margin-top: 8px;
  margin-right: 5px;
}
</style>