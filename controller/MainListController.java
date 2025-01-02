package aiwa.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import aiwa.entity.Category;
import aiwa.entity.Country;
import aiwa.entity.Main;
import aiwa.model.CategoryModel;
import aiwa.model.CountryModel;
import aiwa.model.MainModel;

@WebServlet("/MainListController")
public class MainListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//1.PARAMETER
		String word = request.getParameter("word");
		if (word == null) {
			word = "";
		}

		String categoryId = request.getParameter("categoryid");
		if (categoryId == null) {
			categoryId = "0";
		}

		String countryid = request.getParameter("countryid");
		if (countryid == null) {
			countryid = "0";
		}

		//2.MODEL
		MainModel mm = new MainModel();
		ArrayList<Main> mains = mm.findByKeywordAndCategory(getServletContext(), word, Integer.parseInt(categoryId),
				Integer.parseInt(countryid));

		CategoryModel cm = new CategoryModel();
		ArrayList<Category> categories = cm.findAll(getServletContext());

		CountryModel cc = new CountryModel();
		ArrayList<Country> country = cc.findAll(getServletContext());

		//3.VIEW
		request.setAttribute("mains", mains);
		request.setAttribute("word", word);
		request.setAttribute("categoryid", Integer.parseInt(categoryId));
		request.setAttribute("countryid", Integer.parseInt(categoryId));
		request.setAttribute("categories", categories);
		request.setAttribute("country", country);
		request.getRequestDispatcher("/index.jsp").forward(request, response);

	}
}
