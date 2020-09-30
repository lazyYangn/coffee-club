<template>
  <div>
    <top-bar>
      <div slot="left" class="top-left">
        <span class="iconfont icon-caidan"></span>
      </div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:20px;line-height: 60px;">菜单</div>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="search('/search')"></span>
      </div>
    </top-bar>
    <my-content>
      <div style="margin-top:66px;">
        <a-list :grid="{ gutter: 16, column: 2 }" :data-source="homecategory">
          <a-list-item slot="renderItem" slot-scope="item" @click="goto('productshow', { content: item })">
            <display-item :project="item"></display-item>
          </a-list-item>
        </a-list>
      </div>
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
    goto(name, params) {
      // 路由跳转时，将需要传递的参数存到vux中
      this.$store.commit('setRouterVal', params.content)
      this.$router.push({ name })
    },
    async initData() {
      let gql = {
        query: `
                {
                    homecategory{
                      typeid
                      parent_id
                      name
                      title
                      cate_pic
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
.ant-col-12 {
  display: flex !important;
  justify-content: center !important;
}
</style>
