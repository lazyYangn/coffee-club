<template>
  <div class="item-box">
    <div class="good-img"></div>
    <div class="good-info">
      <div class="good-name" style="font-size:16px;">速溶咖啡</div>
      <div class="good-desc" style="color:#ccc;">常温,少糖</div>
      <div class="good-num">×2</div>
    </div>
    <div class="good-price">￥53</div>
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
.item-box {
  margin-top: 10px;
  display: flex;
}
.good-img {
  width: 80px;
  height: 80px;
  background-color: #ccc;
  border-radius: 10px;
}
.good-info {
  flex: 8;
  padding-left: 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.good-price {
  font-size: 24px;
  font-weight: bold;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>