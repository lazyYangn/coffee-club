<template>
  <div>
    <div class="product-card">
      <div class="product-img" :style="imgStyle(product.food_pic)"></div>
      <div class="product">
        <div class="product-info">
         <div class="product-text">
            <div class="text-title">
          {{product.food_name}}
        </div>
        <div class="text-desc" >
          <div class="desc-item" v-for="(item,index) in product.skus" :key="item+index">
            {{item}}
          </div>
        </div>
         </div>
        <div class="text-price">
         {{ showPrice }}
        </div>
        </div>
        <div class="btn-group">
        <div class="btn_g" @click="decreaseCart(index)"><a-icon class="aicon" type="minus-circle" /></div>
        <div class="showprice">{{ product.countbuy }}</div>
        <div class="btn_g" @click="increaseCart(index)"><a-icon class="aicon" type="plus-circle" /></div>
      </div>
      </div>
      <div class="del-btn"  @click="delCart(index)">
        <span class="iconfont icon-cha"></span>
      </div>
    </div>
  </div>
</template>
<script>
import { Http, HttpGql, ImgUrl } from "@/kits/Http";
import { setCacheVal, getCacheVal } from "@/kits/LocalStorage";
export default {
  data () {
    return {}
  },
  props:{
    product:Object,
    index:Number
  },
  created() {
  },
  computed: {
    showPrice() {
      return "￥" + this.product.food_price * this.product.countbuy;
    },
    imgStyle() {
      return (url) => {
        return {
          backgroundImage: `url(${url})`,
          backgroundSize: "cover",
          backgroundPosition: "center  center",
        };
      };
    },
  },
  methods: {
    increaseCart() {
      this.$store.dispatch("increaseCart",this.index)
    },
    decreaseCart() {
      this.$store.dispatch("decreaseCart",this.index)
    },
    delCart(){
     this.$store.dispatch("removeCart",this.index)
    }
  },
  components: {}
}
</script>
<style scoped>
.product-card {
  background-color: #fff;
  margin-top: 20px;
  width: 100%;
  height: 105px;
  border-radius: 15px;
  display: flex;
  position: relative;
  box-shadow: 0px 1px 3px rgb(0 0 0 /0.1);
}
.product-img {
  width: 85px;
  height: 105px;
  background-color: #ccc;
  border-radius: 15px 0 0 15px;
}
.product {
  width: 213px;
  display: flex;
  margin-left: 20px;
  flex-direction: column;
}
.product-info{
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}
.text-title {
  font-size: 18px;
  font-weight: bold;
  margin-top: 5px;
}
.text-desc {
  color: #ccc;
  font-size: 16px;
  word-wrap: break-word;
  word-break: normal;
  display: flex;
}
.desc-item{
  width: 50px;
  border-radius: 10px;
  text-align: center;
  background-color: #e3e3e3;
  margin-right:5px;
  font-size: 14px;
  color:#000;
}
.text-price {
  font-size: 18px;
  font-weight: bold;
  color: #02d126;
  padding-top: 6px;
  margin-left: -20px;
}
.del-btn {
  height: 30px;
  width: 30px;
  border-radius: 6px;
  background-color: #845747;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 65px;
  right: -15px;
}
.del-btn .iconfont {
  color: #fff;
  font-size: 14px;
}
.btn-group {
  display: flex;
  margin-top: 10px;
}
.btn_g {
  width: 22px;
  height: 22px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 50%;
}
.aicon{
  font-size: 20px;
}
.showprice{
  width: 30px;
  text-align: center;
}
</style>