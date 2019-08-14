package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PageMoving")
public class pagemovingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public pagemovingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		if(command.equals("musichome")) {
			dispatch(request, response, "MainHome.jsp");
		}
		else if(command.equals("musicgenre")) {
			dispatch(request, response, "MusicGenreAllPopular.jsp");
		}
		else if(command.equals("musicalbumpopular")) {
			dispatch(request, response, "Albumchartpopular.jsp");
		}
		else if(command.equals("musicalbumrecommand")) {
			dispatch(request, response, "Albumchartrecommand.jsp");
		}
		else if(command.equals("broadcstingmain")) {
			dispatch(request, response, "StreamingMain.jsp");
		}
		else if(command.equals("broadcstingtop")) {
			dispatch(request, response, "StreamingPopular.jsp");
		}
		else if(command.equals("broadcstingrecommand")) {
			dispatch(request, response, "StreamingRecommand.jsp");
		}
		else if(command.equals("broadcstingnewest")) {
			dispatch(request, response, "StreamingNewest.jsp");
		}
		else if(command.equals("concerthallmain")) {
			dispatch(request, response, "ConcertHallMain.jsp");
		}
		else if(command.equals("concerthalla")) {
			dispatch(request, response, "ConcertHallA.jsp");
		}
		else if(command.equals("concerthallb")) {
			dispatch(request, response, "ConcertHallB.jsp");
		}
		else if(command.equals("concerthallreservation")) {
			dispatch(request, response, "ConcertHallReservation.jsp");
		}
		else if(command.equals("concerthallareservation")) {
			dispatch(request, response, "ConcertHallAReservation.jsp");
		}
		else if(command.equals("concerthallbreservation")) {
			dispatch(request, response, "ConcertHallBReservation.jsp");
		}
		else if(command.equals("servicecenter")) {
			dispatch(request, response, "ServiceCenter.jsp");
		}
		else if(command.equals("concerthallbreservation")) {
			dispatch(request, response, "ConcertHallBReservation.jsp");
		}
		else if(command.equals("userinformation")) {
			dispatch(request, response, "UserInformation.jsp");
		}
		else if(command.equals("portfolio")) {
			dispatch(request, response, "UserPortfolio.jsp");
		}
		else if(command.equals("portfolioupdate")) {
			dispatch(request, response, "UserPortfolioUpdate.jsp");
		}
		else if(command.equals("cashcharge")) {
			dispatch(request, response, "PayRule.jsp");
		}

	}
		public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	
	}
}


