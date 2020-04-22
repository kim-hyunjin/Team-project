<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>BTS-로그인</title>
<script>
    window.onload = function() {
 
        if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
            document.loginForm.email.value = getCookie("id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
            document.loginForm.idsave.checked = true; // 체크는 체크됨으로
        }
 
    }
 
    function setCookie(name, value, expiredays) //쿠키 저장함수
    {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires="
                + todayDate.toGMTString() + ";"
    }
 
    function getCookie(Name) { // 쿠키 불러오는 함수
        var search = Name + "=";
        if (document.cookie.length > 0) { // if there are any cookies
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // if cookie exists
                offset += search.length; // set index of beginning of value
                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
                if (end == -1)
                    end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
        }
    }
 
    function sendit() {
        var frm = document.loginForm;
        if (!frm.email.value) { //아이디를 입력하지 않으면.
            alert("아이디를 입력 해주세요!");
            frm.email.focus();
            return;
        }
        if (!frm.password.value) { //패스워드를 입력하지 않으면.
            alert("패스워드를 입력 해주세요!");
            frm.password.focus();
            return;
        }
 
        if (document.loginForm.idsave.checked == true) { // 아이디 저장을 체크 하였을때
            setCookie("id", document.loginForm.email.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
        } else { // 아이디 저장을 체크 하지 않았을때
            setCookie("id", document.loginForm.email.value, 0); //날짜를 0으로 저장하여 쿠키삭제
        }
 
        document.loginForm.submit(); //유효성 검사가 통과되면 서버로 전송.
 
    }
</script>
 
 
</head>
<body>
    <form id="loginForm" name="loginForm" method="post"
        action="login">
        <table width="100%" height="400" border="0" align="center">
            <tr>
                <td>
                    <table border="0" width="300" height="200" align="center"
                        class="loginBorder">
                        <tr align="center">
                            <td>로그인</td>
                        </tr>
                        <tr>
                            <td>
                                <table border="0" width="100%" height="100%">
                                    <tr>
                                        <td width="30%">아이디</td>
                                        <td width="70%"><input type="text" name="email"
                                            size="20" maxlength="20"></td>
                                    </tr>
                                    <tr>
                                        <td>패스워드</td>
                                        <td><input type="password" name="password" size="20"
                                            maxlength="20"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left"><input type="checkbox"
                                            name="idsave" value="saveOk">아이디 저장</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr align="center">
                            <td><input type="button" value="로그인" onclick="sendit()">
                                <a href="../user/form">회원가입 </a></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
