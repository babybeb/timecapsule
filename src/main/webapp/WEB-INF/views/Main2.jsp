<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8" name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <title>그룹 목록</title>
    </head>

    <body>
        <header>
            <h1>메인 화면</h1>
        </header>

        <form>
            <label id="nickname" name="nickname"></label>

            <a href="/group">
                <input type="button" value="그룹 조회">
            </a>

            <a href="/group/new" methods="get">
                <input type="button" value="그룹 생성">
            </a>

            <a href="/member/info">
                <input type="button" value="내 정보">
            </a>

            <a href="/group/${group.id}"> <!-- 그룹조회매핑 다시 확인 -->
                <input type="button" value="내 그룹">
           </a>

            <a href="/signOut">
                <input type="button" id="logout" value="로그아웃">
            </a>

            <a href="/member/{id}/delete" id="cancel" method="post">
                <input type="button" value="회원 탈퇴">
            </a>
        </form>

        <script>
            window.onload = function() {
                const nick = '${nickname}';
                console.log(nick);

                if(nick != ''){
                    sessionStorage.setItem("nick", nick);
                }

                var data = sessionStorage.getItem('nick');
                document.getElementById('nickname').innerHTML = data + "님 환영합니다.";

                var login_state = sessionStorage.getItem('state');

                if(login_state != '1'){
                    location.href = "Main.jsp";
                }
            }

            const btn = document.getElementById('logout');

            btn.addEventListener('click', function (){
                sessionStorage.removeItem("nick");
                sessionStorage.setItem("state", '0');
            })

            const cbtn = document.getElementById('cancel');

            cbtn.addEventListener('click', function (){
                sessionStorage.removeItem("nick");
                sessionStorage.setItem("state", '0');
            })

        </script>
    </body>
</html>