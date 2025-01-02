package aiwa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.Main;
import aiwa.model.MainModel;

@WebServlet("/MainVideoController")
public class MainVideoController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mainId = request.getParameter("mainid");
		if (mainId == null) {
			mainId = "0";
		}

		MainModel mm = new MainModel();
		Main main = mm.findById(getServletContext(), Integer.parseInt(mainId));

		request.setAttribute("main", main);
		request.getRequestDispatcher("/mainVideoView.jsp").forward(request, response);
	}

}
