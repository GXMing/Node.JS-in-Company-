const pug = require("pug");

const compiledFunction = pug.compileFile('template.pug');

console.log(compiledFunction({
    name : 'ccc'
}))


//renderFile 重新再多编译一个文件
console.log(pug.renderFile('template.pug', {
  name: 'Timothy'
}));