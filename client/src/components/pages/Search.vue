<template>
  <div>
    <top-bar style="backgroundColor:#fff;box-shadow: 0px 1px 1px rgb(40 40 40 / 0.2);">
      <div slot="left" class="top-left">
        <span class="iconfont icon-fanhui" style="font-size: 30px; line-height: 60px" @click="goback"></span>
      </div>
      <div slot="middle">
        <a-input ref="searchinput" placeholder="请输入搜索内容" size="large" v-model="searchInput"> </a-input>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="search"></span>
      </div>
    </top-bar>
    <my-content>
      <div class="history-search">
        <div style="display: flex; justify-content: space-between">
          <div style="color: rgb(0 0 0 /0.5); font-size: 16px; font-weight: bold">
            最近搜索
          </div>
          <div style="color: #02d126; font-size: 14px; font-weight: bold" @click="clearSearchHistory">
            清空
          </div>
        </div>
        <div class="history-search-content">
          <div @click="searchByHistory(item)" class="history-search-item" v-for="(item, index) in historySearch" :key="index + item">
            {{ item }}
          </div>
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
// 引入商品展示卡
import DisplayItem from '@/components/display/DisplayItem'
// 引入本地存储
import { setArray, getArray, clearItem } from '@/kits/LocalStorage'
export default {
  name: 'Search',
  data() {
    return {
      searchInput: '',
      historySearch: getArray('historySearch'),
    }
  },
  methods: {
    goback() {
      this.$router.go(-1)
    },
    // 点击搜索按钮进行搜索
    search() {
      if (this.searchInput !== '') {
        // 将搜索内容存到本地存储中
        setArray('historySearch', this.searchInput)
        // 搜索传递
        this.$store.commit('setSearchInput', this.searchInput)
        this.$router.push({
          name: 'searchresult',
        })
      } else {
        this.$message.info('请输入您需要搜索的内容')
      }
    },
    // 点击历史记录进行搜索
    searchByHistory(content) {
      this.$store.commit('setSearchInput', this.searchInput)
      //页面进行跳转
      this.$router.push({
        name: 'searchresult',
      })
    },
    // 清空搜索记录
    clearSearchHistory() {
      clearItem('historySearch')
      this.historySearch = []
    },
  },
  components: {
    TopBar,
    MyContent,
    DisplayItem,
  },
}
</script>
<style scoped>
.history-search-content {
  margin-top: 10px;
  font-size: 14px;
}
.history-search-item {
  background-color: #fff;
  padding: 2px 6px;
  border-radius: 5px;
  box-shadow: 0px 1px 2px rgb(40 40 40 /0.2);
  margin: 6px 8px;
  float: left;
}
</style>
