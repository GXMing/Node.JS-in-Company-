require("./world.js");
require("./style.css");
/* 吊顶 */
function hellow(str){
    alert(str)
}

hellow("哈哈ddd");


//webpack hellow.js hellow_w.js  --module-bind "css=style-loader!css-loader"  --watch --display-reasons