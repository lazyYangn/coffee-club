<template>
  <div style="background-color: #f5f5f5;">
    <top-bar style="background-color: #f5f5f5;">
      <div slot="left" class="top-left">
        <span class="iconfont icon-fanhui" style="font-size:30px;line-height: 60px;" @click="goto('/main/home')"></span>
      </div>
      <div slot="middle">
        <div class="title" style="font-weight:blod;font-size:20px;line-height: 60px;">收藏夹</div>
      </div>
    </top-bar>
    <my-content :refreshFunc="refresh" pull>
      <a-list :grid="{ gutter: 16, column: 2 }" :data-source="likegoods">
        <a-list-item slot="renderItem" slot-scope="item" @click="goDetail(item)">
          <display-item :likeProduct="item"></display-item>
        </a-list-item>
      </a-list>
    </my-content>
  </div>
</template>
<script>
// 引入顶部组件
import TopBar from '@/components/topbar/TopBar'
// 引入content组件
import MyContent from '@/components/content/MyContent'
// 引入商品卡片
import DisplayItem from '@/components/display/DisplayItem'
import { HttpGql, ImgUrl } from '@/kits/Http'
export default {
  data() {
    return {
      likegoods: [],
    }
  },
  created() {
    this.initData()
  },
  methods: {
    // 点击返回按钮
    goto(path) {
      this.$router.replace(path)
    },
    goDetail(item) {
      this.$router.push({ path: '/productdetails/' + item.food_id })
    },
    async initData() {
      let sql = {
        query: `
              {
                 favorite{
                    food_name
                    food_title
                    food_pic
                    food_id
                  }
              }
          `,
      }
      try {
        let res = await HttpGql(sql)
        this.likegoods = res.data.favorite.map((item) => {
          item.food_pic = ImgUrl + item.food_pic
          return item
        })
        return true
      } catch (error) {
        return false
      }
    },
    refresh() {
      return this.initData()
    },
  },
  components: {
    TopBar,
    MyContent,
    DisplayItem,
  },
}
</script>
<style>
.title {
  font-size: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}
/* 隐藏滚动进度条 */
::-webkit-scrollbar {
  display: none;
}
</style>
