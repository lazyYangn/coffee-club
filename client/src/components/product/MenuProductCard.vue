<template>
  <div>
    <div class="product-card" @click="goto">
      <div class="pro-img"></div>
      <div class="product-text">
        <div class="product-name-price">
          <div class="title">披萨</div>
          <div class="price">$12.00</div>
        </div>
        <div class="desc">
          sdadsdakjdhaskDHWIUBDSDKBsdadsdakjdhaskDHWIUBDSDKB
        </div>
      </div>
    </div>
  </div>
</template>
<script>

export default {
  name: 'MenuProductCard',
  data () {
    return {}
  },
  methods: {
    goto () {
      this.$router.push({
        name: 'productdetails'
      })
    }
  },
  components: {}
}
</script>
<style scoped>
.product-card {
  width: 100%;
  padding: 10px 20px;
  display: flex;
}
.pro-img {
  width: 100px;
  height: 100px;
  background-color: #ccc;
  border-radius: 10px;
  flex: 2;
}
.product-text {
  flex: 4;
  margin-left: 20px;
  margin-top: 5px;
}
.product-name-price {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.product-name-price .title {
  font-size: 18px;
  font-weight: bold;
}
.product-name-price .price {
  font-size: 18px;
  font-weight: bold;
  color: #02d126;
}
.product-text .desc {
  margin-top: 5px;
  color: #ccc;
  max-width: 200px !important;
  padding-left: 20px;
  word-wrap: break-word;
}
</style>