<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	if(id==null)id=(String)session.getAttribute("id");
	MemberDTO dto = dao.read(id);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
function inputCheck(f){
	if(f.email.value==""){
		alert("이메일을 입력 해주세요.");
		f.email.focus();
		return false;
	}
	if(f.job.selectedIndex==0){
		alert("직업을 입력 해주세요.");
		f.job.focus();
		return false;
	}
	
}
function emailCheck2(i){
	alert("이메일 변경을 원하시면 이메일 중복확인 버튼을 클릭하세요.")
	i.blur();
}
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력하세요.");
		document.frm.email.focus();
	}else{
		var url = "email_proc.jsp";
		url += "?email="+email;
		
		wr=window.open(url,"아이디 검색","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2); //스크린은 보여지는 스크린.  가운데로 이동  x,y로 이해하면 편할듯
	}
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' 
	  action='./updateProc.jsp'
	  onsubmit ="return inputCheck(this)">
<input type="hidden" name="id" value="<%=dto.getId() %>">
  <TABLE>
    <TR>
      <TH>사진</TH>
      <TD><input type="file" name="fname" accept=".jpg,.gif,.png"><br>
     	  사진은 JPG, PNG, GIF 파일 형식만 가능합니다. 
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD><input type="text" name="id" size="15">
		<button type="button" onclick="idCheck(document.frm.id.value)">ID중복확인</button>      
      <font size="4" color="red">*필수</font>
      </TD>
    </TR>
    <TR>
      <TH>패스워드</TH>
      <TD><input type="password" name="passwd" size="15">
		<button type="button" onclick="idCheck(document.frm.id.value)">ID중복확인</button>      
      <font size="4" color="red">*필수</font>
      </TD>
    </TR>
    <TR>
      <TH>패스워드 확인</TH>
      <TD><input type="password" name="passwd" size="15">
      <font size="4" color="red">*필수</font>
      </TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="mname" size="15">
      <font size="4" color="red">*필수</font>
      </TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD><input type="text" name="tel" size="15">
      </TD>
    </TR>
    <TR>
      <TH>이메일</TH>
      <TD><input type="text" name="email" size="25">
      <button type="button" onclick="emailCheck(document.frm.email.value)"></button>
      <font size="4" color="red">*필수</font>
      </TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD><input type="text" name="address1" id="sample6_address" size="40"  placeholder="주소">
      <input type="text"  name="address2" id="sample6_address2" size="40"  placeholder="상세주소">
      <font size="4" color="red">*필수</font>
      </TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <td>
      <select name="job">
      <option value="A01">회사원</option>
      <option value="A02" selected>백수</option>
      <option value="A03">학생</option>
      <option value="A04">종교인</option>
      <option value="A05">의료원</option>
      <option value="A06">공무원</option>
      <option value="A07">자영업</option>
      <option value="A08">법조인</option>
      <option value="A09">음악인</option>
      <option value="A10">기타</option>
      </select>
      <script type="text/javascript">
	document.frm.job.value='<%=dto.getJob()%>'      
</script>
	  </td>    
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='회원 수정'>
    <input type='reset' value='다시입력' >
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 