<template>
    <div>
        <top-bar>
            <div slot="left" class="top-left">
            </div>
            <div slot="middle">
                <div class="title" style="font-weight: blod;  line-height: 60px">
                    分类
                </div>
            </div>
        </top-bar>
            <div class="menu-box">
                <div class="menu-left">
                    <ul>
                        <li v-for="(item,index) in categoryList" :key="index" @click="clickHandle(item)" :class="activeNum==item.typeid?'active':''">{{item.name}}</li>
                    </ul>
                </div>
                <div class="menu-right">
                    <div class="menu-item" v-for="(item,index) in foodsList" :key="index" @click="gotoDetail(item)">
                        <img :src="item.food_pic" alt="">
                        <div class="item-desc">
                            <div>{{item.food_name}}</div>
                            <div>￥{{item.food_price}}</div>
                        </div>
                        <a-icon type="right" class="a-icon" />
                    </div>
                </div>
            </div>
    </div>
</template>

<script>
// 引入顶部组件
import TopBar from "@/components/topbar/TopBar";
// 引入content组件
import MyContent from "@/components/content/MyContent";
// 引入商品卡片
import DisplayItem from "@/components/display/DisplayItem";
import {
    HttpGql,
    ImgUrl
} from "@/kits/Http";
import {
    getCacheVal
} from '@/kits/LocalStorage'

export default {
    data() {
        return {
            categoryList: [],
            // 选中的标签
            activeNum:3000,
            foodsList:[]
        };
    },
    created() {
        this.initData();
        this.activeNum =this.$route.query.id||3000
    },
    methods: {
        gotoDetail(val){
            this.$router.push({
                 path: '/productdetails/' + val.food_id,
            })
        },
      async  clickHandle(val){
            this.activeNum = val.typeid
           let gql = {
                query: `
          {
             category(typeid:[${val.typeid}]){
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
        `};
            let res = await HttpGql(gql);
        this.foodsList = res.data.category[0].foods
        this.foodsList = res.data.category[0].foods.map((item) => {
                item.food_pic = ImgUrl + item.food_pic;
                return item;
            });
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
                category(typeid:[${this.$route.query.id||this.activeNum }]){
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
                this.categoryList = res.data.homecategory.splice(2,6)
                this.foodsList = res.data.category[0].foods
        this.foodsList = res.data.category[0].foods.map((item) => {
                item.food_pic = ImgUrl + item.food_pic;
                return item;
            });
        },
    },
    components: {
        TopBar,
        MyContent,
        DisplayItem,
    },
};
</script>

<style>
.active{
    color: rgb(220, 20, 60);
}
.menu-box{
    display: flex;
    height: 100%;
}
.menu-left{
    position:fixed;
    left: 0px;
    top: 60px;
    height: 100%;
    width: 80px;
}
.menu-left ul{
    padding: 0;
    margin: 0;
    list-style: none;
    height: 100%;
    background-color: #eee;
}
.menu-left ul li{
    padding: 10px 0px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-bottom: solid 1px #fff;
}
.menu-right{
    margin-top: 60px;
    margin-left: 80px;
    flex: 8;
}
.menu-item{
    background-color: #fff;
    display: flex;
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
}
.menu-item img{
    margin-left: 5px;
    flex: 2;
    width: 80px;
    height: 80px;
}
.item-desc{
    margin-left: 10px;
    display: flex;
    padding: 10px 0;
    flex-direction: column;
    justify-content: space-between;
    flex: 8;
}
.a-icon{
    align-self:center;
    flex: 2;
}
/* 隐藏滚动进度条 */
::-webkit-scrollbar {
    display: none;
}
</style>
