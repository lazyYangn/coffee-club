<template>
  <div>
    <top-bar>
      <div slot="left"></div>
      <div slot="middle">
        <div style="font-weight:blod;font-size:18px;line-height: 60px;">购物袋</div>
      </div>
    </top-bar>
    <my-content>
      <div class="main-box">
        <cart-product-card></cart-product-card>
        <cart-product-card></cart-product-card>
      </div>
      <div class="cart-footer">
        <div class="price-box">
          <div class="price-item">
            <div class="item-s1">包装费</div>
            <div class="item-s2">$10.00</div>
          </div>
          <div class="price-item">
            <div class="item-s1">小计</div>
            <div class="item-s2">$10.00</div>
          </div>
          <div class="price-total">
            <div class="item-s1">总价</div>
            <div class="item-s2">$20.00</div>
          </div>
        </div>
        <div class="pay-btn">
          安全支付
        </div>
      </div>
    </my-content>
  </div>
</template>
<script>
// 引入头部组件
import TopBar from '@/components/topbar/TopBar'
// 引入内容组件
import MyContent from '@/components/content/MyContent'
// 引入购物车单品组件
import CartProductCard from '@/components/product/CartProductCard'
export default {
  data() {
    return {}
  },
  methods: {
    goto() {
      this.$router.go(-1)
    },
  },
  components: {
    TopBar,
    MyContent,
    CartProductCard,
  },
}
</script>
<style scoped>
.main-box {
  margin-top: 80px;
}
.price-box {
  display: flex;
  flex-direction: column;
  margin-top: 15px;
}
.price-item {
  display: flex;
  padding: 10px 0px;
}
.price-total {
  display: flex;
  padding: 10px 0px;
  font-weight: bold;
  font-size: 16px;
}
.item-s1 {
  flex: 8;
  display: flex;
  justify-content: flex-end;
}
.item-s2 {
  flex: 2;
  display: flex;
  justify-content: flex-end;
}
.pay-btn {
  margin-top: 15px;
  width: 100%;
  height: 56px;
  background-color: #02d126;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  font-size: 20px;
  font-weight: bold;
}
</style>
