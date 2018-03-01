var htmlWebpackPlugin = require("html-webpack-plugin");
var path = require("path");
var LoaderOptionsPlugin = require("postcss-loader")


module.exports = {
    entry : {
        app : './src/app.js'
    },
    module : {
        loaders : [
            {
                test : /\.js$/,
                loader : 'babel-loader',
                include : path.resolve(__dirname,'src'),
                exclude : path.resolve(__dirname,'node_modules'),
            },
            {
                test : /\.css$/,
                use:[
                    'style-loader',
                    'css-loader?importLoaders=1',
                    'postcss-loader',
                ]
            },
        ]
    },
    output : {
        path : "./dist",
        filename : "js/[name].bundle.js",
        publicPath : "",
    },
    plugins : [
        new htmlWebpackPlugin({
            filename : "index.html",
            template : "index.html",
            title : "a"
        })
    ]
}


//要安装html-webpack-plugin
// entry 为空会报错！！！！！！！！！！！！！！！！！
// 路径要用绝对路径
// 
// 
// 安装babel-loader
// js ES6转化
// npm install --save-dev babel-loader babel-core   //安装babel-loader
// npm install --save-dev babel-preset-latest   //安装babel-preset-latest
// // npm install babel-preset-env --save-dev  //要先安装env语法（ES6版本规范，有多种，要安装）
// /////////package.json 内设置
// "babel": {
//   "presets": ["env"]
// },
// 
// loaders : [
//         {
//             test : /\.js$/,
//             loader : 'babel-loader',
//             exclude : './node_modules',    //不引用node_modules内内容（在这里没用,因为是相对路径）
//             include : './src',             //只引用src内的内容          （加快打包速度）
//         }
//     ]
//   
// ********************新版 ***********（presets只能写在packagejson ？）
// // 新版本的用options
// // {
//      test: /\.js$/,      //正则判断js文件
//     loader: 'babel-loader',      //js引用babel-loader
//     exclude: path.resolve(__dirname, 'node_modules'),   //解析为绝对路径
//     include: path.resolve(__dirname, 'src'),
//     options: {
//     presets: ['env']
//     }
// },
// 
// 
// 
// 引入css文件
// npm install --save-dev css-loader style-loader          //安装 css-loader style-loader
// app.js  引入css文件
// //loader : 'style-loader!css-loader!postcss-loader',
// 
// npm install --save-dev postcss-loader          //postcss后处理器
// //npm install --save-dev autoprefixer              //安装autoprefixer
//******** 建议在webpack.config.js同层目录下建立postcss.config.js,否则如果你把postcss的一些options写在loader里面，你引入less和sass的时候同样需要再写一遍postcss的配置。*****/
// module.exports = {
//     plugins : [
//         require('autoprefixer')({
//             browsers : ['last 5 versions']
//         })
//     ]
// }
// 
// ?importLoaders=1  //css内的引入文件数，才能进行postcss处理