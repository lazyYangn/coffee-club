<template>
  <div class="my-content">
    <slot></slot>
  </div>
</template>

<style>
.my-content {
  padding: 24px;
  height: 100vh;
  overflow-x: hidden; /* 防止横向滚动条 */
  padding-bottom: 80px;
  background-color: #f5f5f5;
}
</style>