/**
 * [Tools ES6 module]
 */
const moduleName = "Helper Tools";

var HttpTool = {
    get: function (handler) {
        // 解构操作
        var [url, callback] = handler;
        callback(url);
    },
    post: function (url, ...data) {
        console.log(url);
        // ES6 扩展操作符的另类用法
        // 其实其他语言中 php/python 有可变参数的概念
        // php function foo(name, age, ...props)
        // python def foo(name, age, ...props)
        // ES6 的扩展操作符其实也可以这样使用
        // HttpTool.post(url, foo, bar, hello, world)
        // 除给定参数位外的参数都会被压入 data 数组中
        // a, b, c, d 会被 ...data 接受并管理
        // data 则为 [a, b, c, d]
        // ...data 就能得到字面量的 a, b, c, d，但不能显示获取
        // 需要使用解构语法
        // var [a, b, c, d] = data 来操作
        for (var i in data) {
            console.log(data[i]);
        }
    }
}

var MathTool = {
    add: (a, b) => a + b,
    sub: (a, b) => a - b
}

function getModuleName() {
    return moduleName;
}

export default getModuleName;

export { HttpTool, MathTool };