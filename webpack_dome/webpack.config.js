var htmlWebpack = require("html-webpack-plugin");  ////引用生成html的插件

module.exports = {
    entry : {
        main_bundle:"./src/script/main.js",
        a:"./src/script/a.js",
        b:"./src/script/b.js",
        c:"./src/script/c.js",
    },
    output : {
        path : "./dist",
        filename : "js/[name].js",
        publicPath : ""
    },
    plugins:[
        new htmlWebpack({
            filename : "a.html",
            template : "index.html",
            title : "a",
            ccc : "任意值",
            inject : false,
            chunks : ["a","main_bundle"]
        }),
        new htmlWebpack({
            filename : "b.html",
            template : "index.html",
            title : "b",
            ccc : "任意值",
        }),
        new htmlWebpack({
            filename : "c.html",
            template : "index.html",
            title : "c",
            ccc : "任意值",
            chunks : ["c","main_bundle"]
        }),

    ]
}

/*
    命令行输入npm run webpack
package.json 里的webpack 参数
 --config webpack.config.js    指定webpack的配置文件（不设置默认为webpack.config.js）（这里可默认）
 --progress      显示打包进度
 --watch  文件改变时自动打包
 --display-reasons  打包引用的原因
 --display-modules   引用到的模块
 --colors  用彩色字在命令行（cmd）展示
 */


/*** ouput ***/
// [name]
// [hash] //打包的hash值
// [chunkhash] //chunk的hash值 (每个生成的文件hash，文件有修改hash才改变)
// 
//publicPath //改变绝对路径


//变量引入html
///<script type="text/javascript" src="<%= htmlWebpackPlugin.files.chunks.main_bundle.entry%>"></script>
///
/*** 安装插件 html-webpack-plugin ***/
/////html-webpack-plugin
//template  //设置模板
//
//minify   //压缩html   https://github.com/kangax/html-minifier#options-quick-reference
    //collapseWhitespace  删除空格 
    //removeComments  删除注释
    //
    // minify : {
    //             collapseWhitespace : true,
    //             removeComments : true,
    //         }
    //         
//
//inject     //设置js引用位置（head/body） false时不插入文件！！！！！！！(但chunks拥有)
//chuncks    //控制chunks的值（如果没有写入的没有chunks，引用会报错）
//excludeChuncks    //（如果写入的chunks被除去，其他chunks写入）（相当chunks取反）