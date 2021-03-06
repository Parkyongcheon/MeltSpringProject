<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Melt - Melody and Emotions Lead to color Text.</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/index/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="resources/index/style.css">

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="melt" class="nav-brand" style="color:#FFFFFF;">Melt</a>
                        <!-- <img src="resources/index/img/core-img/logo.png" alt=""> -->

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="index">Home</a></li>
                                    <li><a href="albums-store.html">${sessionScope.access_Token}</a></li>
                                    <li><a href="#">Pages</a>
                                        <ul class="dropdown">
                                            <li><a href="index">Home</a></li>
                                            <li><a href="albums-store.html">Albums</a></li>
                                            <li><a href="event.html">Events</a></li>
                                            <li><a href="blog.html">News</a></li>
                                            <li><a href="contact.html">Contact</a></li>
                                            <li><a href="elements.html">Elements</a></li>
                                            <li><a href="login.html">Login</a></li>
                                            <li><a href="#">Dropdown</a>
                                                <ul class="dropdown">
                                                    <li><a href="#">Even Dropdown</a></li>
                                                    <li><a href="#">Even Dropdown</a></li>
                                                    <li><a href="#">Even Dropdown</a></li>
                                                    <li><a href="#">Even Dropdown</a>
                                                        <ul class="dropdown">
                                                            <li><a href="#">Deeply Dropdown</a></li>
                                                            <li><a href="#">Deeply Dropdown</a></li>
                                                            <li><a href="#">Deeply Dropdown</a></li>
                                                            <li><a href="#">Deeply Dropdown</a></li>
                                                            <li><a href="#">Deeply Dropdown</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="#">Even Dropdown</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="event.html">Events</a></li>
                                    <li><a href="blog.html">News</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <c:if test="${sessionScope.idnum == null}">
                                    	<div class="login-register-btn mr-50">
	                                        <a href="login" id="loginBtn">Login / Register</a>
                                    	</div>
                                    </c:if>
                                    <c:if test="${sessionScope.idnum != null && sessionScope.nickname != null}">
                                    	<div class="login-register-btn mr-50">
	                                        <a href="kakaologout" id="loginBtn">Logout</a>
                                    	</div>
	                                </c:if>
	                                <c:if test="${sessionScope.idnum != null && sessionScope.name != null}">
                                    	<div class="login-register-btn mr-50">
	                                        <a href="googlelogout" id="loginBtn">Logout</a>
                                    	</div>
	                                </c:if>

                                    <!-- Cart Button -->
                                    <div class="cart-btn">
                                        <p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/index/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Login</h2>
        </div>
    </section>
	<!-- ##### Breadcumb Area End ##### -->
	
	<!-- ##### Login Area Start ##### -->
	<section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome Back</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                        	<!-- #### kakaotalk login start #### -->
                            <div>
                            	<a href="https://kauth.kakao.com/oauth/authorize?client_id=848400309939678a9e8fdf3e02717490&redirect_uri=http://203.233.199.149:8089/melt/kakao&response_type=code"><img src="resources/kakaobtn.png"></a>
                            </div>
                            <!-- #### kakaotalk login end #### -->
                            <br>
                            <!-- #### google login start #### -->
                            <div id="google_id_login" style="text-align:center">
                            <a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/analytics.readonly&access_type=offline&include_granted_scopes=true&redirect_uri=http://inmelt.myq-see.com:8089/melt/google&response_type=code&client_id=1076621433838-pgcvvagrsnr3n99l1h6chi292d1abe58.apps.googleusercontent.com">
                            <img width="230" src="${pageContext.request.contextPath}/resources/googlebtn.png"/></a></div>                            <!-- #### google login end #### -->	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->
    
	

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/index/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/index/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/index/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/index/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/index/js/active.js"></script>
</body>

</html>