<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Sunflower:wght@300&display=swap" rel="stylesheet">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GDCC 골프/호텔 예약 서비스</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            
            color: gold;
            font-family: "Gowun Dodum", sans-serif;
  			font-weight: 400;
  			font-style: normal;
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