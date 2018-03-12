<%@ Page Language="C#" AutoEventWireup="true" CodeFile="M_product_C.aspx.cs" Inherits="M_product_C" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="keywords" content="芭美奴织造制衣有限公司"/>
    <meta name="description" content="芭美奴织造制衣有限公司"/>
    <title>芭美奴织造制衣有限公司</title>
    <link rel="stylesheet" type="text/css" href="css/swiper-3.4.2.min.css" />
    <link rel="stylesheet" type="text/css" href="css/M_base_C.css" />
    <link rel="stylesheet" type="text/css" href="css/M_page_C.css" />
    <script type="text/javascript" src="js/rem.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/M_header_C.js"></script>
    <script type="text/javascript" src="js/message.js"></script>
    <script type="text/javascript" src="js/swiper-3.4.2.jquery.min.js"></script>
        <script src="js/jquery-ajax-pager.js"></script>
    <script src="js/js-extend.js"></script>
    <link href="js/page.css" rel="stylesheet" />
    <script type="text/javascript">
    $(function(){
        $(".product-nav").on("click","li",function(){
            var $subnav = $(this).find(".p-subnav");
            if($subnav.is(":hidden")){
                $subnav.slideDown();
                $(document).on("click",function(){
                    $subnav.slideUp();
                    $(document).off("click");
                })
                return false;
            }else{
                $subnav.slideUp();
            }
        });

        //选中样式
       function getQueryString(name) {
           var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
           var r = window.location.search.substr(1).match(reg);
           if (r != null) return decodeURI(r[2]); return null;
       }
       function Tp_nav(){
            var Tfl = getQueryString("fl");
            if(Tfl=="女内裤"){
                $(".product-nav li").eq(1).addClass('active').siblings('li').removeClass('active');
            }
       };
       Tp_nav();

//       //详情轮播函数
//        function det_lubo(){
//            /*产品详情导航轮播*/
//            var mySwiper4 = new Swiper ('.det-banner-nav .swiper-container', {
//                                    direction: 'horizontal',
//                                    loop: false,
//                                    spaceBetween :5,
//                                    // autoplay : 3000,
//                                    autoplayDisableOnInteraction : false,
//                                    paginationClickable :true,
//                                    slidesPerView :'auto',
//                                    prevButton:'.det-banner-nav .swiper-button-prev',
//                                    nextButton:'.det-banner-nav .swiper-button-next',
//                                });
//            /*产品详情轮播*/
//            var mySwiper3 = new Swiper ('.det-banner .swiper-container', {
//                                    direction: 'horizontal',
//                                    loop: true,
//                                    //autoplay : 3000,
//                                    autoplayDisableOnInteraction : false,
//                                    paginationClickable :true,
//                                    onSlideChangeStart:function(swiper){
//                                        var Tindex = swiper.realIndex;
//                                        $('.det-banner-nav .swiper-slide').eq(Tindex).addClass('active').siblings('li').removeClass('active');
//                                        mySwiper4.slideTo(Tindex, 1000, true);
//                                    }
//                                });

//            $(".det-banner-nav").on("click",".swiper-slide",function(){
//                var Tindex = $(this).index()+1;
//                mySwiper3.slideTo(Tindex, 1000, true);
//            });
//            $('.det-banner-nav .swiper-slide').eq(0).addClass('active');
//        };

        //点击显示详情
        $(".product-menu").on("click", "li a", function () {
            $.ajax({

                type: "post",
                url: "xiangce.ashx",
                dataType: "json",
                data: { id: this.getAttribute("data-id"), },

                success: function (data) {
                    var tableStr = "";
                    $.each(data.items, function (i, v) {

                        tableStr +=

                            "<img src='../ImageFile/" + v.TiltleImgs + "'/>";
                    });
                    $('#tupian1').html(tableStr);
                    $('#tupian2').html(tableStr);
                   // det_lubo();
                }
            })
            var a = $(this).find("img").attr("src");

            $(".product-menu").hide();
            $(".Tpage-box").hide();
            $(".product-details").show();
            
        });
        $(".product-details").on("click",".back",function(){
            $(".product-details").hide();
            $(".product-menu").show();
            $(".Tpage-box").show();
        });

//        $(".back").click(function(){
//            $(".product-details").hide();
//            $(".product-menu").show();
//            $(".Tpage-box").show();
//        });

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

                  $("#page").sjAjaxPager({
                      url: "pro1.ashx",
                      pageSize: 8,
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

                              tableStr +=


                                  "<li><a href='#details' data-id='" + v.Ids + "'><img src='../ImageFile/" + v.TiltleImgs + "' /></a></li>";
                          });

                          $('#cp').html(tableStr);
                          //$('#adddiv').append(tableStr);


                      },
                      complete: function () {
                      }
                  });
              });




          </script> 
</head>
<body>


    <div class="Thtml-box">
      <div class="nav"></div>

      <div class="Tbody-box">
        <!-- 头部 -->
        <header class="header"></header>

        <!-- 主体 -->
        <div class="main">
            <div class="page-banner"><img src="M_image/brand-banner.jpg" /></div>
            
            <div class="product-content">
               <p class="p-item-tit">产品中心<br /><span>Product Center</span></p>
               <ul class="product-nav">
                   <li class="active">
                        <span>男士</span>
                        <div class="p-subnav">
                            <a href="M_product_C.aspx?fl=短袖">短袖</a>
                            <a href="M_product_C.aspx?fl=背心">背心</a>
                            <a href="M_product_C.aspx?fl=阿罗裤">阿罗裤</a>
                            <a href="M_product_C.aspx?fl=锦纶内裤">锦纶内裤</a>
                            <a href="M_product_C.aspx?fl=莫代尔内裤">莫代尔内裤</a>
                        </div>
                   </li>
                   <li><a href="M_product_C.aspx?fl=女内裤">女士</a></li>
               </ul>
               <ul class="product-menu wrap" id="cp">
                   <%--<li><a href="#details"><img src="M_image/产品1.jpg"  /></a></li>
                   <li><a href="#details"><img src="M_image/产品2.jpg"  /></a></li>
                   <li><a href="#details"><img src="M_image/产品3.jpg"  /></a></li>
                   <li><a href="#details"><img src="M_image/产品3.jpg"  /></a></li>
                   <li><a href="#details"><img src="M_image/产品2.jpg"  /></a></li>
                   <li><a href="#details"><img src="M_image/产品1.jpg"  /></a></li>
                   <li><a href="#details"><img src="M_image/产品1.jpg"  /></a></li--%>>
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
                <a name="details"></a>
               <div class="product-details">
                   <%--<!-- 产品详情轮播 -->
                   <div class="det-banner">
                       <div class="swiper-container">
                           <ul class="swiper-wrapper"  id="tupian1">
                               <li class="swiper-slide"><img src="image/产品1.jpg" /></li>
                               <li class="swiper-slide"><img src="image/产品2.jpg" /></li>
                               <li class="swiper-slide"><img src="image/产品3.jpg"  /></li>
                           </ul>
                       </div>
                   </div>
                   <!-- 产品详情轮播导航 -->
                   <div class="det-banner-nav">
                       <div class="swiper-container">
                           <ul class="swiper-wrapper" id="tupian2">
                               <li class="swiper-slide"><img src="image/产品1.jpg" /></li>
                               <li class="swiper-slide"><img src="image/产品2.jpg" /></li>
                               <li class="swiper-slide"><img src="image/产品3.jpg"  /></li>
                           </ul>
                       </div>
                       <div class="swiper-button-prev"></div>
                       <div class="swiper-button-next"></div>
                   </div>
                   --%>
                   <div class="det-txt" id="tupian2" >
                        
                   </div>
                   <div class="btn-box">
                        <a href="###" title="上一个"><img src="image/p-btn1.png" alt="上一个" /></a>
                        <a href="###" title="下一个"><img src="image/p-btn2.png" alt="下一个" /></a>
                    </div>
                   <div class="back">
                       <a href="javascript:;">返回</a>
                   </div>
               </div>

               <div class="message-box">
                    <p class="p-item-tit">留言板<br /><span>Message Board</span></p>
                    <div class="form wrap">
                        <input type="text" placeholder="您的名字" id="name" />
                        <input type="text" placeholder="联系电话" id="phone" />
                        <input type="text" placeholder="详细地址" id="address" />
                        <textarea type="text" placeholder="请问您需要什么？" id="text" ></textarea>
                        <button class="submit-btn">提交</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 尾部 -->
        <footer class="footer"></footer>
      </div>
    </div>
    

<script type="text/javascript" src="js/correctrem.js"></script>
</body>
</html>
