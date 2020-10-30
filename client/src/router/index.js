import Vue from 'vue';
import VueRouter from 'vue-router';

const Main = () => import('@/components/pages/Main.vue');
const Home = () => import('@/components/pages/tabs/Home');
const Like = () => import('@/components/pages/tabs/Like.vue');
const Account = () => import('@/components/pages/tabs/Account.vue');
const Cart = () => import('@/components/pages/tabs/Cart.vue');
const Search = () => import('@/components/pages/Search.vue');
const ProductShow = () => import('@/components/display/ProductShow.vue');
const ProductDetails = () => import('@/components/display/ProductDetails.vue');
const CategoryDetails = () => import('@/components/categorydetails/CategoryDetails.vue');
const SearchResult = () => import('@/components/pages/SearchResult.vue');
const Login = () => import('@/components/pages/Login.vue');
const Register = () => import('@/components/pages/Register.vue');
const Setting = () => import('@/components/pages/Setting.vue');
const SelectCoffee = () => import('@/components/pages/SelectCoffee.vue');
const Order = () => import('@/components/order/Order.vue');
const OrderDetail = () => import('@/components/order/OrderDetail.vue');
const ProblemBack = () => import('@/components/pages/ProblemBack.vue');
const OrderAffirm = () => import('@/components/order/OrderAffirm.vue');
const Payment = () => import('@/components/pages/Payment.vue');
const UploadImg = () => import('@/components/pages/UploadImg.vue');
const About = () => import('@/components/pages/About.vue');
Vue.use(VueRouter);

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
  { path: '/order', name: 'order', component: Order },
  { path: '/orderdetail', name: 'orderdetail', component: OrderDetail },
  { path: '/problemback', name: 'problemback', component: ProblemBack },
  { path: '/orderaffirm', name: 'orderaffirm', component: OrderAffirm },
  { path: '/payment', name: 'payment', component: Payment },
  { path: '/uploadimg', name: 'uploadimg', component: UploadImg },
  { path: '/about', name: 'about', component: About },
];

const router = new VueRouter({
  routes,
});
// 导出路由
export default router;
