<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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

 <style>
      /* 본문 내 이미지 요소의 'float' 속성을 'left'로 지정 */
      img.left { 
        float: left;
        width: 250px;
        height: 300px;
        
      }
      div.profile{
		width:550px;
		margin: 0 auto;
      }
      
		table{
			width : 300px;
			height: 300px;
			text-align: center;
			border-collapse: collapse;
			font-size: large;
		}
		.ths{
			width : 100px;
		}
		
		.filebox input[type="file"] 
		{ /* 파일 필드 숨기기 */ 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
		}
</style>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	$("#ex_file").on('change', ex_file)
	$("#mdchange").on('click', nick)
})

function nick()
	{
		var nickname = prompt('Please to input nickname');
		var id = $("#hidden").val();

		if(nickname == "" || nickname == null)
		{
			alert("값을 입력해주세요")
			return;
		}
		
		$.ajax
		({
			method : "POST"
			, url  : "changenick"
			, data :
				{
					id : id
					,nickname : nickname
				}
			, success : function(resp)
			{
				if(resp == 1)
					{
						alert("닉네임 변경 성공!");
						$("#labelNick").html(nickname);
						//location.replace("");
					}	
			}
			,error : function(resp)
			{
				alert("중복된 닉네임입니다");
			}
	
		})

	
	};

function ex_file()
{
	$('.filebox').submit();
	
}


</script>

</head>

<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
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
                                    <li><a href="albums-store.html">Albums</a></li>
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
            <!-- <p>See what’s new</p> -->
            <h2>Setting</h2>
        </div>
    </section>
	<!-- #### Breadcumb Area End #### -->
	<!-- #### Profile Area Start #### -->
	<section class="login-area section-padding-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<div class="login-content">
						<section>
							
							<div class="profile">
    						<!-- 이미지를 문서의 좌측 끝에 위치시킴. <p> 태그의 내용은 <img> 태그에서 줄을 바꾸지 않고 바로 이어 나옴 -->
    							
    							<c:if test="${requestScope.profile == null}">
    								<!-- <img src="resources/profile.png" class="left"> -->
    								<img src="resources/profile.png" class="left"/>
    							</c:if>
    							<c:if test="${requestScope.profile != null}">
    								<img src="<spring:url value='/image/${requestScope.profile}'/>" class="left"/>
    							</c:if>
    							
    							<div>
    								<table>
    									<tr>
							    			<th class="ths">아이디</th>
							    			<td>${sessionScope.idnum}</td>
							    		</tr>
							    		<tr>
							    			<th class="ths">이름</th>
							    			<c:if test="${sessionScope.nickname != null}">
							    			<td>${sessionScope.nickname}</td>
							    			</c:if>
							    			<c:if test="${sessionScope.name != null}">
							    			<td>${sessionScope.name}</td>
							    			</c:if>
    									</tr>
    									<tr>
							    			<th class="ths">닉네임</th>
							    			<td><label id="labelNick">${requestScope.nick }</label></td>
							    		</tr>
							    	</table>
    							</div>
    							<br>
    							<form class="filebox" action="<c:url value='inprofile'/>" method="POST" enctype="multipart/form-data">
    								<label for="ex_file" class="btn oneMusic-btn m-2">업로드</label> <input type="file" id="ex_file" name="upload">
                        			
                        		</form>
                        		<a href="#" id="mdchange" class="btn oneMusic-btn m-2">Modify <i class="fa fa-angle-double-right"></i></a>
                        		<br>
                        		${sessionScope.filelink }


                    		
  							</div>
						</section>
						
					</div>
				</div>
			</div>
		</div>
    </section>
    <!-- ##### Login Area End ##### -->

	<input id="hidden" type="hidden" value="${sessionScope.idnum }">


	

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