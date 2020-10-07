<template>
  <div>
    <div class="product-card" @click="goto">
      <div class="product-img" :style="imgStyle(likeGood.food_pic)"></div>
      <div class="product-text">
        <div class="title">{{ likeGood.food_name }}</div>
        <div class="desc">{{ likeGood.food_title }}</div>
      </div>
      <div class="product-like-price">
        <div class="like-start">
          <span class="iconfont icon-xingxing"></span>
          <span class="iconfont icon-xingxing"></span>
          <span class="iconfont icon-xingxing"></span>
          <span class="iconfont icon-xingxing"></span>
          <span class="iconfont icon-xingxing"></span>
        </div>
        <div class="product-price">$12</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "ProductCard",
  data() {
    return {};
  },
  props: {
    likeGood: {},
  },
  methods: {
    goto(name) {
      this.$router.push({
        name: "productdetails",
      });
    },
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
  width: 180px;
  height: 220px;
  padding: 10px 20px;
}
.product-img {
  background-color: #ccc;
  width: 140px;
  height: 120px;
  border-radius: 10px;
}
.product-text {
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}
.product-text .title {
  font-weight: bold;
  font-size: 16px;
  color: #000;
}
.product-text .desc {
  max-width: 140px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.product-like-price {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.product-like-price .product-price {
  font-size: 18px;
  font-weight: bold;
}
</style>