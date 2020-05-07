<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/style.css" />
<script src="https://kit.fontawesome.com/764f0503e3.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원 가입</h1>
	<form action='add' method='post' enctype='multipart/form-data'>
		이메일: <input name='email' type='email'><br>
		이름: <input name='name' type='text'><br>
		암호: <input name='password' type='password'><br>
		전화: <input name='tel' type='tel'><br>
		전공: <input name='major' type='text'><br>
		자기소개<br><textarea name='introduce' rows='5' cols='60'></textarea><br>
		사진: <input name='photo' type='file'><br>
		로그인 방식
		<select name="loginMethod">
		    <option value="0">이메일</option>
		    <option value="1">카카오</option>
		    <option value="2">구글</option>
		</select><br>
		<button>완료</button>
	</form>
	<script type="text/javascript">
	  @SuppressWarnings("unused")
	  private static boolean validationPasswd(String password) {
	    Pattern p = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$");
	    Matcher m = p.matcher(password);
	    
	    if(m.matches()) {
	      return true;
	    }
	    return false;
	  }
	</script>
</body>
</html>

