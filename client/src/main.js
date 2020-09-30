import Vue from 'vue';
import App from './App.vue';
import './antd/index';
// 引入路由
import router from './router/index';
import store from './store/index';
import 'ant-design-vue/dist/antd.css';
import './assets/css/common.css';
import './assets/icon/iconfont.css';
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
