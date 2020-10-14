<template>
  <div>
    <top-bar class="top-bar">
      <div slot="left">
        <span
          class="iconfont icon-fanhui"
          style="font-size: 30px; line-height: 60p; color: #fff"
          @click="goback"
        ></span>
      </div>
    </top-bar>
    <my-content class="my-content">
      <div class="img-box" :style="imgStyle">
        <!-- <div class="title-box">{{ topImg[activeKey - 1].name }}</div> -->
      </div>
      <div class="content-box">
        <a-tabs default-active-key="1" :tabBarGutter="num" v-model="activeKey">
          <a-tab-pane key="1" tab="全部">
            <div class="coffee-box-all">
              <div v-for="item in allCoffee" :key="item.food_name">
                <coffee-item-card :coffee="item"></coffee-item-card>
              </div>
            </div>
          </a-tab-pane>
          <a-tab-pane key="2" tab="冷咖啡" force-render>
            <div class="coffee-box-all">
              <div v-for="item in codeCoffee" :key="item.food_name">
                <coffee-item-card :coffee="item"></coffee-item-card>
              </div>
            </div>
          </a-tab-pane>
          <a-tab-pane key="3" tab="热咖啡">
            <div class="coffee-box-all">
              <div v-for="item in hotCoffee" :key="item.food_name">
                <coffee-item-card :coffee="item"></coffee-item-card>
              </div>
            </div>
          </a-tab-pane>
        </a-tabs>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from "@/components/topbar/TopBar";
// 引入内容组件
import MyContent from "@/components/content/MyContent";
import CoffeeItemCard from "@/components/product/CoffeeItemCard";
import { HttpGql, ImgUrl } from "@/kits/Http";

export default {
  name: "SelectCoffee",
  data() {
    return {
      // 设置标签之间的间距
      num: 63,
      categoryId: "",
      allCoffee: [],
      hotCoffee: [],
      codeCoffee: [],
      activeKey: "1",
      topImg: ["allCoffee.png"],
    };
  },
  created() {
    this.categoryId = this.$route.params.id;
    this.initData();
  },
  methods: {
    goback() {
      this.$router.go(-1);
    },
    callback() {
      console.log();
    },
    async initData() {
      let gql = {
        query: `
        {
          category(typeid:[1010,1020]){
            typeid
            name
            title
            cate_pic
            desc
            foods(count:10){
              food_name
              food_pic
              food_title
              food_price
              food_id
            }
          }
        }
        `,
      };
      let res = await HttpGql(gql);
      res.data.category.map((item) => {
        this.topImg.push(item.cate_pic);
      });
      this.hotCoffee = res.data.category[0].foods.map((item) => {
        item.food_pic = ImgUrl + item.food_pic;
        return item;
      });
      this.codeCoffee = res.data.category[1].foods.map((item) => {
        item.food_pic = ImgUrl + item.food_pic;
        return item;
      });
      this.allCoffee = [...this.hotCoffee, ...this.codeCoffee];
    },
  },
  computed: {
    imgStyle() {
      return {
        backgroundImage: `url(${ImgUrl + this.topImg[this.activeKey - 1]})`,
      };
    },
  },
  components: {
    TopBar,
    MyContent,
    CoffeeItemCard,
  },
};
</script>
<style scoped>
.top-bar {
  background-color: rgb(0 0 0 /0);
}
.my-content {
  position: relative;
  padding: 0;
  margin: 0;
}
.img-box {
  height: 35%;
}
.content-box {
  position: relative;
  z-index: 99999;
  margin-top: -7%;
  height: 69%;
  background-color: #fff;
  border-radius: 31px 31px 0 0;
  padding: 20px;
  border: none;
}
.ant-input {
  height: 100px !important;
}
.coffee-box-all {
  height: 350px;
  overflow-y: auto;
  white-space: nowrap;
}
</style>