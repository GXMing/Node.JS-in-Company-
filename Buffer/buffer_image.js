var fs = require("fs");

fs.readFile("ccc.jpg",function(err,origin_buffer){
    //origin_buffer 字符类型不是utf8
    //origin_buffer 是读取到的Buffer对象（图片的字符类型是base64，这个buffer也是base64）
    //console.log(origin_buffer)  
    console.log(Buffer.isBuffer(origin_buffer))
    fs.writeFile("ccc_1.jpg",origin_buffer,function(err){
        if(err) console.log(err)
    })

    var base64Image = origin_buffer.toString("base64");
    console.log(base64Image);
    var bufImage = new Buffer(base64Image,"base64");
    fs.writeFile("ccc_2.jpg",bufImage,function(err){
        if(err) console.log(err);
    })
})

// 产品名称：谷物坚果燕麦
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105484

// 产品名称：谷物水果燕麦
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105477

// 产品名称：果蔬咸味燕麦片
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105491

// 产品名称：红豆山药芝麻糊（传统精磨）
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105613

// 产品名称：红豆山药芝麻糊（加钙醇香）
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105620

// 产品名称：红枣枸杞燕麦片
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105507


// 产品名称：红枣山药核桃粉（花生牛奶）
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105590

// 产品名称：红枣山药核桃粉（谷物营养）
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105606

// 产品名称：五谷滋养餐（红豆黑燕麦）
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105576

// 产品名称：五谷滋养餐（芝麻黑燕麦）
// 净含量：720克
// 规格：1x12包/件
// 条形码：6933968105583

// 商品名称:维恩纯净葡萄糖
// 净含量：400克
// 规格：1X24包/件 
// 条形码：6933968101271

// 商品名称:维恩初尝葡萄糖
// 净含量：400克
// 规格：1X24包/件 
// 条形码：6933968101301

// 商品名称:维恩铁锌钙葡萄糖
// 净含量：400克
// 规格：1X24包/件 
// 条形码：6933968101295

// 商品名称:维恩伴侣葡萄糖
// 净含量：400克
// 规格：1X24包/件 
// 条形码：6933968101288

// 商品名称:维恩AD钙葡萄糖
// 净含量：400克
// 规格：1X24包/件 
// 条形码：6933968101264