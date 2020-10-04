<template>
  <div class="product-edit" @click="goto">
    <div class="pic" :style="imgStyle(product.food_pic)"></div>
    <div class="wrapper-right">
      <div class="product-name-price">
        <div class="title">{{ product.food_name }}</div>
        <div class="price">￥ {{ product.food_price }}</div>
      </div>
      <div class="desc">{{ product.food_desc }}</div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'MenuProductCard',
  data() {
    return {}
  },
  props: { product: Object },
  methods: {
    goto() {
      this.$router.push({
        path: '/productdetails/' + this.product.food_id,
      })
    },
  },
  components: {},
  computed: {
    imgStyle() {
      return (item) => {
        return {
          backgroundImage: `url(${item})`,
          backgroundSize: '109px 109px',
          backgroundRepeat: 'no-repeat',
          backgroundPosition: 'center center',
        }
      }
    },
  },
}
</script>
<style scoped>
.product-edit {
  display: flex;
  justify-content: space-between;
  margin: 10px 0;
}

.pic {
  width: 109px;
  height: 112px;
  border-radius: 16px;
  background: #f6f6f6;
  margin-right: auto;
  flex: 2;
}

.wrapper-right {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  flex: 4.5;
  margin-left: 10px;
}
.product-name-price {
  display: flex;
  justify-content: space-between;
}
.title {
  width: 94px;
  height: 48px;
  transform: rotate(-1deg);
  color: #1e1e1e;
  font-family: 'Inter-Bold';
  font-size: 18px;
  font-weight: 400;
  line-height: 24px;
}
.price {
  color: #02d126;
  font-family: 'Inter-Bold';
  font-size: 14px;
  font-weight: 400;
  line-height: 19px;
}
.desc {
  width: 215px;
  height: 38px;
  color: #bab9c0;
  font-family: 'Inter-Medium';
  font-size: 14px;
  font-weight: 400;
  line-height: 19px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
