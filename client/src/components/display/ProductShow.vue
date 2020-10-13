<template>
  <div style="background-color: #f5f5f5">
    <top-bar style="background-color: #f5f5f5">
      <div slot="left">
        <span
          class="iconfont icon-fanhui icon"
          style="font-size: 30px; line-height: 60px"
          @click="goback"
        ></span>
      </div>
      <div slot="middle">
        <div style="font-weight: blod; font-size: 20px; line-height: 60px">
          菜单
        </div>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="goSearch('search')"></span>
      </div>
    </top-bar>
    <my-content>
      <div class="product-card" v-if="category.length != 0">
        <div class="procuct-img" :style="imgStyle(category[0].cate_pic)"></div>
        <div class="product-desc">
          <div class="desc-title">{{ category[0].name }}</div>
          <div class="desc-details">{{ category[0].desc }}</div>
        </div>
        <div class="more-button" @click="goto()">更多菜单</div>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from "@/components/topbar/TopBar";
// 引入内容组件
import MyContent from "@/components/content/MyContent";
import { HttpGql, ImgUrl } from "@/kits/Http";
export default {
  name: "ProductShow",
  data() {
    return {
      category: [],
      categoryId: "",
    };
  },
  methods: {
    goback() {
      this.$router.go(-1);
    },
    goSearch(name){
       this.$router.push({name});
    },
    goto() {
      if (this.categoryId == 1000) {
        this.$router.push({ path: "/selectcoffee/" + this.categoryId });
      } else {
        this.$router.push({ path: "/categorydetails/" + this.categoryId });
      }
    },
    async initData() {
      let gql = {
        query: `
          {
            category(typeid:[${this.categoryId}]){
              typeid
              name
              cate_pic
              desc
              }
          }
        `,
      };
      let res = await HttpGql(gql);
      this.category = res.data.category.map((item) => {
        item.cate_pic = ImgUrl + item.cate_pic;
        return item;
      });
    },
  },
  created() {
    this.categoryId = this.$route.params.id;
    this.initData();
  },
  components: {
    TopBar,
    MyContent,
  },
  computed: {
    imgStyle() {
      return (url) => {
        return {
          backgroundImage: `url(${url})`,
          backgroundSize: "cover",
        };
      };
    },
  },
};
</script>
<style scoped>
.product-card {
  position: relative;
  height: 550px;
  background-color: #fff;
  border-radius: 27.5px;
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
