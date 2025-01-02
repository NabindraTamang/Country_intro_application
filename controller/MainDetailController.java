package aiwa.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.Main;
import aiwa.model.MainModel;

@WebServlet("/MainDetailController")
public class MainDetailController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1.PARAMETER
		String mainId = request.getParameter("mainid");
		if (mainId == null) {
			mainId = "0";
		}

		//2.MODEL
		MainModel mm = new MainModel();
		Main main = mm.findById(getServletContext(), Integer.parseInt(mainId));

		//3.VIEW
		request.setAttribute("main", main);
		request.getRequestDispatcher("/mainDetailView.jsp").forward(request, response);

	}
}
