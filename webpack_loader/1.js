/*************************************
    1
*****************************************/
// var sex = "boy";
// var echo = function(str){
//     console.log(str)
// }

// export {sex,echo}
//通过向大括号中添加sex，echo变量并且export输出，就可以将对应变量值以sex、echo变量标识符形式暴露给其他文件而被读取到
//不能写成export sex这样的方式，如果这样就相当于export "boy",外部文件就获取不到该文件的内部变量sex的值，因为没有对外输出变量接口,只是输出的字符串。



/***************************************
2
****************************************/
var sex = "boy";
export default sex;

//原本直接export sex外部是无法识别的，加上default就可以了.但是一个文件内最多只能有一个export default。
//其实此处相当于为sex变量值"boy"起了一个系统默认的变量名default，自然default只能有一个值，所以一个文件内不能有多个export default。














// https://www.cnblogs.com/dupd/p/5951311.html
// html 引用要用type="module"
// 
