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
<!-- ���� ���ε带 ���ؼ��� form�� �Ӽ��� enctype="multipart/form-data" ��� �ο��ؾ����� �����ϴ�.  -->
<form action="CosForm.jsp" method="post" enctype="multipart/form-data">
    ���� : <input type="file" name="file"><br/>
        �뷡 �̸� :<input type="text" name="MUSIC_TITLE"><br/>
        ���̶���Ʈ ���� �ð�  :<input type="number" name="MUSIC_HL_TIME">���̶���Ʈ �ð� ã��<input type="button"><br/>
        �뷡 ���� :<input type="text" name="MUSIC_CONTENT"><br/>
        �۰ :<input type="text" name="MUSIC_COMPOSER"><br/>
        �ۻ簡 :<input type="text" name="MUSIC_LYRICIST"><br/>
        �±� :
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