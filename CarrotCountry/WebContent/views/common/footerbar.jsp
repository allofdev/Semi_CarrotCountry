<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        * {
            box-sizing: border-box;
        }
    
        #footerbar {
            position: absolute;
            top: 100%;
            width: 100%;
            height: 270px;
            background-color: #00251a
        }
        .footerbar_totalWrapper {
            width: 1200px;
            height: 100%;
            border: 1px solid white;
            margin: auto;
        }
        .footer_upperWrapper {
            width: 100%;
            height: 52px;
            border: 1px solid white;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .footer_upperWrapper>button {margin-left: 40px;}
        .footer_belowWrapper {
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
  <footer id="footerbar">
        <div class=footerbar_totalWrapper>
            <div class="footer_upperWrapper">
                <button class="btn btn-warning">공지사항</button>
                <button class="btn btn-warning">고객센터</button>
                <button class="btn btn-warning">개인정보 취급방침</button>
                <button class="btn btn-warning">회사소개</button>
            </div>
            <div class="footer_belowWrapper">
                <p style="color:white">잡소리</p>
            </div>
        </div>
    </footer>
</body>
</html>