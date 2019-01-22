<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>소개</title>
<style type="text/css">
#main_img_bar{
	width: :100%;
	height: 300px;
	background-color: rgba(0,0,0,0.25);
}
#main_img{
	width: 1020px;
	height: 300px;
	background-image:url("../img/intro/asdfss.jpg");
	margin: 0 auto;
}
#intro{
	width: 1020px;
	padding-bottom: 150px;
}
.left{
	float: left; 
	padding-top: 150px; 
	padding-bottom: 200px; 
	padding-left: 50px; 
	padding-right: 60px;
	width: 400px;
}
.text{
	float: left; 
	white-space: normal; 
	width: 340px;
	height: 50px;
	margin-top: 10px;
}
.img{
	width: 350px;
	height: 300px;
}
.img2{
	width: 300px;
	height: 271px;
}
.img3{
	width: 240px;
	height: 200px;
	border-radius: 25px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
	border-bottom: 2px solid #A4A4A4;
}
#title{
	background-color: #424242;
	color: white;
	font-size: x-large;
	font-weight: bold;
	margin-left: 20px;
	text-align: center;
	background-color: rgba( 102, 102, 102, 0.7 );
	
}
p{
	white-space: normal;
	width: 220px;
	padding-right: 10px;
	padding-left:  10px;
}
.annae{
	float: left;
	padding-bottom: 10px;
	border-style: solid;
	border-width : 2px;
	border-color: #A4A4A4;
	height: 314px;
	margin-right: 5px;
	border-radius: 25px;

}
</style>
</head>
<body>
<div id="main_img_bar">
	<div id="main_img">
		<div style="padding-top: 50px; padding-bottom: 5px;">
			<h3 id ="title" style="width: 160px;">SEOUL RIDER</h3>
		</div>
		<div style="padding-bottom: 5px;">
			<h3 id ="title" style="width: 350px;">서울시 자전거를 보다 편리하게</h3>
		</div>
		
		<div style="margin-top: 140px;">
			<h4 id ="title" style="width: 900px; font-size:large; font-weight: normal; text-align: left;">※ 서울 라이더는 무인 자전거 대여시스템을 이용하기에 보다 편리하도록 환경을 제공하는 웹 사이트입니다.</h4>
		</div>
	</div>
</div>

<div id ="intro" >
	
	<div style="border-bottom: 3px solid #107307; padding-bottom: 10px; margin-top: 100px;">
		<h3>이용 방법</h3>
	</div>
	
	<div style="height: 800px; padding-bottom: 25px; margin-bottom:150px;">
	
		<div style="height: 400px; padding-top: 30px; padding-bottom: 10px;">
			<div style="float: left; margin-left: 7%;"><img class="img" src="../img/intro/realtime1.PNG"></div>
				<div style="float: right: 10px; margin-left: 100px;"><img class="img" style="margin-left: 20%;" src="../img/intro/detail1.PNG"></div>
					<div class="text" style="margin-left: 7%;">1. 원하는 대여소의 대여 현황을 바로바로 <br>&nbsp;&nbsp;&nbsp;체크할 수 있습니다.</div>
						<div class="text" style="float: right: 50px; margin-left: 20%;">2. 각각의 대여소의 상세정보와 평가를 남길 수<br>&nbsp;&nbsp;&nbsp;있습니다.</div>
		</div>
		
		<div>
			<div style="float: left; margin-left: 5%;"><img class="img"  style="width: 400px;" src="../img/intro/board11.PNG"></div>
				<div style="float: right: 50px; margin-left: 100px;"><img class="img" style="margin-left: 19%; width: 300px;" src="../img/intro/bookmark1.PNG"></div>
					<div class="text" style="margin-left: 5%; width: 390px;">3. 커뮤니티 기능으로 정보를 주고 받으면서 소통이 <br>&nbsp;&nbsp;&nbsp;가능합니다.</div>
						<div class="text" style="float: right: 50px; margin-left: 17%;">4. 만약 자주 이용하는 대여소가 있다면, 즐겨<br>&nbsp;&nbsp;&nbsp;찾기 기능으로 바로바로 확인 가능합니다.</div>
		</div>
		
	</div>

	<div style="padding-bottom: 10px; margin-bottom:50px; border-bottom: 3px solid #107307;"><h3>대여소 안내</h3></div>
	<div style="height: 400px; padding-left: 5px;">
		<div class="annae"><img class="img3" src="../img/intro/anna.jpg"><br><p>대여소는 지하철 출입구,버스정류장, 주택단지, 관공서,학교, 은행 등 생활내 통행장소를 중심으로 설치되어 운영중에 있습니다.</p></div>
		<div class="annae"><img class="img3" src="../img/intro/a.jpg"><br><p>서울자전거의 대여와 반납이 무인으로 이루어지는 정류장 형태의 공간을 대여소라고 합니다.</p></div>
		<div class="annae"><img class="img3" src="../img/intro/b.jpg"><br><p>대여소는 주변 생활시설에 접근 및 시민들의 이용이 편리한 장소를 중심으로 설치되어 운영 중에 있습니다.</p></div>
		<div  class="annae" style="float: right:10px;"><img class="img3" src="../img/intro/c.jpg"><br><p>서울자전거 이용자는 장소에 구애받지 않고 대여소가 설치된 곳이면 어디에서나 자전거를 대여하고 반납할 수 있습니다.</p></div>
	</div>
	
	<div style="border-bottom: 3px solid #107307; padding-bottom: 10px; margin-top: 130px;">
		<h3>구성요소</h3>
	</div>
		
	<div style="padding-left: 20%; padding-top: 50px;">
		<div style="float: left;"><img class="img2" src="../img/intro/bike.png"></div>
		<div><img class="img2" src="../img/intro/geochidea.png"></div>
	</div>
	
	<div>
		<div style="float: left; padding-left: 32%;">자전거</div><div style="padding-left: 62%;">거치대</div>
	</div>
	
	<div style="margin-top: 180px; padding-bottom: 10px; margin-bottom:50px; border-bottom: 3px solid #107307;">
		<h3>대여방법</h3>
	</div>
	<div><span style="font-weight: bolder;">1. 이용권 구매</span></div>
	<div style="padding-bottom: 50px; padding-left: 30px;"><img src="../img/intro/iyonggwon.png"></div>
	
	<div style="width: 300px; float: left;">
		<span style="font-weight: bolder;">2. 자전거 선택 후 대여번호 입력</span>
	</div>
	
	<div style="width: 300px; float: right: 10px; margin-left: 560px;">
		<span style="font-weight: bolder;">3. 대여 - 단말기 잠금장치 분리</span>
	</div>
	
	<div style="width: 520px; height: 130px; float: left; padding-top: 25px;"><img style="width: 520px; height: 130px;" src="../img/intro/deayeonumber.jpg"></div>
	
	<div style="width: 500px; height: 130px; float: right; padding-top: 25px;"><img  style="width: 500px; height: 130px;" src="../img/intro/lock.jpg"></div>
	
	<div style="padding-top: 100px; margin-top: 250px; height: 30px;">
		<h3>반납방법</h3>
	</div>
	<div><img style="width: 1020px;" src="../img/intro/deayeosolution.png"></div>
	
	<div style="padding-top: 20px;">
		<h4>&nbsp;&nbsp;※거치대가 부족할 경우</h4>
	</div>
	<div style="margin-top: 7px; width: 400px; height:200px; padding-right: 50px; float: left;"><img style="width: 400px; height: 180px; border-radius: 30px;border-style: solid; border-width : 2px; border-color: #A4A4A4;" src="../img/intro/chain.png"></div>
	<div style="margin-top: 160px;">▶ 체인을 연결하여 반납 할 수 있습니다</div>
</div>
</body>
</html>