module.exports = {
    entry : "./src/script/main.js",
    output : {
        path : "./dist/js",
        filename : "bundle.js"
    }
}

/*
package.json 里的webpack 参数
 --config webpack.config.js    指定webpack的配置文件（不设置默认为webpack.config.js）（这里可默认）
 --progress      显示打包进度
 --watch  文件改变时自动打包
 --display-reasons  打包引用的原因
 --display-modules   引用到的模块
 --colors  用彩色字在命令行（cmd）展示
 */