<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GDCC 골프/호텔 예약 서비스</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            
            color: gold;
            font-family: Arial, sans-serif;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: white;
           	
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 10;
        }

        .navbar a {
            color: black;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 1.2rem;
        }

        .navbar a:hover {
            background-color: gold;
            color: black;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 100vh;
            position: relative;
            z-index: 1;
            margin-top: 80px; /* 사이드바 높이만큼 마진 추가 */
        }

        .logo {
            margin-bottom: 20px;
        }

        .logo img {
            width: 200px;
            height: auto;
            border-radius:50%;
        }

        .button {
            background-color: white;
            color: black;
            padding: 15px 30px;
            font-size: 1.2rem;
            border: none;
            cursor: pointer;
            margin: 10px;
            border-radius:10px;
        }

        .button:hover {
            background-color: #e0c200;
            border-radius:10px;
        }

        .auth-buttons {
            display: flex;
            gap: 20px;
            margin: 20px;
            border-radius:10px;
            
        }

        .auth-buttons a {
        
            background-color: white;
            color: black;
            padding: 10px 20px;
            text-decoration: none;
            font-size: 1.2rem;
            border-radius:10px;
        }

        .auth-buttons a:hover {
            background-color: #e0c200;
        }

        .introduction {
            margin: 50px 0;
            padding: 20px;
            background-color: white;
            color: green;
            font-size: 2.5rem;
            text-align:center;
        }

        .image-gallery {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }

     

        .background-image {
            position: relative;
            width: 100%;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            background: url('/Semi_F_GDCC/css/img/bg-1.jpeg') no-repeat center center;
            background-size: cover;
        }

        .background-image::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* 배경 위에 반투명 레이어 추가 */
            z-index: 0;
        }

        .content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            z-index: 1;
        }

        .main-section {
            padding: 50px;
            background-color: white;
            color: black;
            min-height: 300px;
        }
        .main-section img{
        	width:700px;
        	height:600px;
        	border-radius: 20px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <a href="#">골프장 소개</a>
            <a href="#">코스 소개</a>
            <a href="#">예약 조회</a>
            <a href="#">오시는 길</a>
        </div>
        <div style="padding-right:20px;">
            <a href="#">호텔 예약</a>
            <a href="#">MyPage</a>
        </div>
    </div>
    <div class="background-image">
        <div class="content-container">
            <div class="main-content">
                <div class="logo">
                    <img src="/Semi_F_GDCC/css/img/logosub.jpeg" alt="GDCC 로고">
                </div>
                <button class="button">예약하기</button>
                <div class="auth-buttons">
                    <a href="#">Login</a>
                    <a href="#">Register</a>
                </div>
            </div>
        </div>
    </div>
    <div class="main-section">
        <div class="introduction">INTRODUCTION</div>
        <hr>
        
        <div>
        <h2 style="border-bottom:2px solid green">&nbsp;꿈의 라운드를 완성하는 특별한 공간, GDCC 골프텔&nbsp;</h2>
		<br>
		
		<h3>도시의 소음에서 벗어나 자연의 품에서 느끼는 여유로움. GDCC 골프텔에서 고품격 골프 라이프를 즐기세요.</h3>
		<img src="/Semi_F_GDCC/css/img/img1.png">
		<br>
		<h3>럭셔리와 휴식의 완벽한 조화</h3>
			아름다운 골프 코스를 배경으로 펼쳐지는 최고급 객실과 탁 트인 전망, 고급스러운 편의시설은 당신에게 최고의 휴식을 선사합니다.
		<br>
		<img src="/Semi_F_GDCC/css/img/img2.jpeg">
		<h3>맞춤형 서비스와 프리미엄 편의시설</h3>
			GDCC 골프텔은 고객 한 분 한 분의 편안한 휴식을 위해 세심한 맞춤형 서비스를 제공합니다. 스파, 헬스장, 미식 레스토랑 등 다양한 프리미엄 편의시설을 통해 진정한 여유를 느껴보세요.
		<br>
		<img src="/Semi_F_GDCC/css/img/img2.jpeg">
		<h3>골프와 자연이 어우러진 특별한 경험</h3>
			GDCC 골프텔은 눈부신 자연경관 속에서 완벽한 골프 라운드를 즐길 수 있는 최고의 환경을 제공합니다. 라운딩 후에는 품격 있는 휴식을 통해 하루의 피로를 말끔히 씻어내세요.
		<br>
		<img src="/Semi_F_GDCC/css/img/img2.jpeg">
	</div>
        </div>
   
</body>
</html>
