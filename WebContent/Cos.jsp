<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Form Page</title>
</head>
<body>

<h1>File Form Page</h1>
<hr>
<!-- 파일 업로드를 위해서는 form에 속성을 enctype="multipart/form-data" 라고 부여해야지만 가능하다.  -->
<form action="CosForm.jsp" method="post" enctype="multipart/form-data">
    파일 : <input type="file" name="file"><br/>
        노래 이름 :<input type="text" name="MUSIC_TITLE"><br/>
        하이라이트 시작 시간  :<input type="number" name="MUSIC_HL_TIME">하이라이트 시간 찾기<input type="button"><br/>
        노래 설명 :<input type="text" name="MUSIC_CONTENT"><br/>
        작곡가 :<input type="text" name="MUSIC_COMPOSER"><br/>
        작사가 :<input type="text" name="MUSIC_LYRICIST"><br/>
        태그 :
    <select name="MUSIC_TAG">
    <option value="Cloudy">Cloudy</option>
    <option value="Rainy">Rainy</option>
    <option value="Snow">Snow</option>
    <option value="Storm">Storm</option>
     <option value="Sunny">Sunny</option>
      <option value="Windy">Windy</option>
</select>

   <input type="submit" value="File Upload">
   </form>
    
</body>
</html>