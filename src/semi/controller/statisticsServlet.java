package semi.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import semi.biz.stacked_barBiz;
import semi.dao.stacked_barDao;
import semi.dto.stacked_barDto;

@WebServlet("/stacked_barServlet")
public class statisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public statisticsServlet() { super(); }

    stacked_barBiz biz = new stacked_barBiz();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("stacked_bar")) {
			int userseq = Integer.parseInt(request.getParameter("musicianSeq"));
			String musicianname = biz.username(userseq);
			List<stacked_barDto> list = biz.songs(userseq);
			
			int songseq = list.get(0).getMusic_seq();
			
			List<Date> songReferrals = new ArrayList<Date>();
			List<Date> songViews = new ArrayList<Date>();
			songReferrals = biz.selectReferrals(songseq);
			songViews = biz.selectViews(songseq);

			java.util.Date parsedate = songReferrals.get(0);

			JSONArray songjson = new JSONArray();

			JSONArray songReferralsarr = new JSONArray();

			JSONObject songReferralsob = new JSONObject();
			int y = 1;
			int z = 0;
			songReferralsob.put("month", parseMonth(parsedate.toString().substring(4, 7)));
			songReferralsob.put("day", parsedate.toString().substring(8, 10));

			songReferralsarr.add(songReferralsob);
			for (int i = 1; i < songReferrals.size(); i++) {
				parsedate = songReferrals.get(i);
				int year = Integer.parseInt(parsedate.toString().substring(24, 28));
				String month = parseMonth(parsedate.toString().substring(4, 7));
				String day = parsedate.toString().substring(8, 10);
				if (songReferralsarr.get(z).toString().indexOf("\"month\":" + "\""+month+"\"") != -1
						&& songReferralsarr.get(z).toString().indexOf("\"day\":" +"\""+ day+"\"") != -1) {
					y++;
				} else {
					songReferralsob.put("y", y);
					

					songReferralsob = new JSONObject();
					songReferralsob.put("month", month);
					songReferralsob.put("day", day);
					songReferralsarr.add(songReferralsob);
					y = 1;
					z++;
				}
			}
			songReferralsob.put("y", y);
			
			songjson.add(songReferralsarr);
			java.util.Date parsedate1 = songViews.get(0);
			
			JSONArray songViewsarr = new JSONArray();

			JSONObject songViewsob = new JSONObject();
			y = 1;
			z = 0;
			songViewsob.put("month", parseMonth(parsedate1.toString().substring(4, 7)));
			songViewsob.put("day", parsedate1.toString().substring(8, 10));

			songViewsarr.add(songViewsob);
			for (int i = 1; i < songViews.size(); i++) {
				parsedate1 = songViews.get(i);
				int year = Integer.parseInt(parsedate1.toString().substring(24, 28));
				String month = parseMonth(parsedate1.toString().substring(4, 7));
				String day = parsedate1.toString().substring(8, 10);
				if (songViewsarr.get(z).toString().indexOf("\"month\":" + "\""+month+"\"") != -1
						&& songViewsarr.get(z).toString().indexOf("\"day\":" +"\""+ day+"\"") != -1) {
					y++;
				} else {
					songViewsob.put("y", y);
					
					songViewsob = new JSONObject();
					songViewsob.put("month", month);
					songViewsob.put("day", day);
					songViewsarr.add(songViewsob);
					y = 1;
					z++;
				}
			}
			songViewsob.put("y", y);

			songjson.add(songViewsarr);

			request.setAttribute("musicianname", musicianname);
			request.setAttribute("json", songjson);
			request.setAttribute("list", list);
			dispatch(request, response, "UserSongStatistics.jsp");
			
			
		} else if(command.equals("")) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private String parseMonth(String month) {
		switch (month)
		{

		case "Jan":
			
			return "01";

		case "Fed":

			return "02";

		case "Mar":

			return "03";

		case "Apr":

			return "04";

		case "May":

			return "05";

		case "Jun":

			return "06";

		case "Jul":

			return "07";

		case "Aug":

			return "08";

		case "Sep":

			return "09";

		case "Oct":

			return "10";

		case "Nov":

			return "11";

		case "Dec":

			return "12";

		default:

			break;

		}

		return "00";
	}

}
