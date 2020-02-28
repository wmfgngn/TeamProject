<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Bootstrap core CSS -->
    <title></title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/jquery-ui.min.css" rel="stylesheet">
<style>

	
	#box{
		float: right;
		margin: 0;
			}
</style>
  </head>
</head>

<body class="bg-light">

<article>
	<jsp:include page="header.jsp"/>
	<jsp:include page="menu.jsp"/>
<form action="control?type=regist" name="frm" method="post">	
<div class="container">
  <div class="py-5 text-center">
  	<br/>
    <h2>회원가입</h2>
    <p class="lead">아래 회원 정보를 모두 입력해주세요.</p>
  </div>
</div>

<!-- 폼양식 -->
<div class="row">

    <div class="col-md-4 order-md-2 mb-4">
     
    <div class="col-md-8 order-md-1">
      <form class="needs-validation" novalidate>
        <div class="row">
          <div class="mb-3">
            <label for="firstName">아이디</label>&nbsp;<span id="box"></span>
            <input type="text" class="form-control" id="s_id" name="s_id" placeholder="" value="" required>
            <div class="invalid-feedback" style="width: 100%;">
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="username">비밀번호</label>
          <div class="input-group">
            <div class="input-group-prepend">
            </div>
            <input type="password" class="form-control" id="s_pw" name="s_pw" placeholder="영문/숫자 포함 4글자 이상" required>
            <div class="invalid-feedback" style="width: 100%;">
            </div>
          </div>
        </div>

        <div class="mb-3">
          <label for="email">비밀번호 재확인</label>
          <input type="password" class="form-control" id="s_pw_ok" name="s_pw_ok" placeholder="위 비밀번호와 동일하게 입력">
          <div class="invalid-feedback">
          </div>
        </div>

        <div class="mb-3">
          <label for="address">이름</label>
          <input type="text" class="form-control" id="s_name" name="s_name" required>
        </div>
		</div>
        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">전화번호</label>
            <select class="custom-select d-block w-100" id="s_phone" name="s_phone" required>
              <option value="">010</option>
              <option value="">011</option>
              <option value="">017</option>
              <option value="">016</option>
              <option value="">019</option>
            </select>
            -
            <input type="text" class="form-control" id="s_phone2" name="s_phone" required>
            -
            <input type="text" class="form-control" id="s_phone3" name="s_phone" required>
          </div>

        <h4 class="mb-3">성별</h4>

        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="s_wgender" name="s_gender" type="radio" class="custom-control-input" checked required>
            <label class="custom-control-label" for="credit">여자</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="s_mgender" name="s_gender" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="debit">남자</label>
          </div>
        </div>
		</div>
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" id="regist_btn" >회원가입</button>
    </div>
  </div>
  </form>
 </article>
<footer class="container">
  <p>&copy; Company 2019-2020</p>
</footer>

<script src="../js/jquery-3.4.1.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>

$(function(){
	
	$("#s_id").on("keyup",function(){
		var id = $(this).val();
		//console.log(id); 확인 완료
		if(id.trim().length > 4){
				$.ajax({
					url:"control",
					type:"post",
					data:"type=check&id="+encodeURIComponent(id)
			}).done(function(data){
				console.log("성공");
				$("#box").html(data);
			}).fail(function(err) {
				console.log(err);
			});
		}else{
			console.log("실패");
			$("#box").html("");
		}		
				
	});
	
	$("#regist_btn").bind("click",function(){
		var id = $("#s_id").val().trim();
		var pw = $("#s_pw").val().trim();
		var pw_ok = $("#s_pw_ok").val().trim();
		var name = $("#s_name").val().trim();
		
		//유효성 검사 
		
		if(id.length <1){
			alert("아이디 입력하세요 ^^");
			$("#s_id").focus();
			return;
		}
		if(pw.length != pw_ok.length){
			alert("비밀번호를 확인하세요^^");
			$("#s_pw").focus();
			return;
		}
		if(name.length <1){
			alert("이름을 입력하세요!");
			$("#s_name").focus();
			return;
		}
		if($("#s_phone2").val().trim().length < 3) {
			alert("전화번호를 확인하세요!");
			$("#s_phone2").focus();
			return;
		}
		if($("#s_phone3").val().trim().length < 4) {
			alert("전화번호를 확인하세요!");
			$("#s_phone3").focus();
			return;
		}
		// 아이디가 이미 있으면 서브밋 안하고 경고창  없을때 서브밋
	
			if($("#box").html("사용가능")){
				
				alert("가입완료");
				frm.submit();	
			}else
			alert("재입력하세요");
		
	});
	
	
	
	
});

</script>

</body>
</html>