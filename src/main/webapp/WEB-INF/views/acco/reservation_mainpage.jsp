<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>

    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>가보자GO</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <!--파비콘 -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico">
    <link rel="icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/common/ico/android-icon-192x192.png">
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

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
        rel="stylesheet" />

    <!-- 부트스트랩아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!-- 부트스트랩  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- css 연결 -->
    <link rel="stylesheet" href="/resources/acco/css/reset.css">
    <link rel="stylesheet" href="/resources/acco/css/reservation.css" />
    <link rel="stylesheet" href="/resources/common/css/pagination_accom.css">

    <!-- 달력 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
    

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    <!-- 달력  -->
    <script src="/resources/acco/js/datepicker.js"></script>
    <script src="/resources/acco/js/datepicker.ko.js"></script>

    <!-- 자바스크립트 -->
    <script src="/resources/acco/js/reservation_main.js"></script>





</head>

<body>
    <!-- <div class="header"></div> -->

    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <!--   메인이미지 슬라이드 부트스트랩 -->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="3000">
                <img src="/resources/acco/img/main_hotel.jpg" width="100%" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <img src="/resources/acco/img/main_hotel3.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <img src="/resources/acco/img/main_hotel2.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- 여행지,숙소등 선택박스 -->
    <div class="wrap">
        <div class="select_box">
            <div class="search_box">
                <ul>
                    <li>
                        <i class="bi bi-geo-alt"></i>
                        <div>
                            <p class="title">여행지</p>
                            <button type="button" class="travel_btn" id="travel_btn">여행지를 선택하세요
                            </button>
                        </div>
                    </li>
                    <li>
                        <i class="bi bi-calendar-check"></i>
                        <div>
                            <p class="title">체크인</p>
                            
                                <input type="text" id="dateSelector" class="datepicker_input" name="checkInDate" 
                                    placeholder="체크인 날짜를 선택하세요"  />
                            
                        </div>
                    </li>
                    <li>
                        <i class="bi bi-calendar-check"></i>
                        <div>
                            <p class="title">체크아웃</p>
                            <input type="text" id="dateSelector2" class="datepicker_input" name="checkOutDate"
                                placeholder="체크아웃 날짜를 선택하세요" />
                        </div>
                    </li>
                    <li>
                        <!-- <i class="fas fa-user"></i> -->
                        <i class="bi bi-person-plus"></i>
                        <div>
                            <p class="title">인원</p>
                            <button type="button" class="person_btn" id="person_btn">인원을 선택하세요</button>
                            <input type="hidden" name="adult_count">
                            <input type="hidden" name="child_count">
                            
                        </div>
                    </li>
                </ul>
                <button type="button" class="search_btn" id="search_btn">SEARCH</button>
            </div>
        </div>

        <!-- 컨테이너-숙소부분 -->
        <div class="acco">추천숙소</div>

        <div class="large_container" id="accom_list_container">
         <c:forEach items= "${_ACCOM_}" var="list">
                <div class="acco_container">
                    <div class="list">
                        <a href="javascript:void(0);" class="list_main_name" onclick="moveToDetailPage('${list.idx}');">${list.accomName}</a>

                        <p>
                            <br />${list.travellargeDTO.largeAreaName}<br />기준인원 2명 <br />${list.accomroomDTO.minPrice} ~ ${list.accomroomDTO.maxPrice}
                            <br />
                        </p>
                        
                        <a href="javascript:void(0);" class="list_reserve" onclick="moveToDetailPage('${list.idx}');">예약하기</a>
                    </div>
                    <div class="hotel_picture">
                        <a href="javascript:void(0);" onclick="moveToDetailPage('${list.idx}');"><img src="/resources/acco/img/himg/${list.accomimagesDTO.fileName}" alt="" /></a>

                        <div class="heart_icon ${list.wishlistIdx > 0 ? 'act' : ''}" data-idx="${list.idx}"><i class="bi bi-heart-fill"></i></div>
                    </div>
                </div>
            </c:forEach> 

        </div>

        <!-- 페이징 -->
        <div id="pagination">
            <form action="#" id="paginationForm">
                <!-- 1. 3가지 기준정보(criteria)는 hidden 정보로 제공 -->
                <input type="hidden" name="currPage">
        
                <!-- 2. PageDTO 객체의 정보를 이용해서, Pagenation 출력 -->
                <ul>
                    <!-- Prev 처리 -->
                    <li class="frontPage"><a href="/reservation/main?currPage=1"><i class="bi bi-chevron-double-left"></i></a></li>
        
                    <c:choose>
                        <c:when test="${__PAGINATION__.prev}">
                            <li class="prev"><a href="/reservation/main?currPage=${__PAGINATION__.startPage - 1}"><i
                                        class="bi bi-chevron-left"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="prev"><a href="#"><i class="bi bi-chevron-left"></i></a></li>
                        </c:otherwise>
                    </c:choose>
        
                    <!-- 현재 Pagination 범위에 속한 페이지 번호 목록 출력 -->
                    <!-- begin부터 end까지 forEach(반복문) -->
                    <c:forEach var="pageNum" begin="${__PAGINATION__.startPage}" end="${__PAGINATION__.endPage}">
                        <li class="${pageNum == __PAGINATION__.cri.currPage ? 'currPage' : ''}">
                            <a href="/reservation/main?currPage=${pageNum}">
                                <strong>${pageNum}</strong>
                            </a>
                        </li>
                    </c:forEach>
        
                    <!-- Next 처리 -->
                    <c:choose>
                        <c:when test="${__PAGINATION__.next}">
                            <li class="next"><a href="/reservation/main?currPage=${__PAGINATION__.endPage + 1}"><i
                                        class="bi bi-chevron-right"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="next"><a href="#"><i class="bi bi-chevron-right"></i></a></li>
                        </c:otherwise>
                    </c:choose>
        
                    <li class="backPage"><a href="/reservation/main?currPage=${__PAGINATION__.realEndPage}"><i
                                class="bi bi-chevron-double-right"></i></a></li>
                </ul>
            </form>
        </div>


    </div>
    <!--end wrap div -->

    <!-- 위시리스트 모달  -->
    <!-- doubleCheckSucceedModal -->
    <div class="modal" id="wishlist_modal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">위시리스트에 추가되었습니다</p>

            <div class="wish_btn">
                <a href="/mypage/wishlist" class="check_wishlist">위시리스트 확인</a>
                <div class="okBtn">닫기</div>
            </div>
        </div>
    </div>

    <!-- 여행지 선택 모달 -->
    <div class="modal" id="location_modal">
        <div class="modal_Content">
            <h3><i class="bi bi-geo-alt"></i>여행지를 선택하세요</h3>
            <!-- <div class="location_list"> -->
            <ul class="location_list" id="location_list">
                <li>
                    <button type="button" value="1">서울</button>
                </li>
                <li>
                    <button type="button" value="2">인천</button>
                </li>
                <li>
                    <button type="button" value="3">대전</button>
                </li>
                <li>
                    <button type="button" value="4">대구</button>
                </li>
                <li>
                    <button type="button" value="5">광주</button>
                </li>
                <li>
                    <button type="button" value="6">부산</button>
                </li>
                <li>
                    <button type="button" value="7">울산</button>
                </li>
                <li>
                    <button type="button" value="31">경기</button>
                </li>
                <li>
                    <button type="button" value="32">강원</button>
                </li>
                <li>
                    <button type="button" value="33">충북</button>
                </li>
                <li>
                    <button type="button" value="34">충남</button>
                </li>
                <li>
                    <button type="button" value="35">경북</button>
                </li>
                <li>
                    <button type="button" value="36">경남</button>
                </li>
                <li>
                    <button type="button" value="37">전북</button>
                </li>
                <li>
                    <button type="button" value="38">전남</button>
                </li>
                <li>
                    <button type="button" value="39">제주</button>
                </li>

            </ul>
            
            <div class="location_select_wrap">
                <div class="location_cancel">취소</div>
                <div class="location_select">선택완료</div>
            </div>
        </div>
    </div>

    <!-- 인원선택 모달 -->
    <div class="modal" id="personModal">
        <div class="modal_content_people">
            <h3><i class="bi bi-person-plus"></i>인원을 선택하세요</h3>


            <div class="person_btn_wrap">

                <div class="adult_btn">
                    성인

                    <button type="button" class="minus" onclick="decrease('adult_count')">-</button>
                    <span class="setting_number" id="adult_count">2</span>
                    
                    <button type="button" class="plus" onclick="increase('adult_count')">+</button>

                </div>

                <div class="child_btn">
                    유아
                    <button type="button" class="minus" onclick="decrease('child_count')">-</button>
                    
                    <span class="setting_number" id="child_count">0</span>
                    <button type="button" class="plus" onclick="increase('child_count')">+</button>
                </div>
            </div>

            <div class="person_apply_btn">
                <div class="cancel_btn">취소</div>
                <div class="okBtn" id="person_okbtn">적용하기</div>
            </div>

        </div>
    </div>


     <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

	
    <script>
        var dateSelector = document.querySelector('#dateSelector');
        dateSelector.flatpickr({
        	local:"ko",
            monthSelectorType: "dropdown",
            dateFormat: "Y-m-d",
            minDate: "today"
        });

        var dateSelector = document.querySelector('#dateSelector2');
        dateSelector.flatpickr({
        	local:"ko",
            monthSelectorType: "dropdown",
            dateFormat: "Y-m-d",
            minDate: "today",
            maxDate: new Date().fp_incr(730)
        });
    </script>
  	
  	<script>
      function moveToDetailPage(idx) {
        let check_in_date = $('[name=checkInDate]').val();
        let check_out_date = $('[name=checkOutDate]').val();
        let adult_count = $('[name=adult_count]').val();
        let child_count = $('[name=child_count]').val();
        const url = "/reservation/datail?accom_idx="+idx+"&check_in_date="+check_in_date+"&check_out_date="+check_out_date+"&adult_count="+adult_count+"&child_count="+child_count;
        
        location.href = url;
      }
    </script>
  	




</body>

</html>