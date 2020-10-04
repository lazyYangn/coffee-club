<template>
  <div class="home">
    <top-bar style="background-color: #f5f5f5;">
      <div slot="middle">
        <div style="font-weight: blod; font-size: 20px; line-height: 60px">
          菜单
        </div>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="search('/search')"></span>
      </div>
    </top-bar>
    <my-content>
      <a-list :grid="{ gutter: 16, column: 2 }" :data-source="homecategory">
        <a-list-item slot="renderItem" slot-scope="item" @click="goto(item.typeid)">
          <display-item :project="item"></display-item>
        </a-list-item>
      </a-list>
    </my-content>
  </div>
</template>
<script>
import TopBar from '@/components/topbar/TopBar'
import MyContent from '@/components/content/MyContent'
import DisplayItem from '@/components/display/DisplayItem'
import { HttpGql, ImgUrl } from '@/kits/Http'
export default {
  data() {
    return {
      homecategory: [],
    }
  },
  created() {
    this.initData()
  },
  methods: {
    // 点击查询
    search(path) {
      this.$router.push(path)
    },
    goto(typeid) {
      this.$router.push({ path: '/productshow/' + typeid })
    },
    async initData() {
      let gql = {
        query: `
                {
                    homecategory{
                      typeid
                      name
                      title
                      cate_pic
                      desc
                      }
                }
            `,
      }
      let res = await HttpGql(gql)
      this.homecategory = res.data.homecategory.map((item) => {
        item.cate_pic = ImgUrl + item.cate_pic
        return item
      })
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
/* 隐藏滚动进度条 */
::-webkit-scrollbar {
  display: none;
}
.ant-col-12  {
    display: flex !important;
    justify-content: center !important;
}
.home {
  background-color: #f5f5f5;
}
</style>
