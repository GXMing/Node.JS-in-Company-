
// process.argv //这次输入值集合
// process.stdout.* //终端输出方法
// process.stdin.* //终端输入方法
// process.exit(); // 退出

//process 是全局命令
// process.argv[2] 的值为 -w 时   // process.argv一开始输入的命令
if(process.argv[2] === '-w'){
    var args = process.argv.slice(3);   //获取输入的值
    var output = '';
    args.forEach(function (item){
        output += item + ' ';
    })
    console.log(args)
    console.log(output);
    process.exit();
}

function read(prompt) {
    process.stdout.write(prompt + ':');
    process.stdin.resume();    //恢复流
    process.stdin.setEncoding('utf-8');
    process.stdin.on('data', function(chunk) {
        console.log("a" == "a")
      process.stdout.write('output: ' + chunk);
      
    });
}

read('input')

// process.stdin.setEncoding('utf8');

// process.stdin.on('readable', () => {
//   const chunk = process.stdin.read();
//   if (chunk !== null) {
//     process.stdout.write(`data: ${chunk}`);
//   }
// });

// process.stdin.on('end', () => {
//   process.stdout.write('end');
// });


// //暴露给 repl 交互式解释器
// const repl = require('repl');
// const msg = 'message';

// repl.start('> ').context.m = msg;   //在控制器输入m


//设置只读对象
// const r = repl.start('> ');
// Object.defineProperty(r.context, 'm', {
//   configurable: false,
//   enumerable: true,
//   value: msg
// });


//********************* */
// const repl = require('repl');

// const r = repl.start({ prompt: '> ', eval: myEval, writer: myWriter });

// function myEval(cmd, context, filename, callback) {
//     // console.log("cmd:"+cmd)
//     // console.log("context:"+context)
//     // console.log("filename:"+filename)
//     let result;
//     try {
//       result = vm.runInThisContext(cmd);
//     } catch (e) {
//       if (isRecoverableError(e)) {
//         return callback(new repl.Recoverable(e));
//       }
//     }
//     callback(null, result);
// }
// function isRecoverableError(error) {
//     if (error.name === 'SyntaxError') {
//       return /^(Unexpected end of input|Unexpected token)/.test(error.message);
//     }
//     return false;
//   }

// function myWriter(output) {
//     console.log(3)
//   return output.toUpperCase();
// }