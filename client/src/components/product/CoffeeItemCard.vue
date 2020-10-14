<template>
  <div class="coffee-box" @click="goto">
    <div class="coffee-img" :style="imgStyle(coffee.food_pic)"></div>
    <div class="coffee-desc">
      <div class="desc-title">{{ coffee.food_name }}</div>
      <div class="desc-text">{{ coffee.food_title }}</div>
      <div class="desc-price">￥ {{ coffee.food_price }}</div>
    </div>
    <div class="add-box">
      <a-icon type="plus-circle" style="font-size: 20px" />
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
  display: flex;
  height: 100px;
  justify-content: space-between;
  align-items: center;
  border-radius: 8px;
  box-shadow: 0px 1px 2px rgb(40 40 40 /0.2);
  padding: 5px;
}
.coffee-img {
  background-color: #ccc;
  height: 80px;
  width: 80px;
  border-radius: 10px;
}
.coffee-desc {
  display: flex;
  flex-direction: column;
  padding-left: 20px;
  flex: 6;
}
.desc-title {
  color: #1e1e1e;
  font-size: 20px;
}
.desc-text {
  color: #bab9c0;
  font-size: 16px;
}
.desc-price {
  color: #02d126;
  margin-top: 7px;
}
.add-box {
  background-color: #845747;
  height: 25px;
  width: 25px;
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 5px;
  color: #fff;
}
</style>