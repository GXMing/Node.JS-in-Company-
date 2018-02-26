var fs = require("fs");

var readStream = fs.createReadStream("1.mp4");
var writeStream = fs.createWriteStream("1_copy.mp4");

readStream.on("data",function(chunk){
    //数据流，防爆仓处理，读取流和写入流，  写入流如果比较慢，可先暂停读取pause，等写入完成后，执行drain时，去开启resume，继续读取写入
    //writeStream.write(chunk) 将读取到的流写入
    //writeStream.write(chunk) === false   判断是否写入完毕
    if(writeStream.write(chunk) === false){
        readStream.pause();  //暂停读取
        console.log("读取比写入快——————暂停读取");
    }
})
//drain写入完毕时发生
writeStream.on("drain",function(){
    console.log("写入完毕！！")  
    readStream.resume();          //开始读取
})

readStream.on("end",function(){
    writeStream.end();
})