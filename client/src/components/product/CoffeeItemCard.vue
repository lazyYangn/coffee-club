<template>
  <div class="coffee-box" @click="goto">
    <div class="coffee-img"></div>
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
};
</script>
<style scoped>
.coffee-box {
  margin-top: 10px;
  display: flex;
  height: 100px;
  justify-content: space-between;
  align-items: center;
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
  color: #1e1e1e;
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