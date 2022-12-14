<!DOCTYPE html>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>가보자고:: 로그인</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192"  href="/resources/common/ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/common/ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/common/ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/common/ico/favicon-16x16.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/common/ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/common/ico/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/common/ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/common/ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/common/ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/common/ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/common/ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/common/ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/common/ico/apple-icon-180x180.png">
    <link rel="manifest" href="/resources/common/ico/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/resources/common/ico/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/c12d3c98b6.js" crossorigin="anonymous"></script>

    <!-- css styleSheet -->
    <link rel="stylesheet" href="/resources/member/css/loginstyle.css">
    
    <!-- jQuery Section -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    
 
    <script type="text/javascript">
    var googleUser = {};
    
    var startApp = function() {
      gapi.load('auth2', function(){
        auth2 = gapi.auth2.init({
          client_id: '1060014750380-ebmvnebj7u5oipfrl1in6lc14klblgmc.apps.googleusercontent.com',
          cookiepolicy: 'single_host_origin',
          plugin_name: "chat"
        });
        attachSignin(document.getElementById('customBtn'));
      });
    };// startApp 
      
      function attachSignin(element) {
          auth2.attachClickHandler(element, {},
              function(googleUser) {
        	  	  var profile = googleUser.getBasicProfile();
        	  	  var id_token = googleUser.getAuthResponse().id_token;
        	      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
        	      console.log('Name: ' + profile.getName());
        	      console.log('Image URL: ' + profile.getImageUrl());
        	      console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.		    	  
        	      $.ajax({
        			  url: 'http://localhost:8080/login/google/auth',
        			  type: 'POST',
        			  data: 'idtoken=' + id_token, 
        			  dataType: 'JSON',
        			  success: function(json) {
        				  if(json.login_result == "loginSucceed"){
        					  alert("구글 로그인이 성공하였습니다.");
	        				  location.href = "http://localhost:8080/main";        					  
        				  } else if(json.login_result == "alreadyJoined"){
        					  alert("이미 가보자고에 가입된 회원입니다. 아이디/비밀번호 찾기를 통해 회원 정보를 확인하세요.");
	        				  location.href = "http://localhost:8080/login";        					  
        				  } else if(json.login_result == "joinNeeded"){
	        				  location.href = "http://localhost:8080/join/googleJoin";        					  
        				  }
        	          }//success  
                  });
            }, 
		    function(error) {
		        alert(JSON.stringify(error, undefined, 2));
		    }
          );
    }// attachSignin

    $(function(){
    	startApp();
    	  
        var resultMsg = '${__RESULT__}'
        
        if(resultMsg != null && resultMsg.length > 0){
          alert(resultMsg);
        }// if
    });
      
      // 아이디 저장 쿠키
    $(document).ready(function(){
        // 저장된 쿠키값을 가져와서 ID 입력창에 넣고 없으면 공백
        var userid = getCookie("userid");

        $("#userid").val(userid); 
        
        if($("#userid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태인 경우
            $("#saveId").attr("checked", true); // 아이디 저장 체크박스 체크 상태로 유지
        }// if
      
        $("#saveId").change(function(){ // 체크박스에 변화가 있는 경우
          if($("#saveId").is(":checked")){ // 1) 아이디 저장 체크했을 때
              var userid = $("#userid").val();
              setCookie("userid", userid, 7); // 쿠키 보관(7일)
          }else{ // 2) ID 저장하기 체크 해제했을 때
              deleteCookie("userid");
          }// if-else
        });// onchange
     
        // 아이디 저장을 체크한 상태에서 아이디 입력하면 쿠키 저장
        $("#userid").keyup(function(){ // 입력창에 ID 입력하는 경우
            if($("#saveId").is(":checked")){ // 아이디 저장하기 체크했다면
                var userid = $("#userid").val();
                setCookie("userid", userid, 7); // 쿠키 보관(7일)
            }// if
        });// onkeyup
    });
 
      function setCookie(cookieName, value, exdays){
          var exdate = new Date();
          exdate.setDate(exdate.getDate() + exdays);
          var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
          document.cookie = cookieName + "=" + cookieValue;
      }// setCookie
      
      function deleteCookie(cookieName){
          var expireDate = new Date();
          expireDate.setDate(expireDate.getDate() - 1);
          document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
      }// deleteCookie
      
      function getCookie(cookieName) {
          cookieName = cookieName + '=';
          var cookieData = document.cookie;
          var start = cookieData.indexOf(cookieName);
          var cookieValue = '';
          if(start != -1){
              start += cookieName.length;
              var end = cookieData.indexOf(';', start);
              
              if(end == -1) end = cookieData.length;
              cookieValue = cookieData.substring(start, end);
          }// if
          return unescape(cookieValue);
      }// getCookie
    </script>
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header_admin.jsp" flush="true"/>

        <div id="imgSection">
            <div id="imgSection_img">
                <img src="/resources/member/img/samplesize4.jpg" alt="loginImg" id="loginImg">
                <div class="gradient"></div>
            </div>

            <div id="imgSection_text">
                <p class="center">ENJOY YOUR JOURNEY WITH</p>
                <p class="center">GABOZAGO</p>
            </div>
        </div>

        <div id="body">
        
            <section id="loginBox">
                <div class="midHr">&nbsp;로그인&nbsp;</div>
                <div id="idpwError" class="center">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                
                <form action="/admin/loginProcess" method="POST">
                  <label for="userid">아이디(이메일)</label><br>
                  <input type="text" name="email" id="userid" placeholder="sample@email.com"><br>
                  
                  <label for="userpw">비밀번호</label><br>
                  <input type="password" name="password" id="userpw" placeholder="●●●●●●●●"><br>
                  
                  <div id="checkboxes">
                      <input type="checkbox" name="saveId" id="saveId">
                      <label for="saveId">아이디 저장</label>
                      <input type="checkbox" name="rememberMe" id="autoLogin">
                      <label for="saveId">자동 로그인</label>
                  </div>
                  
                  <div id="findInfoLink">
                      <i class="fa-solid fa-magnifying-glass"></i><a href="/findInfo/id">아이디/비밀번호 찾기</a>
                  </div>
                  
                  <input type="submit" value="로그인" id="loginBtn"></input>
                </form>
            
  
                <div class="center">
                    <hr>
                    <p>계정이 없으신가요?</p>
                    <a href="/join" id="joinText">회원가입</a>
                </div>
            </section>

        </div>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
    </div>

</body>

</html>