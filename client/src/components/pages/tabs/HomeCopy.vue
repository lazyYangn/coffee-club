<template>
  <div class="home">
    <top-bar>
      <div slot="middle">
        <div style="font-weight: blod; font-size: 20px; line-height: 60px">
          首页
        </div>
      </div>
      <div slot="right">
        <span class="iconfont icon-chazhao" @click="search('/search')"></span>
      </div>
    </top-bar>
    <div style="marginTop:60px" class="swiperImg">
      <a-carousel>
        <div>
          <img src="https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3836637285,999435962&fm=26&gp=0.jpg" alt="">
        </div>
        <div>
          <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fx0.ifengimg.com%2Fucms%2F2021_06%2FE67E17BF2A624E574DFD719EB579BCE153E97434_size546_w680_h436.png&refer=http%3A%2F%2Fx0.ifengimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618319437&t=79fc820e20f333b49439048a27971d5f" alt="">
        </div>
        <div>
          <img src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2925984928,4083651084&fm=26&gp=0.jpg" alt="">
        </div>
        <div>
          <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2F09fa513d269759eefdc03d3db9fb43166c22dfb0.jpg&refer=http%3A%2F%2Fgss0.baidu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618320064&t=4794f36afac5a57d4e6489d7b0509eda" alt="">
        </div>
      </a-carousel>
    </div>
    <my-content style="margin-top:10px;padding:10px;margin-bottom: 60px;">
      <!-- <a-list :grid="{ gutter: 16, column: 2 }" :data-source="homecategory">
        <a-list-item slot="renderItem" slot-scope="item" @click="goto(item.typeid)">
          <display-item :project="item"></display-item>
        </a-list-item>
      </a-list> -->
      <div style="height:100px;display:flex">
        <div v-for="(item,index) in navList" :key="index+'1'" style="flex:1;padding:5px" @click="goCategory(item)">
          <img :src="item.cate_pic" style="width:100%;border-radius:50%;height:50px">
          <div style="width:100%;text-align:center">
            {{item.name}}
          </div>
        </div>
      </div>

      <!-- 热门产品 -->
      <div style="margin-top:10px">
        <div>
          <span style="color:orange;font-weight:bold">|</span> 热门产品
          <a-divider />
        </div>
        <div v-for="item in hotfoods" :key="item.food_id">
          <shop-item :coffee="item"></shop-item>
        </div>  
      </div>

      <!-- 店内图片 -->
      <div style="margin-top:10px">
        <div style="margin-bottom:10px">
          <span style="color:orange;font-weight:bold">|</span> 店内图片
        </div>
        <div class="swiperImg">
          <a-carousel autoplay>
            <div>
              <img src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2851632316,2241637336&fm=26&gp=0.jpg" alt="">
            </div>
            <div>
              <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp2.pstatp.com%2Flarge%2F53fa000343cacf7d221a&refer=http%3A%2F%2Fp2.pstatp.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618318205&t=98ade577830c31c7dc3ab688b157f7b5" alt="">
            </div>
            <div>
              <img src="https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3766801724,3030116989&fm=26&gp=0.jpg" alt="">
            </div>
            <div>
              <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20190717%2F0a095e4a432d435e9e6ee72d1b337e74.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618319031&t=4a42b7cb97aa64901ef8793816893a6b" alt="">
            </div>
          </a-carousel>
        </div> 
      </div>

       <!-- 人气商品 -->
      <div style="margin-top:10px;margin-bottom:60px;">
        <div>
          <span style="color:orange;font-weight:bold">|</span> 人气商品
        </div>
        <a-divider />
        <div>
          <a-list :grid="{ gutter: 16, column: 2 }" :data-source="likefoods">
            <a-list-item slot="renderItem" slot-scope="item">
             <hot-shop-item :coffee="item"></hot-shop-item>
            </a-list-item>
          </a-list>
        </div>
      </div>
    </my-content>
  </div>
</template>
<script>
import TopBar from '@/components/topbar/TopBar'
import MyContent from '@/components/content/MyContent'
import DisplayItem from '@/components/display/DisplayItem'
import ShopItem from '@/components/product/CoffeeItemCard'
import HotShopItem from '@/components/product/HotItemCard'
import { HttpGql, ImgUrl } from '@/kits/Http'
import { getCacheVal } from '@/kits/LocalStorage'
export default {
  data() {
    return {
      homecategory: [],
      // 热门商品
      hotfoods:[],
      // 人气商品
      likefoods:[],
      navList:[],
    }
  },
  created() {
    this.initData()
  },
  methods: {
    goCategory(val){
      this.$router.push({
        path:'/main/category',query:{id:val.typeid}
      })
    },
    // 点击查询
    search(path) {
      this.$router.push(path)
    },
    // goto(typeid) {
    //   this.$router.push({ path: '/productshow/' + typeid })
    // },
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
             category(typeid:[1000,2000]){
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
            this.navList = res.data.homecategory.map((item) => {
              item.cate_pic = ImgUrl + item.cate_pic
              return item
            })
            this.navList = this.navList.splice(2,6)
            this.hotfoods = res.data.category[0]
            this.likefoods = res.data.category[1]
            this.hotfoods = res.data.category[0].foods.map((item) => {
                item.food_pic = ImgUrl + item.food_pic;
                return item;
            });
            this.likefoods = res.data.category[1].foods.map((item) => {
                item.food_pic = ImgUrl + item.food_pic;
                return item;
            });
        },
    },
  components: {
    TopBar,
    MyContent,
    DisplayItem,
    ShopItem,
    HotShopItem
  },
}
</script>
<style scoped>
/* 隐藏滚动进度条 */
::-webkit-scrollbar {
  display: none;
}
.ant-carousel >>> .slick-slide {
  text-align: center;
  height: 160px;
  line-height: 160px;
  background: #364d79;
  overflow: hidden;
}

.ant-carousel >>> .slick-slide h3 {
  color: #fff;
}
.ant-divider-horizontal{
  margin: 10px 0;
}
.swiperImg img{
  width: 100%;
  height: 100%;
}
</style>
