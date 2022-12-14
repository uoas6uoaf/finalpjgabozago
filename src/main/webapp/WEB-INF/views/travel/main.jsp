<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>

    <!-- <script src="/Final/js/jquery.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- map -->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ac49eb45c2f47546120a0ea0a28dbe"></script> -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ac49eb45c2f47546120a0ea0a28dbe&libraries=services"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script> -->

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/77c780416b.js" crossorigin="anonymous"></script>
   
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <!-- Calender -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
    
    <!-- Customized Stylesheet -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/travel/css/main.css?ver=1.1">

    <!-- JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!--fabozago favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico">
    <link rel="icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/commonico/android-icon-192x192.png">
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
    
    
    <style>
        .selected { background-color : #6DCC76}
        .q {
            display: flexbox;
            color: green;
            box-sizing: border-box;
            width: 33.1px;
            height: 29.13px;

            background: #4E944F;
            box-shadow: 0px 0.661972px 0.661972px rgba(0, 14, 51, 0.05);
            border-radius: 33px;

            margin-left: -20px;
        }
        .r {
            position: absolute;
            z-index: 3;
            left: 25px;
            top: 38px;

        }
    </style>

    <script>
        //????????? ?????? ????????? 
        console.clear();

        $(function() {
            $('.btn_small_area').click(function() {
                $("#setupPop").show();
            }) 
            $('.btn_small_area_cs').click(function() {
                $("#setupPop").hide();
            })
        });

        //??? ?????? ?????? ?????????
        $(function() {
            $('#btn_reservation').click(function() {
                $("#setupPop2").show();
            }) 
            $('#btn_reservation_cs').click(function() {
                $("#setupPop2").hide();
            })
        });

        //?????? ?????? ?????? alert 
        $(function() {
            $('#btn_plan_create').click(function() {
                $("#myModal").show();
            }) 
        });

        //big_area ??????
        $(function() {
            $(".card-link").click (function(){
                var big_area_id = $(this).html();
                bigAreaCode = $(this).attr('value');
                bigAreaName = $(this).text();
                $(".btn_small_area").text(big_area_id);
            }) 
        });

         //small_area ?????? ?????? ?????? ?????? , ????????? ?????? ?????? ???????????? ?????? ??????, keyword parameter
         //????????? ???????????? ?????? ?????? 
         //Open api????????? ?????? ????????? ???????????? maplist??? ???????????? -> ?????? ?????? ????????????  
         $(function() {
            $('.small_area').click(function() {
                smallAreaName = $(this).attr('value');
                $('.small_area').removeClass("selected");
                $(this).addClass("selected");
                //  $(this).siblings().removeClass("selected");
                setPlaceList();
                getPlaceList();
                // setCenter();
            })
        });


        //????????? ?????? ????????? ?????? ????????? 
        $(function() {
            $('.btn_small_area_set').click(function() {
                $(".wrap_layerpop").hide();
            }) 
        });

        // //?????? ?????? ?????? 
        // $(function() {  
        //     for(let i=0; i<2; i++) {
        //         let element = $(".carousel-item").html();
        //         $(".carousel-item").append(element);
        //     }
        // });


        // $(function() {
        //     $(".row_num").addClass("selected2");
        // })

        //?????? ?????? parameter ?????? 
        $(function() { 

            $('.modal_button').click(function(){   //modal_btn_yes ????????? ??????????????? ???
    
                let isPublic = $(this).attr('value');
    
               
                // let data = []
                // let dataMain = {
                //     'memberIdx' : 44,
                //     'startDate' : startDate,
                //     'endDate' : endDate,
                //     'isPublic' : isPublic,
                //     'largeAreaIdx' : areaCode
                // };
                // data.push(dataMain)

                // for(let i=1; i<=day; i++) {
                //     let row = "#Day" + i + " .row";
                //     let rowImg = "#Day" + i + " .row img";
                //     let rowInfo = "#Day" + i + " .row .col-2";
                //     let rowCnt = $(row).length;

                //     for(let j=1; j<=rowCnt; j++) {

                //         let dataDetail = {
                //         "day" : i,
                //         "placeType" : "T",
                //         "reservationIdx" : 32423,
                //         "placeName" : $(rowInfo).text(),
                //         "placeSeq" : j,
                //         "latitude" : $(rowInfo).attr("latitude"),
                //         "longitude" : $(rowInfo).attr("longitude"),
                //         "img" : $(rowImg).attr("src")
                //         };

                //         data.push(dataDetail)

                //     }//for


                // let data = []
                let plandetail = []
               

                for(let i=1; i<=day; i++) {
                    let row = "#Day" + i + " .row";
                    let rowImg = "#Day" + i + " .row img";
                    let rowInfo = "#Day" + i + " .row .col-6";
                    let rowCnt = $(row).length;

                    $(rowInfo).each(function(index,item){
                        let dataDetail = {
                        "day" : i,
                        "placeType" : "T",
                        "reservationIdx" : 32423,
                        "placeName" : $.trim($(this).first().text()),
                        "placeSeq" : index+1,
                        "latitude" : $(this).attr("latitude"),
                        "longitude" : $(this).attr("longitude"),
                        "img" : $(this).prev().find("img").attr("src")
                        };

                        plandetail.push(dataDetail)
                   
                    });
                };

                let data = {
                    'memberIdx' : 44,
                    'startDate' : startDate,
                    'endDate' : endDate,
                    'isPublic' : isPublic,
                    'largeAreaIdx' : areaCode,
                    'days' : day,
                    'detailDto' : plandetail
                };

                
                console.log("data:{}",data)
                $.ajax({
                    type :'post',   //post ??????
                    url :'register',//controller name 
                    async : false,
                    // traditional : true,  //json string
                    data : JSON.stringify (data),  //?????? ????????? ?????? ???????????? ???????????????.
                    // data :  data,  //?????? ????????? ?????? ???????????? ???????????????.
                    // dataType : "json", 
                    contentType: "application/json;charset=UTF-8",
                    success : function(data){   
                    	 alert("?????? ????????? ?????????????????????");
                         
                         self.location = "/travel/plan?planIdx=535" 

                    },
                    error : function(request,error) {
                    	 alert("????????? ?????? ?????? ?????? ??????????????????.");
                         $("#myModal").hide();
                    }
                }); //ajax 
            });//c e

        });

       
        


    </script>


    <script>
        //============kakao ?????? Api ================

        var markerPositions = new Array();      //????????? ????????? ???????????? ?????? 
        var markers = [];                       //????????? ????????? ?????? ?????? 
       
        $(function (){   
            $(".btn_small_area_set").click(function () {
                // if(markers.length!=0) {
                //     console.log("setMarkers");
                //     setMarkers();
                //     map.clear();                }
                
                addMarker();
            });    
        });//????????? ?????? ???????????? ??????????????? ?????? 


        //invoke 3 
        function setMarkers() {
            for (var i = 0; i < markers.length; i++) {
                
                markers[i].setMap(null);
                markers.pop();
            }            
        }

        //invoke 2 
        function addMarker() {
            if(markers.length!=0) {
            for (var i = 0; i < markers.length; i++) {
                
                markers[i].setMap(null);
                
            }     
        }   
            var bounds = new kakao.maps.LatLngBounds();   // ????????? ???????????? ??????????????? ????????? ?????? LatLngBounds ??????

                for(let i=0; i<markerPositions.length; i++) {
                    var markerPositionP = new kakao.maps.LatLng( markerPositions[i].latlng.La,markerPositions[i].latlng.Ma);

                    //????????? ????????? ?????? 
                    var marker = new kakao.maps.Marker({
                        position: markerPositionP,  // ?????? ??????
                    });

                     // ??????????????? ??????
                    var infowindow = new kakao.maps.InfoWindow({
                        position : markerPositionP, //??????????????? ?????? 
                        content : markerPositions[i].content    //??????????????? info 
                        
                    });
                   
                    marker.setMap(map);      // ????????? ?????? ?????? ??????????????? ??????
                    markers.push(marker);    // ?????? ??????????????? ?????? 
                    
                    infowindow.open(map, marker); 
                    bounds.extend(markerPositionP);  // LatLngBounds ????????? ?????? ??????
                }//for : ?????? ?????? , LatLngBounds??? ???????????? ?????? 

                map.setBounds(bounds);  //?????? ?????? ?????????

        }//addMarker

        //=========????????????????????? Open Api=============
        //invoke 1 
        var firstimage = "";
        var title = "";
        var mapx = "";
        var mapy = "";
        
        function getPlaceList(){   
            var xhrStatus = 0;
            var promise = $.ajax({
            type: "GET",
            url: "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=2sYfoLbELJvXLAzwuf4vVGLhXboUAsGTSan2fB1b5Y7XFsKxOQexxhq6vYS%2Bita8byIhVYLj0w%2BPlIqINrMsIw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=B&areaCode=" + areaCode + "&keyword=" + keyword , 
            async: "false",
                success: function (response, Status, xhr) {
                    let idCnt = 0;
                   
                    $(response).find("item").each((i,row) => {
                        if($(row).find("firstimage").text() == "") {
                            console.log("????????? ???????????? ?????? ??????")
                            return true;     
                        } 
                        idCnt += 1;
                        firstimage = $(row).find("firstimage").text()
                        title = $(row).find("title").text();
                        mapx = $(row).find("mapx").text()                 //?????? ????????? ?????? 
                        mapy = $(row).find("mapy").text()                 //?????? ????????? ?????? 
                       
                        let targetTitle = "place" + idCnt;
                        // console.log("targetTitle",targetTitle)
                        // let ApiData = document.getElementById(targetTitle);

                        document.getElementById(targetTitle).querySelector("img").src = firstimage
                        $("#" + targetTitle).contents()[2].textContent = title
                        $("#" + targetTitle).attr("locationX",mapy)
                        $("#" + targetTitle).attr("locationY",mapx)
                        console.log("??????")

                        // ????????? ????????? ????????? ????????? ????????? ?????? ?????? ?????? ?????? 
                        let item = {content:'<div style=padding:5px; margin:5px;align-items : center; font-size: 2px;>' + title + '</div>', 
                                    latlng: new kakao.maps.LatLng(mapx, mapy)};
                        markerPositions.push(item);
                        
                        xhr.abort();
                        console.log("?????? ??????");
                    });
                    xhr.abort();
                }//success 
            });//ajax
        }//getPlaceList
        
        function setPlaceList() {
                    areaCode = bigAreaCode      //areaCode parameter ?????? 
                    keyword = smallAreaName.substr(0,smallAreaName.length-1)
                    console.log("setPlaceList invoked")
                    console.log("keyword" , keyword)
                    console.log("smallAreaName" , smallAreaName)
                    console.log("bigAreaName" , bigAreaName)
        } //setPlaceList

       
    </script>

</head>
<body>

    <!-- *** header *** -->
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
    </header>
    
    <!-- *** navigation *** -->
    <nav>


        <!-- left button line 1-->
        <div>
            <!-- ????????? ??????  -->
            <button onclick="" class="btn_small_area"><p id="result">?????????</p></button>
            <!-- ????????? ?????? -->

            <div id="setupPop" class="wrap_layerpop">
                <div class="layerpop" >
                    <h3>????????? ?????????</h3> 
                    <div id="accordion">
                        <div class="card">
                            
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse1" value="1">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse2" value="6">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse3" value="4">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse4" value="2">??????</a>
                            </div>
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse5" value="">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse6" value="3">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse7" value="7">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse8" value="31">??????</a>
                            </div>
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse9" value="32">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse10" value="33">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse11" value="34">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse12" value="35">??????</a>
                            </div>
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse13" value="38">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse14" value="35">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse15" value="36">??????</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse16" value="39">??????</a>
                            </div>

                            <!-- ?????? -->
                            <div id="collapse1" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="????????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="????????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse2" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="????????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse3" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse4" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="????????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse5" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse6" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse7" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                    <input type="button" class="small_area" value="??????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse8" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="????????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse9" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse10" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse11" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse12" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse13" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse14" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse15" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>
                            <!-- ?????? -->
                            <div id="collapse16" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>???????????? ?????? </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="????????????"><br>
                                    <input type="button" class="small_area" value="?????????"><br>
                                </div>
                            </div>

                        </div>  
                    </div>

                    <div class="btn_small_area_set">??????</div>
                </div>
            </div>
                     
            

            <!-- ?????? ?????? ?????? -->
            <div class="dimmed"></div></div>
            <div class="btn_date">
            <input class="dateSelector" placeholder="?????? ??????"
                type="text" id="travelDate">
            </div>
        </div>


        <!-- left button line 2-->
        <div>
            <div class="left_button_line2"></div>
            <!-- ??? ?????? ??????  -->
            <button onclick="" class="button" id="btn_reservation">?????? ?????? ??????</button>
            <!-- ?????? ?????? ?????? -->
            <button onclick="" class="button" id="btn_plan">?????? ????????????</button>
           

        </div>
            
            <!-- ??? ?????? ??????  -->
            <div id="setupPop2" class="wrap_layerpop2">
                <div class="layerpop2" >
                    <h3>?????? ?????? ??????</h3>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                        
                        
                        <!-- The slideshow -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                               <div class="card_reservation" id="rs_item">
                                <img src="https://lh3.googleusercontent.com/proxy/mo2S7suoEWndBIxeZrtlej_zi2EPfrp7J3RJ-dxjzKWfhns9UpRaQMQCMjML5IhofG3feaXJjBdcVipY60cjFKsCrbMcSU7edA67o2sFe7uExQ76jAq3mLpGu3pYwROcDXyAV5gCQ_JAmI3AEcScLRmshwkOMdM=w960-h720-n-k-rw-no-v1" alt="???????????????">
                                <p>
                                    <span>????????? ????????? ??????</span> 
                                    <span>2020-01-11 ~ 2020-01-15</span>
                                </p>
                            </div>   
                            <div class="card_reservation" id="rs_item">
                                <img src="https://pix8.agoda.net/hotelImages/1810284/-1/5963e6d453ffcd17d4593e3d75c7f986.jpg?ca=28&ce=0&s=1024x768" alt="???????????????">
                                <p>
                                    <span>???????????? ???????????? ?????? ??????</span> 
                                    <span>2020-02-11 ~ 2020-02-14</span>
                                </p>
                            </div>   
                            <div class="card_reservation" id="rs_item">
                                <img src="https://images.trvl-media.com/hotels/1000000/980000/975000/974958/e572aebd.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="???????????????">
                                <p>
                                    <span>?????? ????????? ??????</span> 
                                    <span>2020-02-15 ~ 2020-02-16</span>
                                </p>
                            </div>   
                            </div>
                            <div class="carousel-item">
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/9000000/8750000/8749800/8749747/221d5eb9.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="???????????????">
                                    <p>
                                        <span>?????? ?????? ?????????</span> 
                                        <span>2020-01-11 ~ 2020-01-15</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/13000000/12620000/12615800/12615733/4f522439.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="???????????????">
                                    <p>
                                        <span>???????????? ?????? ??????</span> 
                                        <span>2020-02-11 ~ 2020-02-14</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/13000000/12520000/12511700/12511672/54514914.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="???????????????">
                                    <p>
                                        <span>L7 ?????? ?????? ??????</span> 
                                        <span>2020-02-15 ~ 2020-02-16</span>
                                    </p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://lh3.googleusercontent.com/proxy/mo2S7suoEWndBIxeZrtlej_zi2EPfrp7J3RJ-dxjzKWfhns9UpRaQMQCMjML5IhofG3feaXJjBdcVipY60cjFKsCrbMcSU7edA67o2sFe7uExQ76jAq3mLpGu3pYwROcDXyAV5gCQ_JAmI3AEcScLRmshwkOMdM=w960-h720-n-k-rw-no-v1" alt="???????????????">
                                    <p>
                                        <span>????????? ????????? ??????</span> 
                                        <span>2020-01-11 ~ 2020-01-15</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/45000000/44220000/44216700/44216632/13fe0158.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="???????????????">
                                    <p>
                                        <span>???????????? ?????? ?????????</span> 
                                        <span>2020-02-11 ~ 2020-02-14</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/22000000/21520000/21518500/21518483/2b6295d7.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="???????????????">
                                    <p>
                                        <span>ENA ????????? ?????? ?????????</span> 
                                        <span>2020-02-15 ~ 2020-02-16</span>
                                    </p>
                                </div>
                            </div>
                          </div>
                        
                        </div>
                        
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a>

                        <button type="button" id="btn_reservation_cs" onclick="CategoryChange(this,10)">??????</button>
                    </div>
                      
                </div>
            <div class="dimmed"></div></div>
        </div>


        <!-- DAY ??????  -->
        <div class="wrap_day">
            <div class="day_box">

                <!-- DAY1
                <div class="day_text" id="dayTitle">DAY 1</p>

                   <ol class="row_index">
                        <div class="row" id="row1_1">
                            <div class="col-1"><li class="row_num"></li></div>
                            <div class="col-4"><img src="https://picsum.photos/id/400/600/400" alt=""></div>
                            <div class="col-2">Guttannen1</div>
                            <div class="col-2"><button onlick="" class="row_btn" id="row_btn_1_1">-</button></div>
                        </div>

                        <div class="row" id="row1_2">
                            <div class="col-1"><li class="row_num"></li></div>
                            <div class="col-4"><img src="https://picsum.photos/id/400/600/400" alt=""></div>
                            <div class="col-2">Guttannen1</div>
                            <div class="col-2"><button onlick="" class="row_btn" id="row_btn_1_2">-</button></div>
                        </div>

                        <div class="row" id="row1_3">
                            <div class="col-1"><li class="row_num"></li></div>
                            <div class="col-4"><img src="https://picsum.photos/id/400/600/400" alt=""></div>
                            <div class="col-2">Guttannen1</div>
                            <div class="col-2"><button onlick="" class="row_btn" id="row_btn_1_3">-</button></div>
                        </div>
                    </ol>
                </div> -->

               
            

            </div>
        </div>

         <!-- ?????? ?????? ??????  -->
         <button type="button" class="button" id="btn_plan_create">?????? ??????</button>
         <!-- ?????? ?????? Modal -->
         <div class="modal" id="myModal">
         <div class="modal_Content">
             <h3><i class="fas fa-check"></i>?????? ??????</h3>
             <p>?????? ??????????????? ??? ????????? ?????? ???????????????????????? ?<br>
                 ( ??? ?????? ????????? 1,000P ?????? ?????? )</p>
                 
             <div class="modal_button_container">
                 <div class="modal_button" id="modal_btn_no" value="N">?????????</a></div>
                 <div class="modal_button" id="modal_btn_yes" value="Y">???</a></div>
             </div>
           
         </div>
         </div>
    </nav>

    <!-- *** main section *** -->
    <section>

        <!-- map -->
        <div id="map"></div>

        <!-- maplist -->
        <div id="maplist">
         
            <div class="row">
                <div class="col-sm-1" id="place1" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/24/2853024_image2_1.jpg" alt="">2022 ??????????????????
                </div>
                <div class="col-sm-1" id="place2"draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/48/705248_image2_1.jpg" alt="">????????? ???????????? ??????
                </div>
                <div class="col-sm-1" id="place3" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/86/2020186_image2_1.jpg" alt="">?????????(??????????????? ???????????????)
                </div>
                <div class="col-sm-1" id="place4" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/13/2024213_image2_1.jpg" alt="">??????????????????(??????????????????)
                </div>
                <div class="col-sm-1" id="place5" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/08/1984608_image2_1.jpg" alt="">??????
                </div>
                <div class="col-sm-1" id="place6" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/62/1923662_image2_1.jpg" alt="">???????????????????????? ???????????????
                </div>
                <div class="col-sm-1" id="place7" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/23/2462023_image2_1.jpg" alt="">????????????????????????
                </div>
                <div class="col-sm-1" id="place8" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/15/1807915_image2_1.jpg" alt="">??????????????? ????????????
                </div>
            </div>

                
        </div>

        <!-- othersPlanModel -->
        <div id="othersPlanModal">
            <div id="opWrapper">
                <jsp:include page="../travel/others_plan.jsp" flush="true" /> 
            </div>
        </div>
    </section>


    <!-- *** footer *** -->
    <footer>
         <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
    </footer>

    <!-- *** JS *** -->
    <!-- flatpickr -->
    <script>
        console.clear();
        
        function createElementFromHTML(htmlString) {
            var div = document.createElement('div');
            div.innerHTML = htmlString.trim();
            // Change this to div.childNodes to support multiple top-level nodes.
            return div.firstChild;
        } //createElementFromHTML : String??? html??? ?????? 
        

        var startDate;
        var endDate
        function returnDay() {
            let [a,b] = document.querySelector('.dateSelector').value.split('to');
            startDate = a.replaceAll('.','-').trim();               // ?????? ????????? ????????? 
            endDate = b.replaceAll('.','-').trim()                  // ?????? ????????? ????????? 
            let newDate1 = new Date( a.replaceAll('.','-').trim() );
            let newDate2 = new Date( b.replaceAll('.','-').trim() );
            day = (newDate2-newDate1) / (1000 * 60 * 60 * 24) + 1;      // ????????????
            console.log("day : ", day);

            dayBox = document.querySelector(".day_box") ;               //day?????? ?????? ?????? 
            rowIndex = document.querySelector(".row_index");
            for(let i=1; i<day+1; i++) {

            let dayText= ' <div class="day_text" id="Day' + i + '">DAY ' + i + '</p> <ol class="row_index"> </ol> </div>';
            console.log("i:",i);
                
            dayBox.appendChild(createElementFromHTML(dayText));
            console.log("day?????? ??????"); 

            } //for 

            DropBoxEvent(); //?????? ????????? ????????? ????????? ??????  
            
            return day;
        } //returnDay : ???????????? ????????????, DAY n ?????? , ????????? ?????? 

       
        var dateSelector = document.querySelector('.dateSelector');
        const fp = flatpickr("#myID", {});
        dateSelector.flatpickr({  
            monthSelectorType: "dropdown",
            mode: "range",    
            dateFormat: "Y.m.d", 
            minDate: "today",
            maxDate: new Date().fp_incr(6),
            // enable: [
            //     function(date) {
            //         // return true to enable
            //         return (date.getDate() < 8);
            //     }
            // ]
            onClose: function(){
                console.log("returnDay() invoked.");
                returnDay();
            },
            onOpen: function(){
                $('.day_text').remove();
            }
        });
   
        // =========================================================

        // <!-- drag & drop -->

        //dragItem ????????? ????????? ?????? 
        let dragItem = document.querySelector(".row");
        

        dragItem.addEventListener("dragstart", (e) => {

            // console.log(e);
            // console.log("???????????? ???????????? ???????????? ?????????");

            ItemId = e.target.id;
        
            // console.log("target:" , e.target);
            // console.log("target.id:" , e.target.id);
            // console.log("target.html:" , e.target.innerHTML);
        });

        dragItem.addEventListener("dragend", (e) => {
            console.log(e);
            e.preventDefault();
            console.log("???????????? ????????? ???????????? ?????????");

        });

        //dragBox ????????? ?????????  
        function DropBoxEvent() {
            dragBox = document.querySelector(".day_box")

            dragBox.addEventListener("dragenter", (e) => {
                console.log(e);
                // console.log("??????????????? ????????? ????????? ????????? ????????????.");
            });

           
            dragBox.addEventListener("dragover", (e) => {
                e.preventDefault();
                // console.log("????????? ????????? ??? ????????? ?????? ?????? ???????????? ???????????? ?????????");
            }); 

            dragBox.addEventListener("drop", (e) => {
                e.preventDefault();
            
                let data = document.getElementById(ItemId);
                let dataImg = data.querySelector("img").src;
                let dataText = data.textContent;
                let latitude = data.getAttribute("locationY");
                let longitude = data.getAttribute("locationX");
                

                $("#place1").attr("locationX")
            
                console.log("data:",data);
                console.log("dataImg:",dataImg);
                console.log("dataText:",dataText);
                
                let rowIndex = '<div class="row">' + 
                                '<div class="col-1"><li class="row_num"></li></div>' + 
                                '<div class="col-5"><button onlick="" class="row_btn">-</button><img src="' + dataImg + ' " alt=""></div>' +
                                '<div class="col-6" style="white-space:pre-line" latitude=' + latitude + ' longitude=' + longitude + '>' + dataText + 
                                '</div></div>';
                    
                containerId = e.target.id;
                console.log("containerId:",containerId)

                height = $("#"+containerId).height()
                height += 125;
                $("#"+containerId).height(height);
                height = 0;
                
                e.target.querySelector(".row_index").append(createElementFromHTML(rowIndex));
                $("button.row_btn").css({'position': 'absolute', 'z-index': '3', 'left': '25px', 'top': '38px'})
                // e.target.querySelector(".row_index").html(rowIndex);
                
            
                // $(function() {
                //     $(".row_num").css("color" , "white");
                //     $(".row_num").addClass("selected2");
                // })
                // containerId = e.target.id;
                
                console.log("????????? ????????? ?????? ????????? ??????");

                //row_btn >> button delete ?????? ????????? 
                $(function() {
                    $(".row button").click(function() {
                        console.log("??????????????????",$(this));
                        // $(this).remove();
                        let dayTextClassID = "#" + $(this).closest(".day_text").attr("id");
                        height2 = $(this).closest(".day_text").height();
            
                        $(dayTextClassID).height(height2-115);
                        $(this).closest(".row").remove();
                        console.log("dayTextClassID",dayTextClassID);
                        height2 = 0;
                    
                    }) 
                }); // rowDelete();


            });  //dragover??? ?????? ?????????
        } //dragBoxEvent 


        
    // <!-- kakao map  -->

        var mapContainer = document.getElementById('map');
            var mapOptions = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 2
            };
        var map = new kakao.maps.Map(mapContainer, mapOptions);

	</script>

    <!-- include -->
    <!-- <script>
        window.addEventListener('load', function() {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function(el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            el.outerHTML = this.responseText;
                        }
                    };
                    xhttp.open('GET', includePath, true);
                    xhttp.send();
                }
            });
        });
    </script> -->
    

</body>
</html>
