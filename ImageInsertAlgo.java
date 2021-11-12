import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ImageInsertAlgo {
	public static void main(String[] args) {
		insertMainImage();	
	}
	
	public static void insertMainImage()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/22acres", "root", "root");
			String sql = "insert into society_gallery (image_name,image,society_id) values(?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, "1");
			preparedStatement.setString(2, "C:\\Users\\SHAIL\\Desktop\\main supercity\\1.jpeg");
			preparedStatement.setInt(3, 1);
			int rows= preparedStatement.executeUpdate();
			connection.close();
//			response.sendRedirect("societyList.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public static void insertAmenitiesImage()
	{
		
	}
}
