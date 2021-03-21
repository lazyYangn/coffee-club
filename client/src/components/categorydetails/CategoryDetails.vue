<template>
    <div>
        <top-bar>
            <div slot="left">
                <span class="iconfont icon-fanhui" style="font-size: 30px; line-height: 60px" @click="goback"></span>
            </div>
            <div slot="middle" style="font-size: 20px; line-height: 60px; font-weight: bold">
                {{ categoryObj.name }}
            </div>
        </top-bar>
        <my-content>
            <div class="prodcut-show">
                <div class="favorite-section">
                    <div class="menu-title">收藏</div>
                </div>
                <div class="product-card-item">
                    <div v-for="item in likegoods" :key="item.food_id">
                        <favorite-product-card :likeGood="item"></favorite-product-card>
                    </div>
                </div>
            </div>
            <div class="menu-section">
                <div class="menu-title">菜单</div>
                <div v-for="item in foods" :key="item.typeid">
                    <menu-product-card :product="item"></menu-product-card>
                </div>
            </div>
        </my-content>
    </div>
</template>

<script>
// 引入头部组件
import TopBar from "@/components/topbar/TopBar";
// 引入内容组件
import MyContent from "@/components/content/MyContent";

import FavoriteProductCard from "@/components/product/FavoriteProductCard";
import MenuProductCard from "@/components/product/MenuProductCard";
import {
    HttpGql,
    ImgUrl
} from "@/kits/Http";

export default {
    name: "CategoryDetails",
    data() {
        return {
            categoryObj: {},
            categoryId: "",
            foods: [],
            likegoods: [],
        };
    },
    mounted() {
        this.initData();
    },
    methods: {
        // 返回到上一个页面
        goback() {
            this.$router.go(-1);
        },
        // 路由跳转
        goto(name, params) {
            this.$router.push({});
        },
        async initData() {
            let gql = {
                query: `
          {
            user(u_id:"admin@mail.com"){
                    u_id
                    name
                    favorite{
                      food_name
                      food_id
                      food_pic
                      food_title
                      food_rate
                      food_price
                    }
              }
             category(typeid:[${this.categoryId}]){
                  typeid
                  name
                  foods(count:10){
                    food_id
                    food_name
                    food_desc
                    food_price
                    food_pic
                  }
                }
          }
        `,
            };
            let res = await HttpGql(gql);
            this.categoryObj = res.data.category[0];
            this.foods = res.data.category[0].foods.map((item) => {
                item.food_pic = ImgUrl + item.food_pic;
                return item;
            });
            this.likegoods = res.data.user.favorite.map((item) => {
                item.food_pic = ImgUrl + item.food_pic;
                return item;
            });
        },
    },
    components: {
        TopBar,
        FavoriteProductCard,
        MenuProductCard,
        MyContent,
    },

    created() {
        this.categoryId = this.$route.params.id;
        // this.initData();
    },
};
</script>

<style scoped>
body {
    background-color: #fff !important;
}

.favorite-section {
    width: 100%;
}

.menu-section {
    margin-top: 25px;
}

.menu-title {
    font-size: 16px;
    font-weight: bold;
    padding: 10px 0;
}

.product-card-item {
    display: flex;
    overflow-x: auto;
}
</style>
