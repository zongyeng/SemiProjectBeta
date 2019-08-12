package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.dto.UserInfo;

@WebServlet("/musicgenreServlet")
public class musicgenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public musicgenreServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");

		System.out.println("["+command+"]");
		
		if(command.equals("allpopular")) {
			dispatch(request, response, "MusicGenreAllPopular.jsp");
		} else if (command.equals("allrecommand")) {
			dispatch(request, response, "MusicGenreAllRecommand.jsp");
		} else if (command.equals("cloudypopular")) {
			dispatch(request, response, "MusicGenreCloudyPopular.jsp");
		} else if (command.equals("cloudyrecommand")) {
			dispatch(request, response, "MusicGenreCloudyRecommand.jsp");
		} else if (command.equals("rainypopular")) {
			dispatch(request, response, "MusicGenreRainyPopular.jsp");
		} else if (command.equals("rainyrecommnad")) {
			dispatch(request, response, "MusicGenreRainyRecommand.jsp");
		} else if (command.equals("snowpopular")) {
			dispatch(request, response, "MusicGenreSnowPopular.jsp");
		} else if (command.equals("snowrecommand")) {
			dispatch(request, response, "MusicGenreSnowRecommand.jsp");
		} else if (command.equals("stormpopular")) {
			dispatch(request, response, "MusicGenreStormPopular.jsp");
		} else if (command.equals("stormrecommand")) {
			dispatch(request, response, "MusicGenreStormRecommand.jsp");
		} else if (command.equals("sunnypopular")) {
			dispatch(request, response, "MusicGenreSunnyPopular.jsp");
		} else if (command.equals("sunnyrecommand")) {
			dispatch(request, response, "MusicGenreSunnyRecommand.jsp");
		} else if (command.equals("windypopular")) {
			dispatch(request, response, "MusicGenreWindyPopular.jsp");
		} else if (command.equals("windyrecommand")) {
			dispatch(request, response, "MusicGenreWindyRecommand.jsp");
		} else if (command.equals("albumpopular")) {
			dispatch(request, response, "Albumchartpopular.jsp");
		} else if (command.equals("albumrecommand")) {
			dispatch(request, response, "Albumchartrecommand.jsp");
		}
	}
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
