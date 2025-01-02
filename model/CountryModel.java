package aiwa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import aiwa.entity.Country;

public class CountryModel {
	public ArrayList<Country> findAll(ServletContext context) {
		ArrayList<Country> result = new ArrayList<>();
		try {
			Class.forName("org.sqlite.JDBC");

			Connection conn = DriverManager.getConnection("jdbc:sqlite:" + context.getRealPath("WEB-INF/4warLord.db"));

			String sql = "select * from country order by countryid";
			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Country country = new Country();
				country.setCountryId(rs.getInt("countryid"));
				country.setCountryName(rs.getString("countryname"));
				result.add(country);
			}
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
