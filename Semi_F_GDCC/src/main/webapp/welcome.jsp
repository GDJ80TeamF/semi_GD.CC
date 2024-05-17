<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>골프장 홈페이지</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }
        .container {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .main-content {
			    color: white;
			    flex: 95%;
			    display: flex;
			    justify-content: center;
			    font-family: "Playfair Display";
			    align-items: center;
			    flex-direction: column;
			    background-image: url("/Semi_F_GDCC/css/img/course.jpg");
			    background-size: cover; /* 이미지가 요소를 완전히 채우도록 설정 */
			    background-position: center; /* 이미지가 가운데에 위치하도록 설정 */
			}
			        .intro-text {
            font-size: 24px;
            margin-bottom: 10px; /* 텍스트와 동그라미 사이의 간격 */
        }
        .circle-container {
            display: flex;
            gap: 80px; /* 동그라미 사이의 간격 */
            margin-top: 25px;
        }
        .circle-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px; /* 동그라미와 텍스트 사이의 간격 */
        }
        .circle {
            width: 250px; /* 동그라미 크기 */
            height: 250px; /* 동그라미 크기 */
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid gray;
            transition: transform 0.3s ease; /* 마우스 오버 시 확대 애니메이션 */
        }
        .circle img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .circle:hover {
            transform: scale(1.1); /* 마우스 오버 시 확대 효과 */
        }
        .footer {
            background-color: black;
            color: gray;
            flex: 5%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            font-size: 10px;
        }
        .footer div {
            margin: 5px 0;
        }
        .logo {
				    
				    width: 200px; /* 로고 크기 설정 */
				    height: 50px; /* 로고 크기 설정 */
				    object-fit: contain;
				}
		.intro-text {
			font-weight: bold;
		}
    </style>
</head>
<body>
    <div class="container">
        <div class="main-content">
        <div>
          <img src="/Semi_F_GDCC/css/img/screen.png" alt="로고" class="logo"> <!-- 로고 이미지 추가 -->        
        </div>
           <p class="intro-text">
    				Enjoy breathtaking views, stunning shots, and a cozy relaxation space
           </p>
            <div class="circle-container">
                <div class="circle-item">
                    <a href="golf.html" class="circle">
                        <img src="/Semi_F_GDCC/css/img/clubHouse.png" alt="골프장">
                    </a>
                    <p>Golf Club</p>
                </div>
                <div class="circle-item">
                    <a href="hotel.html" class="circle">
                        <img src="/Semi_F_GDCC/css/img/hotel.jpg" alt="호텔">
                    </a>
                    <p>Hotel</p>
                </div>
            </div>
        </div>
        <div class="footer">
            <div>주소: 서울특별시 강남구
            	전화번호: 02-1234-5678
            	정보: 운영시간 - 06:00 ~ 22:00
            </div>
        </div>
    </div>
</body>
</html>