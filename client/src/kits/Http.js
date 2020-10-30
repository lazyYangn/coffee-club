import axios from 'axios';

export const baseUrl = 'http://127.0.0.1:3002';
export const ImgUrl = baseUrl + '/imgs/';

// 创建axios单例
const instance = axios.create({
  baseURL: baseUrl,
  // 设置超时时间
  timeout: 1000,
  // 设置请求头
  headers: {
    'Content-Type': 'application/json',
  },
});
// 使用单例进行请求
instance.interceptors.request.use(
  (config) => config,
  (e) => Promise.reject(e)
);

instance.interceptors.response.use(
  (resp) => {
    if (resp.status === 200) {
      return Promise.resolve(resp);
    } else {
      return Promise.reject(resp);
    }
  },
  (e) => {
    if (e.response.status) {
      return Promise.reject(e.response);
    }
  }
);
// 设置http请求
export const Http = (api, param) => {
  return new Promise((resolve, reject) => {
    instance
      .post('/api' + api, param)
      .then((res) => {
        resolve(res.data);
      })
      .catch((e) => {
        reject(e);
      });
  });
};
// 设置gql查询请求
export const HttpGql = (param) => {
  return new Promise((resolve, reject) => {
    instance
      .post('/gql', param)
      .then((res) => {
        resolve(res.data);
      })
      .catch((e) => {
        reject(e);
      });
  });
};
