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
import SearchResult from '@/components/pages/SearchResult.vue'
import Login from '@/components/pages/Login.vue'
import Register from '@/components/pages/Register.vue'
import Setting from '@/components/pages/Setting.vue'
import SelectCoffee from '@/components/pages/SelectCoffee.vue'
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
  { path: '/productshow/:id', name: 'productshow', component: ProductShow },
  { path: '/productdetails/:id', name: 'productdetails', component: ProductDetails },
  { path: '/categorydetails/:id', name: 'categorydetails', component: CategoryDetails },
  { path: '/searchresult', name: 'searchresult', component: SearchResult },
  { path: '/login', name: 'login', component: Login },
  { path: '/register', name: 'register', component: Register },
  { path: '/setting', name: 'setting', component: Setting },
  { path: '/selectcoffee/:id', name: 'selectcoffee', component: SelectCoffee },
]

const router = new VueRouter({
  routes,
})
// 导出路由
export default router
