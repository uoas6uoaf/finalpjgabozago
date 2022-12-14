<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>가보자고:: 아이디/비밀번호 찾기</title>

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
    <link rel="stylesheet" href="/resources/member/css/findpwstyle.css">

    <!-- jQuery Section -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <script>
      
    </script>
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
        
        <div id="body">
            <section id="introSection">
                <img src="/resources/member/img/8726129_map_marker_question_icon.png" alt="" id="questionMarkImg">
                <h3>아이디 혹은 비밀번호를 잊어버리셨나요?</h3>
                <p>회원가입 시 등록한 정보로 계정 정보를 찾을 수 있습니다.</p> 
            </section>

            <section id="mainBox">
                <button type="button" onclick="location.href='/findInfo/id'">아이디 찾기</button>
                <button type="button" onclick="location.href='/findInfo/pw'">비밀번호 찾기</button>
                               
                <% 
                	String userInfo = (String) session.getAttribute("__PW_INFO__"); 
                	if(userInfo == null || userInfo.length() == 0){
                %>
                <div class="mainForm" id="pwfindResultFailed">
                    <p>입력하신 회원 정보와 일치하는 계정이 없습니다.</p>
                    <input type="button" value="돌아가기" onClick="location.href='/findInfo/pw'">
                    <input type="button" value="회원가입" onClick="location.href='/join'">
               	</div>
                <%} else { %>
                <div class="mainForm" id="pwfindResultSucceed">
	                <p><%= userInfo %>로 임시 비밀번호를 발송하였습니다. <br>
	                    임시 비밀번호로 로그인 후 비밀번호를 변경해주시기 바랍니다.</p>
	                <input type="button" value="로그인하러 가기" onClick="location.href='/login'">
                </div>
                <% session.removeAttribute("__PW_INFO__"); } %>
            </section>
        </div>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
    </div>
</body>

</html>