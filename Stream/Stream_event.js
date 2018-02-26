var fs = require("fs");
//var readStream = fs.createReadStream("Stream_image.js");  //用流的方式读取文件
var readStream = fs.createReadStream("1.mp4")
var n = 0;
readStream
    .on("data",function(chunk){
        console.log("文件流传递中！");
        n++

        // readStream.pause();
        // console.log("暂停文件流");
        // setTimeout(function(){
        //     readStream.resume();
        //     console.log("重开文件流");
        // },2000)
        // console.log(Buffer.isBuffer(chunk));
        // console.log(chunk.toString("utf8"));
    })
    .on("readable",function(){
        console.log("文件是可读的！");
    })
    .on("end",function(){
        console.log("文件写入结束！");
        console.log("n = "+n)
    })
    .on("close",function(){
        console.log("流关闭的时候！")
    })
    .on("error",function(err){
        console.log("data error"+err);
    })