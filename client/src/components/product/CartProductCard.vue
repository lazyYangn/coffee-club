<template>
  <div>
    <div class="product-card">
      <div class="product-img"></div>
      <div class="product-text">
        <div class="text-title">
          早餐
        </div>
        <div class="text-desc">
          sdadajkfhwdwlhfkhjkekwsasdadajkfhwdwlhfkhjkekwsa
        </div>
        <div class="text-price">
          $12.00
        </div>
      </div>
      <div class="del-btn">
        <span class="iconfont icon-cha"></span>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {}
  },
  methods: {},
  components: {}
}
</script>
<style scoped>
.product-card {
  background-color: #fff;
  margin-top: 20px;
  width: 100%;
  height: 130px;
  border-radius: 15px;
  display: flex;
  position: relative;
  box-shadow: 0px 1px 3px rgb(0 0 0 /0.1);
}
.product-img {
  background-color: #ccc;
  flex: 3;
  border-radius: 15px 0 0 15px;
}
.product-text {
  flex: 7;
  display: flex;
  flex-direction: column;
  margin-left: 20px;
}
.text-title {
  font-size: 20px;
  font-weight: bold;
  margin-top: 10px;
  flex: 2;
}
.text-desc {
  color: #ccc;
  font-size: 16px;
  flex: 4;
  max-width: 230px !important;
  word-wrap: break-word;
  word-break: normal;
}
.text-price {
  flex: 2;
  font-size: 18px;
  font-weight: bold;
  color: #02d126;
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
  top: 80px;
  right: -15px;
}
.del-btn .iconfont {
  color: #fff;
  font-size: 14px;
}
</style>