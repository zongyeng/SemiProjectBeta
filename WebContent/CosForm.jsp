<%@page import="java.util.Date"%>
<%@page import="semi.biz.MusicBiz"%>
<%@page import="semi.dao.MusicDao"%>
<%@page import="semi.dto.MusicDto"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.tika.exception.TikaException"%>
<%@page import="org.apache.tika.metadata.Metadata"%>
<%@page import="org.apache.tika.parser.ParseContext"%>
<%@page import="org.apache.tika.parser.Parser"%>
<%@page import="org.apache.tika.parser.mp3.Mp3Parser"%>
<%@page import="org.xml.sax.ContentHandler"%>
<%@page import="org.xml.sax.SAXException"%>
<%@page import="org.xml.sax.helpers.DefaultHandler"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
    // ������ ������ ����Ǵ� path
    // �̰ſ��� �Ʒ� �ŷ� �ٲ�       String path = request.getRealPath("File");

   String path = "C:/summerdown";
         
         //request.getSession().getServletContext().getRealPath("File");

    out.println("���� ��� : " + path + "<br/>");
    
    int size = 1024 * 1024 * 1000; // ���� ������ ���� : 10M   0�� 2�� �� ����
    String fileName = "";    // ���ε��� ���� �̸�
    String originalFileName = "";    //  ������ �ߺ��� ���� �̸��� ������ ��� ó���ϱ� ����
    
    // cos.jar���̺귯�� Ŭ������ ������ ���� ������ ���ε��ϴ� ����
    try{
        // DefaultFileRenamePolicy ó���� �ߺ��� �̸��� ������ ��� ó���� ��
        // request, ����������, �뷮, ���ڵ�Ÿ��, �ߺ����ϸ� ���� ��å
        MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
        
        // ������ ��ü �����̸����� �����´�.
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement();
        
        //���ϸ� �ߺ��� �߻����� �� ��å�� ���� �ڿ� 1,2,3 ó�� ���ڰ� �پ� ���� ���ϸ��� �����Ѵ�.
        // �̶� ������ �̸��� FilesystemName�̶�� �Ͽ� �� �̸� ������ �����´�. (�ߺ� ó��)
        fileName = multi.getFilesystemName(str);
        //���� ���� �̸��� �����´�.
        originalFileName = multi.getOriginalFileName(str);
        
    }catch(Exception e){
        e.printStackTrace();
    }
%>







<%
       String fileLocation = "C:/summerdown/"+originalFileName;
 
        try {
 
            InputStream input = new FileInputStream(new File(fileLocation));
            ContentHandler handler = new DefaultHandler();
            Metadata metadata = new Metadata();
            Parser parser = new Mp3Parser();
            ParseContext parseCtx = new ParseContext();
            parser.parse(input, handler, metadata, parseCtx);
            input.close();
 
/*             // List all metadata
            String[] metadataNames = metadata.names();
 
            for(String name : metadataNames){
                System.out.println(name + ": " + metadata.get(name));
            }
 
            System.out.println("----------------------------------------------");
            System.out.println("Title: " + metadata.get("title"));
            System.out.println("Artists: " + metadata.get("xmpDM:artist"));
            System.out.println("Composer : "+metadata.get("xmpDM:composer"));
            System.out.println("Genre : "+metadata.get("xmpDM:genre"));
            System.out.println("Album : "+metadata.get("xmpDM:album")); 


            String[] metadataNames = metadata.names();
            
            for(String name : metadataNames){
                System.out.println(name + ": " + metadata.get(name));
            }
 */
 
 
            System.out.println("----------------------------------------------");
         
           System.out.println("Title: " + metadata.get("title"));
           System.out.println("Artists: " + metadata.get("xmpDM:artist"));
           System.out.println("Composer : "+metadata.get("xmpDM:composer"));
           System.out.println("Genre : "+metadata.get("xmpDM:genre"));
           System.out.println("Album : "+metadata.get("xmpDM:album")); 
           System.out.println("trackNumber : "+metadata.get("xmpDM:trackNumber"));
           System.out.println("duration : "+metadata.get("xmpDM:duration"));
           System.out.println("releaseDate : "+metadata.get("xmpDM:releaseDate"));
           System.out.println("logComment : "+metadata.get("xmpDM:logComment"));
           
            
            MusicDao musicDao = new MusicDao();
            MusicDto musicDto = new MusicDto();
 
/*             
            musicDto.setAlbum_title(metadata.get("title"));
           albumDto.setAlbum_artist(Integer.parseInt(metadata.get("1")));
           musicDto.setAlbum_artist(1);
           // albumDto.setAlbum_content(metadata.get("xmpDM:composer"));
           musicDto.setAlbum_content("asd");
           // albumDto.setAlbum_enable(metadata.get("Y").charAt(0));
           musicDto.setAlbum_enable('c');
           // albumDto.setAlbum_length(Integer.parseInt(metadata.get("xmpDM:duration")));
           musicDto.setAlbum_length(1);
           // albumDto.setAlbum_no(Integer.parseInt(metadata.get("title")));
           musicDto.setAlbum_no(1);
           musicDto.setAlbum_tag(metadata.get("title"));
           // albumDto.setAlbum_tracks(Integer.parseInt(metadata.get("xmpDM:trackNumber")));
           musicDto.setAlbum_tracks(1);            
*/


		musicDto.setMusic_artist(1);
		musicDto.setMusic_no(1);
		musicDto.setMusic_title(metadata.get("title"));
		musicDto.setMusic_size(Integer.parseInt(metadata.get("xmpDM:trackNumber")));
		musicDto.setMusic_length((int)(Math.round(Double.parseDouble(metadata.get("xmpDM:duration")))));
		musicDto.setMusic_hl_time(1);
		musicDto.setMusic_content(metadata.get("xmpDM:logComment"));
		musicDto.setMusic_composer(metadata.get("xmpDM:composer"));
		musicDto.setMusic_lylicist(metadata.get("xmpDM:composer"));
		musicDto.setMusic_tag(metadata.get("xmpDM:genre"));
		musicDto.setMusic_enable('Y');
		musicDto.setMusic_album(1);

		
		//musicDto = new MusicDto(1,1,"tq",1,1,1,"tq","tq","tq","tq",'Y',1);

		musicDao.insert_music(musicDto);
            
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        } catch (TikaException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        


%>








<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Upload Result</title>
</head>
<body>
<h1>File Upload Result</h1>
<hr>
<h2><span>file upload success!!</span></h2>
          	
          	
</body>
</html>