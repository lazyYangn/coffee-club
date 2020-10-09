import Vue from 'vue'
import { Input, Icon, message, List, Carousel, Avatar, Skeleton, Button, FormModel, Modal, Card, Drawer, Upload, Spin, Tabs, Radio, InputNumber, Steps, Collapse } from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'

Vue.use(Input)
Vue.use(Icon)
Vue.use(List)
Vue.use(Carousel)
Vue.use(Avatar)
Vue.use(Button)
Vue.use(Skeleton)
Vue.use(FormModel)
Vue.use(Modal)
Vue.use(Card)
Vue.use(Drawer)
Vue.use(Upload)
Vue.use(Spin)
Vue.use(Tabs)
Vue.use(Radio)
Vue.use(InputNumber)
Vue.use(Steps)
Vue.use(Collapse)
message.config({
  top: '100px',
  duration: 2,
  maxCount: 3,
})
// 引入并使用提示框
Vue.prototype.$message = message
Vue.prototype.$info = Modal.info
Vue.prototype.$success = Modal.success
Vue.prototype.$error = Modal.error
Vue.prototype.$warning = Modal.warning
Vue.prototype.$confirm = Modal.confirm
