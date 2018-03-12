<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product_C.aspx.cs" Inherits="product_C" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="芭美奴织造制衣有限公司"/>
    <meta name="description" content="芭美奴织造制衣有限公司"/>
    <title>芭美奴织造制衣有限公司</title>
    <link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
    <link rel="stylesheet" type="text/css" href="css/base_C.css" />
    <link rel="stylesheet" type="text/css" href="css/page_C.css" />
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/swiper-3.4.2.jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.movebg.js"></script>
    <script type="text/javascript" src="js/header_C.js"></script>
    <script type="text/javascript" src="js/message.js"></script>
        <script src="js/jquery-ajax-pager.js"></script>
    <script src="js/js-extend.js"></script>
    <link href="js/page.css" rel="stylesheet" />
    <script type="text/javascript">
        $(function () {

            //选中样式
            function getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return decodeURI(r[2]); return null;
            }
            function TString(name) {
                var arr = [];
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");

                $.each($('.product-nav li a'), function () {
                    var Ts = $(this).attr('href');
                    var Tb = "?" + Ts.substring(Ts.indexOf('?') + 1, Ts.length);
                    var r = Tb.substr(1).match(reg);
                    arr.push(decodeURI(r[2]));
                })
                return arr;
            }
            function Tactive() {
                var Tname = getQueryString('fl');
                var Tindex = 0;
                var Tarr = TString('fl');
                $.each(Tarr, function (index, value) {
                    if (value == Tname) {
                        $('.product-nav li').eq(Tindex).addClass('active');
                        return false;
                    }
                    else {
                        Tindex++;
                    }
                })
            }
            Tactive();

//            //详情轮播函数
//            function det_lubo() {
//                /*产品详情导航轮播*/
//                var mySwiper4 = new Swiper('.det-banner-nav .swiper-container', {
//                    direction: 'horizontal',
//                    loop: false,
//                    spaceBetween: 5,
//                    // autoplay : 3000,
//                    autoplayDisableOnInteraction: false,
//                    paginationClickable: true,
//                    slidesPerView: 'auto',
//                    prevButton: '.det-banner-nav .swiper-button-prev',
//                    nextButton: '.det-banner-nav .swiper-button-next',
//                });
//                /*产品详情轮播*/
//                var mySwiper3 = new Swiper('.det-banner .swiper-container', {
//                    direction: 'horizontal',
//                    loop: true,
//                    //autoplay : 3000,
//                    autoplayDisableOnInteraction: false,
//                    paginationClickable: true,
//                    onSlideChangeStart: function (swiper) {
//                        var Tindex = swiper.realIndex;
//                        $('.det-banner-nav .swiper-slide').eq(Tindex).addClass('active').siblings('li').removeClass('active');
//                        mySwiper4.slideTo(Tindex, 1000, true);
//                    }
//                });

//                // $('.det-banner-nav .swiper-slide').each(function(){
//                //     $(this).click(function(){
//                //         var Tindex = $(this).index()+1;
//                //         mySwiper3.slideTo(Tindex, 1000, true);
//                //     })
//                // });
//                $(".det-banner-nav").on("click", ".swiper-slide", function () {
//                    var Tindex = $(this).index() + 1;
//                    mySwiper3.slideTo(Tindex, 1000, true);
//                });
//                $('.det-banner-nav .swiper-slide').eq(0).addClass('active');
//            };

        });
    </script>
<script>
   function getQueryString(name) {
       var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
       var r = window.location.search.substr(1).match(reg);
       if (r != null) {
           return decodeURI(r[2]);
       } else {
           return null;
       }
   }
   $(document).ready(function () {
        
        var dataId_arr = [];

       $("#page").sjAjaxPager({
           url: "pro.ashx",
           pageSize: 9,
           searchParam: {
               /*
               * 如果有其他的查询条件，直接在这里传入即可
               */
               fenlei: getQueryString('fl'),

           },
           beforeSend: function () {
           },
           success: function (data) {
               /*
               *返回的数据根据自己需要处理
               */
               var tableStr = "";
               
               $.each(data.items, function (i, v) {
                    
                    dataId_arr.push(v.Ids);
                   tableStr +=

           
                   "<li><a href='#details' data-id='" + v.Ids + "'><img src='../ImageFile/" + v.TiltleImgs + "' /></a></li>";
               });

               $('#cp').html(tableStr);
               //$('#adddiv').append(tableStr);
               console.log(dataId_arr)

           },
           complete: function () {
           }
       });

       function ajax_fun(Tindex){
            var obj = $("product-menu li a").eq(Tindex)[0]
           $.ajax({

               type: "post",
               url: "xiangce.ashx",
               dataType: "json",
               data: { id: obj.getAttribute("data-id"),},
         
               success: function (data) {
                   var tableStr = "";
                   $.each(data.items, function (i, v) {

                       tableStr +=

                           "<img src='../ImageFile/" + v.TiltleImgs + "'/>";
                   });
                   $('#tupian1').html(tableStr);
                   $('#tupian2').html(tableStr);
//                        det_lubo();
               }
           })
       }

       //点击显示详情
       $(".product-menu").on("click", "li a", function () {
            var Tindex = $(this).index();
            var Tlength = $(this).length();
            console.log(Tlength)
           var now_index = Tindex;
           ajax_fun(Tindex);
           //getAttribute()取值属性
         
           var a = $(this).find("img").attr("src");
           // var bannerimg = "<li class='swiper-slide'><img src="+a+" /></li>";
           // $(".swiper-wrapper").append(bannerimg);

           $(".product-menu").hide();
           $(".Tpage-box").hide();
           $(".product-details").show();
           
           $("#prev-btn").on("click",function(){

                if(now_index <= 0 ){
                    return false
                }else{
                    now_index--
                    ajax_fun(now_index);
                }
           })
           $("#next-btn").on("click",function(){
                if(now_index >= Tlength-1 ){
                    return false
                }else{
                    now_index++
                    ajax_fun(now_index);
                }
           })
       });
       $(".back").click(function () {
           $(".product-details").hide();
           $(".product-menu").show();
           $(".Tpage-box").show();
       });
       
   });




  </script> 
</head>
<body>
    <!-- 头部 -->
    <header class="header"></header>

    <!-- 主体 -->
    <div class="main">
        <!-- 子页banner -->
        <div class="page-banner" style="background-image:url(image/产品中心banner.jpg);"></div>

        <div class="product-content page-item-p">
        <a name="details"></a>
            <div class="wrap">
                <p class="item-tit">全部分类<br /><span>All categories</span></p>
                <ul class="product-nav">
                    <li><a href="product_C.aspx?fl=短袖">短袖</a></li>
                    <li><a href="product_C.aspx?fl=背心">背心</a></li>
                    <li><a href="product_C.aspx?fl=阿罗裤">阿罗裤</a></li>
                    <li><a href="product_C.aspx?fl=锦纶内裤">锦纶男内裤</a></li>
                    <li><a href="product_C.aspx?fl=莫代尔内裤">莫代尔男内裤</a></li>
                    <li><a href="product_C.aspx?fl=女内裤">女内裤</a></li>
                </ul>

                <ul class="product-menu" id="cp">
                  <%--  <li>
                        <a href="#details"><img src="image/产品1.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品2.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品3.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品1.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品2.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品3.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品1.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品2.jpg"  /></a>
                    </li>
                    <li>
                        <a href="#details"><img src="image/产品3.jpg"  /></a>
                    </li>--%>
                </ul>
                <!-- 分页 -->
                <div class="Tpage-box">
                    <div id="page">
                        <span class="disenable"> </span>
                        <span class="current">1</span>
                        <a href="###">2</a>
                        <a href="###">3</a>
                        <span>....</span>
                        <a href="###">4</a>
                        <a href="###"> </a>
                    </div>
                </div>
                <!-- 产品详情 -->
                <div class="product-details" style="display:none;" >
                   <%-- <!-- 产品详情轮播 -->
                    <div class="det-banner">
                        <div class="swiper-container">
                            <ul class="swiper-wrapper" id="tupian1">
                                <li class="swiper-slide"><img src="image/产品1.jpg" /></li>
                                <li class="swiper-slide"><img src="image/产品详情1.jpg" /></li>
                                <li class="swiper-slide"><img src="image/产品详情2.jpg"  /></li>
                                <li class="swiper-slide"><img src="image/产品详情3.jpg"  /></li>
                            </ul>
                        </div>
                    </div>
                    <!-- 产品详情轮播导航 -->
                    <div class="det-banner-nav">
                        <div class="swiper-container">
                            <ul class="swiper-wrapper" id="tupian2">
                                <li class="swiper-slide"><img src="image/产品1.jpg" /></li>
                                <li class="swiper-slide"><img src="image/产品详情1.jpg" /></li>
                                <li class="swiper-slide"><img src="image/产品详情2.jpg"  /></li>
                                <li class="swiper-slide"><img src="image/产品详情3.jpg"  /></li>
                            </ul>
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>--%>
                    <div class="det-txt" id="tupian2">
                        
                    </div>
                    <div class="det-bottom">
                        <a href="#none" class="back" >返回</a>
                        <p class="tit">产品详情</p>
                    </div>
                    <div class="btn-box">
                        <a id="prev-btn" href="###" title="上一个"><img src="image/p-btn1.png" alt="上一个" /></a>
                        <a id="next-bnt" href="###" title="下一个"><img src="image/p-btn2.png" alt="下一个" /></a>
                    </div>
                </div>
            </div>

            <div class="form-box">
                <p class="tit">联系我们<br /><span>Contact us</span></p>
                <div class="form">
                    <input type="text" placeholder="您的名字" id="name" />
                    <input type="text" placeholder="联系电话" id="phone" />
                    <input type="text" placeholder="详细地址" id="address" />
                    <textarea type="text" placeholder="请问您需要什么？..." id="text" ></textarea>
                    <button class="submit-btn">提交</button>
                </div>
            </div>

        </div>
    </div>

    <!-- 尾部 -->
    <footer class="footer"></footer>

</body>
</html>