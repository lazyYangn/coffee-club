import Vue from 'vue'
import VueRouter from 'vue-router'
import Main from '@/components/pages/Main.vue'
import Home from '@/components/pages/tabs/Home'
import Like from '@/components/pages/tabs/Like.vue'
import Account from '@/components/pages/tabs/Account.vue'
import Cart from '@/components/pages/tabs/Cart.vue'
import Search from '@/components/pages/Search.vue'
import ProductShow from '@/components/display/ProductShow.vue'
import ProductDetails from '@/components/display/ProductDetails.vue'
import CategoryDetails from '@/components/categorydetails/CategoryDetails.vue'
import CartProductCard from '@/components/product/CartProductCard.vue'
import SearchResult from '../components/pages/SearchResult.vue'
Vue.use(VueRouter)

// 分配路由
const routes = [
  { path: '/', redirect: { path: '/main/home' } },
  {
    path: '/main',
    component: Main,
    children: [
      { path: 'home', component: Home },
      { path: 'like', component: Like },
      { path: 'account', component: Account },
      { path: 'cart', component: Cart },
    ],
  },
  { path: '/search', name: 'search', component: Search },
  { path: '/productshow', name: 'productshow', component: ProductShow },
  { path: '/productdetails', name: 'productdetails', component: ProductDetails },
  { path: '/categorydetails', name: 'categorydetails', component: CategoryDetails },
  { path: '/searchresult', name: 'searchresult', component: SearchResult },
]

const router = new VueRouter({
  routes,
})
// 导出路由
export default router
