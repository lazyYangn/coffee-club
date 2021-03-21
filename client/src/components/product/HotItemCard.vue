<template>
  <div class="coffee-box" @click="goto">
    <div class="coffee-img" :style="imgStyle(coffee.food_pic)"></div>
    <div style="height:70px">
      <div class="coffee-desc">
        <div class="desc-title">{{ coffee.food_name }}</div>
        <!-- <div class="desc-text">{{ coffee.food_title }}</div> -->
      </div>
      <div class="add-box">
        <div class="desc-price">￥ {{ coffee.food_price }}</div>
        <!-- <div class="iconfont icon-jia" style="font-size: 20px" /> -->
        <a-icon type="shopping-cart" style="font-size: 20px"/>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "CoffeeItemCard",
  data() {
    return {};
  },
  props: { coffee: Object },
  methods: {
    goto() {
      this.$router.push({ path: "/productdetails/" + this.coffee.food_id });
    },
  },
  components: {},
  computed: {
    imgStyle(){
      return (url)=>{
        return {
          backgroundImage:`url(${url})`,
          backgroundSize:'cover',
          backgroundPosition: "center  center",
        }
      }
    }
  }
};
</script>
<style scoped>
.coffee-box {
  margin-top: 10px;
  /* display: flex; */
  height: 200px;
  /* justify-content: space-between; */
  /* align-items: center; */
  border-radius: 8px;
  box-shadow: 0px 1px 2px rgb(40 40 40 /0.2);
  padding: 5px;
}
.coffee-img {
  background-color: #ccc;
  height: 130px;
  width: 100%;
  border-radius: 10px;
}
.coffee-desc {
  /* display: flex;
  flex-direction: column;
  padding-left: 20px;
  flex: 6; */
  height: 30px;
}
.desc-title {
  color: #1e1e1e;
  font-size: 16px;
}
.desc-text {
  color: #bab9c0;
  font-size: 16px;
}
.desc-price {
  color: #DC143C;
  /* margin-top: 7px; */
}
.add-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
  /* background-color: #DC143C; */
  /* height: 25px;
  width: 25px; */
  /* display: flex;
  justify-content: center;
  align-items: center; */
  border-radius: 5px;
  /* color: #fff;
  padding-top: 1px; */
}
</style>