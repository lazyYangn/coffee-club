// 优点：除非手动或者浏览器设置清空缓存被激活，否则一直存在
// localstorage本身支持字符串
//目的：为了可替换
export const getArray = (key) => {
  let val = localStorage.getItem(key)
  return val === null ? [] : val.split(',')
}
//封装是为了可替换
export const setArray = (key, val) => {
  let arr = getArray(key)
  // 判断是否已经搜索过
  if (arr.indexOf(val) < 0) {
    arr.push(val)
    localStorage.setItem(key, arr.toString())
  }
}
// 获取本地存储
export const getCacheVal = (key) => {
  let val = localStorage.getItem(key)
  return val === null ? '' : val
}

// 设置本地存储
export const setCacheVal = (key, val) => {
  return localStorage.setItem(key, val)
}

// 清除本地存储
export const clearItem = (key) => {
  localStorage.removeItem(key)
}

// 全部清除
export const clearCache = () => {
  return localStorage.clear()
}
