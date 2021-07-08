<%-- 
    Document   : aboutUs
    Created on : Jun 29, 2021, 10:08:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="theme-color" content="#171a21">
        <title>80JS, The Game Platform</title>
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
        <!--my Bootstrap-->

        <!--Jquery, JS-->
        <script src="https://kit.fontawesome.com/9650a62e47.js" crossorigin="anonymous"></script>
        <script src="js/style.js" type="text/javascript"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="${contextPath}/js/slick.min.js"></script>
        <!--Steam Bootstrap-->
        <link href="https://store.akamai.steamstatic.com/public/shared/css/motiva_sans.css?v=Rc2hpzg2Ex3T&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/shared/css/shared_global.css?v=DNyAHkw02IjI&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/shared/css/buttons.css?v=6PFqex5UPprb&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/css/v6/store.css?v=af4GoQWbK5yr&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/css/styles_about.css?v=RCSMB7sOPJGg&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/css/promo/newstore2016.css?v=Lv_hriLyrQ5z&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/shared/css/buttons.css?v=6PFqex5UPprb&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/css/slick/slick.css?v=ZSVHTEnT3WNW&amp;l=english" rel="stylesheet" type="text/css">
        <link href="https://store.akamai.steamstatic.com/public/shared/css/shared_responsive.css?v=3g6jkueAuNYU&amp;l=english" rel="stylesheet" type="text/css">
        <script async="" src="//www.google-analytics.com/analytics.js"></script><script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-33786258-1', 'auto', {
                'sampleRate': 0.4});
            ga('set', 'dimension1', true);
            ga('set', 'dimension2', 'External');
            ga('set', 'dimension3', 'about');
            ga('set', 'dimension4', "about\/about");
            ga('send', 'pageview');

        </script>
        <script type="text/javascript">Object.seal && Object.seal(Object.prototype);</script><script type="text/javascript" src="https://store.akamai.steamstatic.com/public/shared/javascript/jquery-1.8.3.min.js?v=.TZ2NKhB-nliU"></script>
        <script type="text/javascript">$J = jQuery.noConflict();</script><script type="text/javascript">VALVE_PUBLIC_PATH = "https:\/\/store.akamai.steamstatic.com\/public\/";</script><script type="text/javascript" src="https://store.akamai.steamstatic.com/public/shared/javascript/tooltip.js?v=.9Z1XDV02xrml"></script>

        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/shared/javascript/shared_global.js?v=xkJcPulsx0-T&amp;l=english"></script>

        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/main.js?v=KMNUlsnxWi45&amp;l=english"></script>

        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/dynamicstore.js?v=JV4Drj9y8al3&amp;l=english"></script>

        <script type="text/javascript">
            var __PrototypePreserve = [];
            __PrototypePreserve[0] = Array.from;
            __PrototypePreserve[1] = Function.prototype.bind;
        </script>
        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/prototype-1.7.js?v=.a38iP7Khdmyy"></script>
        <script type="text/javascript">
            Array.from = __PrototypePreserve[0] || Array.from;
            Function.prototype.bind = __PrototypePreserve[1] || Function.prototype.bind;
        </script>
        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/scriptaculous/_combined.js?v=Me1IBxzktiwk&amp;l=english&amp;load=effects,controls,slider"></script>


        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function (event) {
                $J.data(document, 'x_readytime', new Date().getTime());
                $J.data(document, 'x_oldref', GetNavCookie());
                SetupTooltips({tooltipCSSClass: 'store_tooltip'});
            });
        </script><script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/about.js?v=T9HhtJ81mJgN&amp;l=english"></script>
        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/slick/slick.js?v=.UvbXNQdQm-AJ"></script>
        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/javascript/rellax/rellax.min.js?v=.KbIxshHXB6Um"></script>
        <script type="text/javascript" src="https://store.akamai.steamstatic.com/public/shared/javascript/shared_responsive_adapter.js?v=RkbcHQD4wqg6&amp;l=english"></script>

        <meta name="twitter:card" content="summary_large_image">
        <meta name="Description" content="Steam is the ultimate destination for playing, discussing, and creating games.">

        <meta name="twitter:site" content="@steam">

        <meta property="og:title" content="Steam, The Ultimate Online Game Platform">
        <meta property="twitter:title" content="Steam, The Ultimate Online Game Platform">
        <meta property="og:type" content="website">
        <meta property="fb:app_id" content="105386699540688">
        <meta property="og:site" content="Steam">
        <meta property="og:description" content="Steam is the ultimate destination for playing, discussing, and creating games.">
        <meta property="twitter:description" content="Steam is the ultimate destination for playing, discussing, and creating games.">


        <link rel="image_src" href="https://cdn.akamai.steamstatic.com/store/about/social-og.jpg">
        <meta property="og:image" content="https://cdn.akamai.steamstatic.com/store/about/social-og.jpg">
        <meta name="twitter:image" content="https://cdn.akamai.steamstatic.com/store/about/social-og.jpg">
    </head>
    <body>

        <div class="responsive_page_content">
            <div id="responsive_store_nav_ctn"></div><div data-cart-banner-spot="1"></div>
            <div class="responsive_page_template_content" data-panel="{&quot;autoFocus&quot;:true}">      
                <div id="about_header_area">
                    <br><br><br><br>
                    <div class="about_area_inner_wrapper">  
                        <div id="about_monitor_video">
                            
                            <video width="100%" height="auto" autoplay="" muted="" loop="" poster="https://cdn.akamai.steamstatic.com/store/about/videos/about_hero_loop_web.png">
                                <source src="https://cdn.akamai.steamstatic.com/store/about/videos/about_hero_loop_web.webm" type="video/webm">
                                <source src="https://cdn.akamai.steamstatic.com/store/about/videos/about_hero_loop_web.mp4" type="video/mp4">
                            </video>
                            <div id="about_monitor_video_gradient"></div>
                        </div>
                        <div id="about_header">
                            <div id="about_greeting">
                                <div class="steam_logo"><img style="border-radius: 15px; " src="images/80JS.jpg" alt="The logo for Steam"></div>
                                <div class="about_subtitle">Most game, most fun, most simple.</div>
                            </div>
                        </div>                        
                    </div>              
                    <div class="learn_more_btn">
                        
                        <a href="#about_games_cta_area" class="smooth_scroll">
                            
                            Read more			<span class="down_arrow"></span>
                        </a>
                    </div>
                </div>
                <br><br><br><br><br>
                <div id="about_games_cta_area">
                    <div class="about_games_cta_bg"></div>
                    <div class="about_area_inner_wrapper">
                        <div id="about_games_cta">
                            <div id="about_games_hero" class="cta_hero">

                                <div class="games_col" id="games_col_left">
                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 34px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=18">
                                            <img src="images/gta5_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 1px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=15">
                                            <img src="images/minecraft-dungeons_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 22px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=12">
                                            <img src="images/adofai_background.png" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 20px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=9">
                                            <img src="images/osu_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="1.5" style="transform: translate3d(0px, 54px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=5">
                                            <img src="images/supersmash_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="1.5" style="transform: translate3d(0px, -15px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=2">
                                            <img src="images/madden_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="3" style="transform: translate3d(0px, 19px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=4">
                                            <img src="images/Zelda_background.png" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="3" style="transform: translate3d(0px, 0px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=7">
                                            <img src="images/genshin_background.jpg" class="visible">
                                        </a>
                                    </div>

                                </div>
                                <div class="games_col" id="games_col_right">
                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 34px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=10">
                                            <img src="images/bloons-tdbattle_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 1px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=13">
                                            <img src="images/rhythm-doctor_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="0.8" style="transform: translate3d(0px, 22px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=16">
                                            <img src="images/lol_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="1.5" style="transform: translate3d(0px, 20px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=19">
                                            <img src="images/red-dead-redemption-2_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="1.5" style="transform: translate3d(0px, 54px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=21">
                                            <img src="images/brawlstars_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="1.5" style="transform: translate3d(0px, -15px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=20">
                                            <img src="images/clash-of-clans_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="3" style="transform: translate3d(0px, 19px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=17">
                                            <img src="images/valorant_background.jpg" class="visible">
                                        </a>
                                    </div>

                                    <div class="game_image" data-rellax-percentage="0.5" data-rellax-speed="3" style="transform: translate3d(0px, 0px, 0px);">
                                        <a href="GameControllerMap?service=getGame&gameID=8">
                                            <img src="images/honkai3_background.jpg" class="visible">
                                        </a>
                                    </div>

                                </div>
                            </div>
                            <br><br><br><br><br>
                            <div class="cta_content">
                                
                                <h2 class="cta_title">80JS</h2>
                                <div class="cta_text">
                                    80JS was established at the end of May 2020, including 5 members. Each person has a clear task in the development of the project, from developing the database, building the model, writing the web, testing backend, creating the front-end and collecting the data. 80JS promises to develop the most perfect product for users, keeping the motto "Most game, most fun, most simple."			</div>
                                <br>
                                <p>CREATORS:</p>
                                <p>Nguyen Dong Duc Viet - HE150938</p>
                                <p>Nguyen Hoang Duong - HE150328</p>
                                <p>Nguyen Van Chuc - HE150618</p>
                                <p>Pham Anh Tuan - HE150543</p>
                                <p>Vu Van Duong - HE150773  </p>
                                <div class="cta_btn">
                                    <a href="index.jsp">Go to Home</a>
                                </div>                              
                            </div>                          
                        </div>                            
                    </div>
                </div>
                <br><br><br><br><br><br>
            </div> 
        </div>
    </body>
</html>
