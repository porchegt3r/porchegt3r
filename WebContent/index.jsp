<%@ page contentType="text/html; charset=UTF-8" %> 
<% 	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	String str = "";
	if(id!=null){
		str = "안녕하세요"+id+"  님~~";
	}
	String title = "";
	if(id!=null && grade.equals("A")){
		title = "관리자 페이지";
	}
%> 

<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>아이고~ 어서오세요~ 번거로운 녀석</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
.button
{
	   margin : 0 auto;
}
  
  </style>
</head>
<body>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="<%=root %>/images/eric.jpg" alt="New York">
        <div class="carousel-caption">
          <h3>에릭 존슨</h3>
          <p>톤의 마술사, 세상에서 가장 아름다운 톤을 구사하는 기타리스트.</p>
          <p>외모 또한 아름답다.</p>
        </div>      
      </div>

      <div class="item">
        <img src="<%=root %>/images/steve.jpg" alt="Chicago">
        <div class="carousel-caption">
          <h3>스티브 바이</h3>
          <p>기타한테 말을 시키는 남자.</p>
         <p> 혁신적인 기타 플레이로 자신의 영역을 확고히 구축한 록 기타계 최고의 거장 중 하나.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="<%=root %>/images/paul.jpg" alt="Los Angeles">
        <div class="carousel-caption">
          <h3>폴 길버트</h3>
          <p>미스터빅의 기타리스트이자 현존하는 기타리스트들 중에서</p>
          <p>최고수 라인에 항상 거론 되는 테크니션 기타리스트.</p>
        </div>      
      </div>
      <div class="item">
        <img src="<%=root %>/images/slash.jpg" alt="Los Angeles">
        <div class="carousel-caption">
          <h3>슬래쉬</h3>
          <p>자신만의 블루스 리듬 감각과 Feel을 가진</p>
          <p>건즈앤로지스 기타리스트.</p>
        </div>      
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<div class="container text-center">
  <h3>어서오세요 :)</h3>
  <p><em>음악을 좋아하는,</em></p>
  <p>개발자가 되고 싶은 방구석 기타쟁이 홈페이지 입니다 :)</p>
  <p>기본 매너를 지켜주세요^^. 동의 하신다면 아래 입장 버튼을 누르세욥!</p><br>
  
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>소개 (클릭)</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="<%=root %>/images/me.jpg" class="img-circle person"  width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>86년생. 남자. 임승호.</p>
        <p>유튜브 주소</p>
        <p><a href='https://www.youtube.com/user/mysealonline'>https://www.youtube.com/user/mysealonline</a></p>
      </div>
    </div>
     <div class="col-sm-4">
      <p class="text-center"><strong>사용 장비(클릭)</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="<%=root %>/images/bias.jpg" class="img-circle person" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Guitar: PRS se cu24</p>
        <p>Record: Logic PRO</p>
        <p>Video: Final cut PRO</p>
        <p>Effect: BIAS AMP</p>
      </div>
    </div>
     <div class="col-sm-4">
      <p class="text-center"><strong>그 외(클릭)</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="<%=root %>/images/etc.jpg" class="img-circle person" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>그 외 궁금한 부분은</p>
        <p>방명록 또는 메일 주세욥 :)</p>
        <p>e-mail:porchegt3r@naver.com</p>
      </div>
    </div>
    
    
  </div>
</div>


<div align="center">
<%if(id==null){ %>
<button type="button" class="btn btn-danger" onclick="location.href='member/loginForm.jsp'">입장하기</button>
<%}else{ %>
<button type="button" class="btn btn-danger" onclick="location.href='member/logout.jsp'">로그아웃</button>
<button type="button" class="btn btn-danger" onclick="location.href='bbs/list.jsp'">입장하기</button>
<%} %>
</div>


</body> 
<jsp:include page="/menu/bottom.jsp" />
</html> 