<template>
  <div>
    <top-bar>
      <div slot="left">
        <div class="iconfont icon-fanhui" @click="goBack" style="font-size: 30px; line-height: 60px"></div>
      </div>
      <div slot="middle">
        <a-input ref="searchinput" placeholder="请输入搜索内容" size="large" v-model="searchInput"></a-input>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="searchAgain"></span>
      </div>
    </top-bar>
    <my-content :refreshFunc="refresh" pull class="main">
      <div style="color:rgb(0 0 0 /0.5),font-size:15px;font-weight:bold">有{{ FoodData.length }}个商品符合要求</div>
      <div style="margin-top: 16px" v-infinite-scroll="handleInfiniteOnLoad" :infinite-scroll-disabled="busy" :infinite-scroll-distance="10">
        <a-list :grid="{ gutter: 24, column: 1 }" :data-source="FoodData">
          <a-list-item slot="renderItem" slot-scope="item">
            <menu-product-card :product="item"></menu-product-card>
          </a-list-item>
        </a-list>
      </div>
    </my-content>
  </div>
</template>
<script>
import TopBar from '@/components/topbar/TopBar'
import { setArray, getArray } from '@/kits/LocalStorage'
import MyContent from '@/components/content/MyContent'
import { HttpGql, ImgUrl } from '@/kits/Http'
import infiniteScroll from 'vue-infinite-scroll'
import MenuProductCard from '@/components/product/MenuProductCard'
export default {
  directives: { infiniteScroll },
  name: 'Search',
  data() {
    return {
      FoodData: [],
      busy: false,
      searchInput: '',
      historySearch: getArray('historySearch'),
      start: 0,
    }
  },
  methods: {
    goBack() {
      this.$router.go(-1)
    },
    searchAgain() {
      this.FoodData = []
      this.start = 0
      this.search()
    },
    // 点击进行搜索
    async search() {
      let count = 10
      let gql = {
        query: `
          {
            foods(start:${this.start},count:${count},food_name:"${this.searchInput}",food_desc:"${this.searchInput}"){
                food_id
                food_name
                food_pic
                food_price
                food_desc
              }
          }
        `,
      }
      try {
        let res = await HttpGql(gql)
        this.FoodData = this.FoodData.concat(
          res.data.foods.map((item) => {
            item.food_pic = ImgUrl + item.food_pic
            return item
          })
        )
        this.start += count
        return true
      } catch (error) {
        return false
      }
    },
    refresh() {
      this.FoodData = []
      this.start = 0
      return this.search()
    },
    handleInfiniteOnLoad() {
      this.loading = true
      this.search()
    },
  },
  // 页面创建时
  created() {
    // 上一个页面的参数
    // 进行搜索
    this.searchInput = this.$store.state.searchInput
  },
  components: {
    TopBar,
    MyContent,
    MenuProductCard,
  },
}
</script>
<style scoped>
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
