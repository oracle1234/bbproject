<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<style>
.menu {
	position: relative;
	height: 79px;
	background: #2b2f3a;
	width: auto;
	clear: both;
}

.menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	line-height: 1;
}

.menu>ul {
	height: 79px;
	position: relative;
	display: block;
	background: #ffffff;
	width: 100%;
	z-index: 500;
	text-align: center;
}

.menu>ul>li {
	width: 200px; 
	display : inline-block;
	position: relative;
	margin: 0;
	padding: 0;
	display: inline-block;
}

.menu ul li a {
	display: block;
	font-family: Helvetica, sans-serif;
	text-decoration: none;
}

.menu>ul>li>a {
	line-height: 79px;
	font-size: 30px;
	font-weight: bold;
	text-align: center; 
	color : #2b2f3a;
	text-transform: uppercase;
	-webkit-transition: color 0.25s ease-out;
	-moz-transition: color 0.25s ease-out;
	-ms-transition: color 0.25s ease-out;
	-o-transition: color 0.25s ease-out;
	transition: color 0.25s ease-out;
	color: #2b2f3a;
}


.menu ul ul {
	position: absolute;
	left: -9999px;
	top: 70px;
	opacity: 0;
	-webkit-transition: opacity .3s ease, top .25s ease;
	-moz-transition: opacity .3s ease, top .25s ease;
	-ms-transition: opacity .3s ease, top .25s ease;
	-o-transition: opacity .3s ease, top .25s ease;
	transition: opacity .3s ease, top .25s ease;
	z-index: 1000;
}

.menu ul ul li {
	position: relative;
	width: 200px;
}

.menu>ul>li:hover>ul {
	left: auto;
	top: 79px;
	opacity: 1;
}

.menu ul ul li a {
	border-bottom: 1px solid #eeeeee;
	padding: 10px 20px;
	font-size: 12px;
	color: #9ea2a5;
	background: #ffffff;
	-webkit-transition: all .35s ease;
	-moz-transition: all .35s ease;
	-ms-transition: all .35s ease;
	-o-transition: all .35s ease;
	transition: all .35s ease;
}


.menu ul ul li:hover>a {
	background: #f2f2f2;
	color: #8c9195;
}

.menu ul ul li:last-child>a, .menu ul ul li.last>a {
	border-bottom: 0;
}

.logindiv li {
	float: left;
}

.logindiv{
	float: right;
}

</style>

<div class="logindiv">
	<ul>
		<li><a href="#">로그인</a></li>
		<li>&nbsp;|&nbsp;</li>
		<li><a href="#">회원가입</a></li>
	</ul>

</div>
<div class='menu'>
	<ul>
		<li><a href='#'>Home</a></li>
		<li><a href='#'>SHOP</a>

			<ul>
				<li class='sub'><a href='#'>요리1</a></li>
				<li class='sub'><a href='#'>요리2</a></li>
				<li class='sub'><a href='#'>요리3</a></li>
			</ul></li>
		<li><a href='#'>RECIPE</a>
			<ul>
				<li class='sub'><a href='#'>레시피1</a></li>
				<li class='sub'><a href='#'>레시피2</a></li>
			</ul></li>
		<li><a href='#'>BORDER</a>
			<ul>
				<li class='sub'><a href='#'>게시판1</a></li>
				<li class='sub'><a href='#'>게시판2</a></li>
			</ul></li>
		<li class='last'><a href='#'>MYPAGE</a></li>
	</ul>
</div>

