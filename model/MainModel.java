package aiwa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import aiwa.entity.Category;
import aiwa.entity.Country;
import aiwa.entity.Main;

public class MainModel {

	public Main findById(ServletContext context, int mainId) {

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/4warLord.db"));

			String sql = "select * from main where id=?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, mainId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Main main = new Main();
				main.setMainId(rs.getInt("id"));
				main.setMainName(rs.getString("name"));
				main.setImage(rs.getString("image"));
				main.setDetail(rs.getString("detail"));
				main.setVideo(rs.getString("video"));
				conn.close();

				return main;

			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	public ArrayList<Main> findByKeywordAndCategory(ServletContext context, String word, int categoryId,
			int countryId) {

		ArrayList<Main> result = new ArrayList<>();

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/4warLord.db"));

			String sql = "select "
					+ "* "
					+ " from "
					+ " main m "
					+ "inner join "
					+ "categories c "
					+ " on "
					+ "m.categoryid = c.categoryid "
					+ "inner join "
					+ "country cc "
					+ "on "
					+ "m.countryid=cc.countryid "
					+ "where "
					+ "(name like? or detail like?) ";

			if (categoryId > 0) {
				sql += "and c.categoryid = ? ";

			}
			if (countryId > 0) {
				sql += "and cc.countryid = ? ";
			}

			sql += " order by "
					+ "id";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + word + "%");
			stmt.setString(2, "%" + word + "%");

			if (categoryId > 0) {
				stmt.setInt(3, categoryId);
			}
			if (countryId > 0) {
				stmt.setInt(4, countryId);
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Main main = new Main();
				main.setMainId(rs.getInt("id"));
				main.setMainName(rs.getString("name"));
				main.setImage(rs.getString("image"));
				main.setDetail(rs.getString("detail"));

				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryid"));
				category.setCategoryName(rs.getString("categoryname"));

				Country c = new Country();
				c.setCountryId(rs.getInt("countryid"));
				c.setCountryName(rs.getString("countryname"));

				main.setCategory(category);
				main.setCountry(c);

				result.add(main);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<Main> findAll(ServletContext context) {

		ArrayList<Main> result = new ArrayList<>();

		try {

			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/4warLord.db"));

			String sql = "select * "
					+ "from "
					+ "main m "
					+ "inner join "
					+ "categories c "
					+ "on "
					+ "m.categoryid = c.categoryid "
					+ "inner join "
					+ "country cc "
					+ "on "
					+ "m.countryid=cc.countryid "
					+ "order by mainid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Main main = new Main();
				main.setMainId(rs.getInt("id"));
				main.setMainName(rs.getString("name"));
				main.setImage(rs.getString("image"));
				main.setDetail(rs.getString("detail"));

				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryid"));
				category.setCategoryName(rs.getString("categoryname"));

				Country c = new Country();
				c.setCountryId(rs.getInt("countryid"));
				c.setCountryName(rs.getString("countryname"));

				main.setCategory(category);
				main.setCountry(c);

				result.add(main);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
