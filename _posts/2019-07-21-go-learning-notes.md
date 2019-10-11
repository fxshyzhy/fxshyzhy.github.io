---
title: Go 语言学习笔记
tags: Golang
---

Golang 的语法基础

<!--more-->

### 基本数据类型转换

Golang 中的数据类型必须显式的转换

```go
var i = int32 = 123

var b = float32 = float32(i) // 必须明确指定类型转换

fmt.Printf("i is %T, b is %T", i, b)


//output:
i is int32, b is float32
```

Golang 中的类型转换只是将被转换的值赋值给了另一个类型，本身的类型并没有发生变化。

基本数据类型和string 之间的相互转换

#### 基本数据类型转 string

1.  fmt.Sprintf()

   ```go
   var i int32 = 3333
   str := Sprintf("%d", i)
   fmt.Println(str)
   // output:
   3333
   ```

2. strconv包实现了基本数据类型和其字符串表示的相互转换

   strconv.Format* 函数可以实现基本数据类型转换成 string

   ```go
   var num1 int = 99
   str  = strconv.FormatInt(int64(num1), 2) // param1 int64 param2 进制
   fmt.Println(str)
   // ouput:
   1100011
   str = strconv.FormatInt(int64(num1), 10)
   fmt.Println(str)
   //ouput:
   99
   ```

#### string 转其他基本数据类型

1. strconv.Parse* 可以实现将string 转换成基本数据类型

   ```go
   var str string = "true"
   var b = false
   b, _ = strconv.ParseBool(str)
   fmt.Printf("b = %t, b = %T", b, b)
   // ouput: 
   b = true, b = bool
   ```

   

转型的注意问题

> string 转成基本数据类型， 要确保 string 类型能够转成有效的数据, 如果转型失败 golang 会给转换后的结果赋默认值.

### 指针

和C语言一样， golang 使用 `*`来表示指针变量.使用取地址符`&`可以获取变量在内存中的地址.使用`*`来解引用获取指针指向的变量。

```go
func main(){
	// 基本数据类型在内存的布局
	var i int = 30;
	var ptr *int = &i;
	fmt.Println("i 的内存:", &i)
	fmt.Printf("ptr = %p\n", ptr)
    fmt.Println("ptr 的内存: ", &ptr)
}
// output:
i 的内存: 0xc0000100a0
ptr = 0xc0000100a0
ptr 的内存:  0xc000006028
```

使用指针修改变量: 

```GO
var num1 int = 29
var ptr *int = &num1
*ptr = 40
fmt.Println("num = ", num1);
// output:
num =  40
```

  

每个值类型都有其对应的指针类型 使用 `*xxx` 表示

>  Go 语言的值类型 基本数据类型 int ， float, bool , string, 数组和结构体 struct

### 值类型 引用类型

基本数据类型， 数组， 结构体， 变量直接存储值， 内存通常在栈中分配

引用类型  指针， 切片， map, 管道 Channel, interface ， 变量存储一个地址，这个地址对应的空间才是真正存春地址的地方。

### 标识符

1. 严格区分大小写
2. 数字不可以开头
3. 下划线本身在Go中是一个特殊的字符， 称为控表示服，可以代表任何其他的标识符，但是它的值也会被忽略，（比如某个返回值）仅仅作为占位符来使用。

#### 标识符命名特点

1. 包名对应目录结构， 尽量采取有意义的包名
2. 采用驼峰命名法
3. 变量名，函数名，常量名首字符大写，可以被其他的访问，小写只能在本包中访问。（大写开头表示公开）

#### 运算符

+ 算术运算符 

  主要不同是仅仅支持 `x++`, `x--` 这样的结果，不允许前缀。

+ 关系运算符 同java

+ 逻辑运算符

  连接多个条件