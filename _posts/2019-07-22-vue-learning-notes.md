---
title: Vue 学习笔记
tags: javaScript 
---

Vue学习笔记

<!--more-->

### 文本渲染

1. {{}} 使用 v-cloak 来消除闪烁
2. v-text 
3. v-html 渲染html

### 属性绑定

v-bind 简写为`:`

```html
<input type="button" value="按钮"  v-bind:title="mytitle">
```

### 事件绑定

v-on:event 绑定事件 用 `@` 简写 v-on

```html
<input type="button" v-on:click="show" value="弹窗">
<input type="button" @click="show" value="弹窗">
```

在Vue实例中想要调用 methods 中的方法，如果想要调用 data 中的属性名，必须使用 this 来引用属性.

### Vue 的事件修饰符

- stop 阻止冒泡
- prevent 阻止默认事件
- capture 添加事件侦听器时候使用事件捕获模式.
- self 只有事件在该元素本身（不是子元素）处罚时返回
- once 事件仅仅触发一次。串联的默认行为也只触发一次

```html
<input type="button" @click.stop="btnHandler" value="戳他">
```

事件修饰符可以串联: 

```html
<a href="https://www.baidu.com" @click.prevent.once="linkHandler">百度</a>
```

### v-model 表单双向绑定

```html
<input type="text" name="inputText" id="" v-model="msg">
```

> v-model 定义只能用于表单元素

### Vue 设置css样式

#### class

1. 数组: 使用数组引用class 样式.只需要在在`:class` 属性中使用一个数组

   ```html
    <h1 :class="['thin', 'red']">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

2. 数组中使用三元表达式`?:`

   ```html
   <h1 :class="['thin', 'red', flag?'active' : '']">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

   在 Vue 的 data 中指定 `flag`

   ```javascript
   data: {
       flag: true
   },
   ```

3. 数组中使用对象来代替三元表达式，提高代码可读性: 

   ```html
   <h1 :class="['thin', 'red', {'active': flag}]">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

4. 直接使用一个对象

   ```html
    <h1 :class="{red:true, thin: true, italic : false, active: false}">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

   对象的属性作为类名， 属性可以不用加引号，属性的值是一个标识符.

   我们可以把这个对象作为一个model 保存在 data 中， 然后使用`:class` 引用

   ```html
    <h1 :class="classObj">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

   ```javascript
   data: {
       classObj: { red: true, thin: true, italic: false, active: false },
   },
   ```

#### 行内样式

1. 直接使用 `v-bind`书写style 对象

   ```html
   <h1 :style="{color: 'red', 'font-weight': 200}">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

   同样可以把对象抽取到 data 中

   ```html
    <h1 :style="styleObj">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

   ```javascript
   data: {
       styleObj: { color: 'red', 'font-weight': 200 }
   },
   ```

2. 使用数组来引用多个样式

   ```html
   <h1 :style="[styleObj, styleObj2]">这是一个很大很大的h1, 大到你无法想象</h1>
   ```

   ```javascript
   data: {
       styleObj: { color: 'red', 'font-weight': 200 },
       styleObj2: {'font-style': 'italic'}
   },
   ```

### v-for  的使用

- 直接访问数组

  ```html
  <p v-for="item in list">{{item}}</p>
  ```

  ```javascript
  data: {
      list: [1, 3, 4, 5, 6, 7]
  },
  ```

  使用数组的索引： i 从 0 开始

  ```html
  <p v-for="(item, i) in list">{{i}} - {{item}}</p>
  ```

- 访问对象数组

  

  ```html
   <p v-for="(user, i) in list">{{i}} - {{user.id}}: {{user.name}}</p>
  ```

  ```javascript
  list: [
      {id: 1, name: 'Lidy'},
      {id: 2, name: 'mard'},
      {id: 3, name: 'mike'},
      {id: 4, name: 'hello'}
  ]
  ```

- 迭代数字 

  ```html
  <p v-for="count in 10">这是第{{count}}次运算</p> <!--循环10次 从 1 开始-->
  ```

  > 如果使用 v-for 迭代数字的话， 前面的count 值从1开始

  

#### v-for使用的注意事项

`v-for` 循环的时候 `key` 只能使用 `number` ,` string`.

`key` 在使用的时候必须使用 `v-bind` 指定key的值.

使用key 来保证数据的唯一性

```html
<p v-for="(user, i) in list" :key="user.id"><input type="checkbox" name="" id="">{{i}} - {{user.id}}: {{user.name}}</p>
```

### v-if  和 v-show

```html
<p v-if="flag">Test String</p>
<p v-show="flag">Test String</p>
```

v-if 每次都会重新删除并且创建元素

v-show 每次不会重新进行dom的删除操作，只是切换了元素的`display:none` 样式

`v-if`又较高的性能消耗，`v-show`用较高的初始效果消耗，如果元素涉及频繁的切换，最好不要使用`v-if` ，如果一个元素可能被创建出来之后永远没有被显示过，可以考虑使用 `v-if` 



