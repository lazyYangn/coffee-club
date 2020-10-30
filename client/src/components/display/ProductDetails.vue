<template>
  <div>
    <TopBar style="background-color: unset">
      <div slot="left" class="iconfont icon-fanhui icon" style="font-size: 30px; line-height: 60px;" @click="goback"></div>
      <div slot="right" class="bar-right" @click="goCart">
        <div v-if="$store.state.cartData.length>0" class="redball"></div>
        <div class="cartIcon iconfont icon-gouwudai" style="color:#fff;font-size: 33px; line-height: 60px;"></div>
      </div>
    </TopBar>
    <div class="favorite-box">
      <div class="top-img" :style="imgStyle(product.food_pic)"></div>
      <div class="bottom-tab">
        <div class="like-btn" @click="like">
          <a-icon type="heart" style="font-size: 28px; color: #845747" :theme="isLike ? 'filled' : 'outlined'" />
        </div>
        <div class="like-product-title">
          {{ product.food_name }}
        </div>
        <div class="like-num">
          <span class="iconfont icon-xingxing" v-for="(item,index) in product.food_rate" :key="item+index"></span>
        </div>
        <div class="scroll">
          <div class="like-description">
            <div class="like-description-top">
              <div>描述</div>
              <div>￥ {{ product.food_price }}</div>
            </div>
            <div class="like-desc">
              {{ product.food_desc }}
            </div>
          </div>
          <div :style="{ marginTop: '16px' }" class="radio-grounp" v-for="item in product.skus" :key="item.id">
            <div class="radio-title">{{item.name}}:</div>
            <a-radio-group :default-value="item.dict_son[0].Cname" :name="item.name" @change="onChangeRadio">
              <a-radio-button :value="item1.Cname" v-for="item1 in item.dict_son" :key="item1.id"> {{item1.Cname}} </a-radio-button>
            </a-radio-group>
          </div>
          <div class="good-num">
            数量:
            <a-input-number id="inputNumber" v-model="valuenum" :min="1" :max="100" @change="onChange" />
          </div>
        </div>
        <div class="btn-group">
          <div class="btn-item btn-left" @click="order">购买</div>
          <div class="btn-item btn-right" @click="addCart">加入购物车</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from "@/components/topbar/TopBar";
// 引入内容部分
import MyContent from "@/components/content/MyContent";
// 引入本地存储
import { setCacheVal, getCacheVal } from "@/kits/LocalStorage";
import { Http, HttpGql, ImgUrl } from "@/kits/Http";

export default {
  data () {
    return {
      product: {},
      foodId: "",
      isLike: false,
      valuenum: 1,
      u_id: getCacheVal("userid"),
      skus: [],
      skusSub: []
    };
  },
  created () {
    this.foodId = this.$route.params.id;
    this.initData();
  },
  computed: {
    imgStyle () {
      return (url) => {
        return {
          backgroundImage: `url(${url})`,
          backgroundSize: "contain",
          backgroundPosition: "center center",
        };
      };
    },
  },
  methods: {
    onChangeRadio (e) {
      this.skus.forEach((item) => {
        if (item.name === e.target.name) {
          item.Cname = e.target.value
        }

      })
    },
    onChange (value) {
      // console.log("changed", value);
    },
    // 返回上一级
    goback () {
      this.$router.go(-1);
    },
    // 页面跳转
    goto (path) {
      this.$router.push({
        path,
      });
    },
    goCart () {
      this.$router.push({
        path: '/main/cart'
      });
    },
    // 加入购物车
    addCart (product) {
      this.skusSub = this.skus.map(item => {
        return item.Cname
      })
      this.$store.dispatch("pushCart", {
        ...this.product,
        countbuy: this.valuenum,
        skus: this.skusSub
      });
      this.$message.info('添加成功')
    },
    async initData () {
      let gql = {
        query: `
          {user(u_id:"${this.u_id}"){
            favorite{
              food_id
              islike
            }
          }
            food(food_id:${this.foodId}){
              food_name
              food_price
              food_rate
              food_desc
              food_pic
              food_id
              typeid
              skus{
                id
                name
                dict_son{
                  id
                  Cname
                }
              }
            }
          }
        `,
      };
      let res = await HttpGql(gql);
      res.data.food.food_pic = ImgUrl + res.data.food.food_pic;
      this.product = res.data.food;
      res.data.user.favorite.forEach((item) => {
        if (item.food_id == this.foodId) {
          this.isLike = true;
        }
      });
      res.data.food.skus.forEach(item => {
        this.skus.push({ id: item.dict_son[0].id, name: item.name, Cname: item.dict_son[0].Cname })
      })
    },
    async like () {
      if (this.u_id) {
        if (this.isLike == false) {
          await Http("/addfoodlike", {
            u_id: this.u_id,
            food_id: this.foodId,
            islike: 0,
          });
          this.isLike = !this.isLike;
        } else if (this.isLike == true) {
          await Http("/addfoodlike", {
            u_id: this.u_id,
            food_id: this.foodId,
            islike: 1,
          });
          this.isLike = !this.isLike;
        }
      } else {
        console.log("请先登录");
      }
    },
    order () {
      this.skusSub = this.skus.map(item => {
        return item.Cname
      })
      this.$store.dispatch("pushCart", {
        ...this.product,
        countbuy: this.valuenum,
        skus: this.skusSub
      })
      this.$router.push({ name: 'orderaffirm' })
    }
  },
  components: {
    TopBar,
    MyContent,
  },
};
</script>
<style scoped>
.main {
  overflow-x: hidden; /* 防止横向滚动条 */
}
.bar-right {
  position: relative;
  width: 50px;
  height: 30px;
}
.cartIcon {
  position: absolute;
  top: -15px;
  left: 10px;
  right: -10px;
}
.redball {
  position: absolute;
  top: 1px;
  left: 7px;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background-color: #02d126;
  z-index: 999;
}
.favorite-box {
  position: relative;
}
.top-img {
  height: 250px;
  background-color: #ccc;
  margin: -24px 0;
}
.top-img .top {
  padding-left: 20px;
  color: #fff;
  display: flex;
}
.top-img .top .icon {
  flex: 1;
}
.bottom-tab {
  height: 465px;
  z-index: 9999;
  background-color: #fff;
  border-radius: 31px 31px 0 0;
  padding: 20px;
  position: relative;
}
.like-btn {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  position: absolute;
  top: -30px;
  right: 30px;
  background-color: #ffffff;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
  z-index: 999;
}
.like-btn .iconfont {
  color: #845747;
  font-size: 30px !important;
}
.like-product-title {
  font-size: 30px;
  font-weight: bold;
  color: #000;
  margin: 10px 0px;
}
.like-num .iconfont {
  font-size: 28px;
  color: #f59d2d;
}
.like-num span {
  padding: 10px 5px 20px 0px;
}
.like-description {
  margin-top: 10px;
}
.like-description .like-description-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #000;
  font-size: 18px;
  font-weight: bold;
}
.like-desc {
  padding: 10px 10px 10px 0px;
  word-wrap: break-word;
}
.btn-group {
  display: flex;
  justify-content: space-evenly;
  position: fixed;
  bottom: 5px;
  left: 0;
  right: 0;
  z-index: 999;
  background: #fff;
  border: none;
}
.btn-group .btn-item {
  height: 50px;
  width: 140px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 11px;
  margin: 0 20px;
}
.btn-group .btn-left {
  border: solid 1px #ccc;
  font-size: 16px;
  font-weight: bold;
  line-height: 50px;
}
.btn-group .btn-right {
  background-color: #02d126;
  color: #fff;
  font-weight: bold;
  font-size: 16px;
  line-height: 50px;
}
.ant-radio-button-wrapper {
  width: 74px;
  margin: 0 10px;
  border-radius: 10px;
  text-align: center;
}
.radio-grounp {
  display: flex;
  align-items: center;
  margin: 0 10px;
}
.radio-title {
  width: 33px;
  font-weight: bold;
}
.good-num {
  margin-top: 5px;
  position: absolute;
  right: 10px;
}
</style>
