package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import semi.biz.SearchEngineBiz;
import semi.dto.SearchEngineDto;


@WebServlet("/SearchEngine.do")
public class SearchEngine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchEngine() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		SearchEngineBiz biz = new SearchEngineBiz();
		PrintWriter out = response.getWriter();
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("search")) {
			String searchcontent = request.getParameter("searchcontent");
			List<SearchEngineDto> searchartist = biz.searchartist(searchcontent);
			List<SearchEngineDto> searchmusic = biz.searchmusic(searchcontent);
			List<SearchEngineDto> searchalbum = biz.searchalbum(searchcontent);
			
			request.setAttribute("searchartist", searchartist);
			request.setAttribute("searchmusic", searchmusic);
			request.setAttribute("searchalbum", searchalbum);
			request.setAttribute("searchcontent", searchcontent);
			
			dispatch(request, response, "SearchEngine.jsp");
			
		} else if(command.equals("artistsmore")) {
			String searchcontent = request.getParameter("searchcontent");
			int num = Integer.parseInt(request.getParameter("num"));
			
			List<SearchEngineDto> searchartist = biz.searchartist(searchcontent);
			
			JSONArray artistArr = new JSONArray();
			
			for(SearchEngineDto dto : searchartist) {
				JSONObject artistOb = new JSONObject();
				artistOb.put("artistseq", dto.getUserinfo_seq());
				artistOb.put("artistnickname", dto.getUserinfo_nickname());
				
				artistArr.add(artistOb);
			}
			
			out.println(artistArr);
			
		} else if(command.equals("songsmore")) {
			String searchcontent = request.getParameter("searchcontent");
			int num = Integer.parseInt(request.getParameter("num"));
			
			List<SearchEngineDto> searchmusic = biz.searchmusic(searchcontent);
			
			JSONArray songArr = new JSONArray();
			
			for(SearchEngineDto dto : searchmusic) {
				JSONObject songOb = new JSONObject();
				songOb.put("songseq", dto.getMusic_seq());
				songOb.put("songtitle", dto.getMusic_title().substring(dto.getMusic_title().indexOf('_')+1));
				
				songArr.add(songOb);
			}
			
			out.println(songArr);
			
		} else if(command.equals("albumsmore")) {
			String searchcontent = request.getParameter("searchcontent");
			int num = Integer.parseInt(request.getParameter("num"));
			
			List<SearchEngineDto> searchalbum = biz.searchalbum(searchcontent);
			
			JSONArray albumArr = new JSONArray();
			
			for(SearchEngineDto dto : searchalbum) {
				JSONObject albumOb = new JSONObject();
				albumOb.put("albumseq", dto.getAlbum_seq());
				albumOb.put("albumtitle", dto.getAlbum_title());
				
				albumArr.add(albumOb);
			}
			
			out.println(albumArr);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
