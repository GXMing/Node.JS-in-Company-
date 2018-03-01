
/******************************************
1
******************************************/
//// 通过import获取a.js文件的内部变量，{}括号内的变量来自于a.js文件export出的变量标识符。
///
// import {sex,echo} from "./1.js"
// console.log(sex)
// echo(sex);
// console.log(echo)
// 


import any from "./1.js"
import any12 from "./1.js"
console.log(any);
console.log(any12);
// 本质上，a.js文件的export default输出一个叫做default的变量，然后系统允许你为它取任意名字。所以可以为import的模块起任何变量名，且不需要用大括号包含