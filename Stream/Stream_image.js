var fs = require("fs");
var source = fs.readFileSync("../Buffer/ccc.jpg");  //同步的方式读取文件

fs.writeFileSync("ddd_copy.jpg",source);  //同步的方式写入文件