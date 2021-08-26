package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBcontext;
import entity.Account;
import entity.Product;

public class DAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Account getAccount(String username, String password) {

		String query = "select * from Account where username=? and password=?";

		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);

			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public List<Product> getAllProductbyTypeandIndex(String type, int index) {
		List<Product> list = new ArrayList<>();
		String query = "SELECT * FROM products WHERE type=? ORDER BY id OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY ";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			ps.setInt(2, (index - 1) * 8);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public int countProductbyName(String type) {
		String query = "select count(*) from products where type=?";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	public Product getProductbyId(int pid) {

		String query = "select * from products where id =?";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, pid);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public List<Product> getProductbyTypeandIndex(String type, int index) {
		List<Product> list = new ArrayList<>();
		String query = "SELECT * FROM products WHERE type=? ORDER BY id OFFSET ? ROWS FETCH NEXT 8 ROWS ONLY ";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			ps.setInt(2, (index - 1) * 8);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public void addDonhang(String tenKh, String diachi, String sdt, String email, float tongtien) {
		String query = " insert into DonHang values(?,?,?,?,?)";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setNString(1, tenKh);
			ps.setNString(2, diachi);
			ps.setNString(3, sdt);
			ps.setNString(4, email);
			ps.setFloat(5, tongtien);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public List<Account> getAllUser() {
		List<Account> listAcc = new ArrayList<>();
		String query = "select * from Account where role=0";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				listAcc.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listAcc;
	}

	public void deleteUserById(int id) {
		String query = "delete from Account where id=?";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (Exception e) {
					// TODO: handle exception
		}		
	}
	public void addUser(String username , String password) {
		String query="insert into Account values (?,?,0)";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.executeUpdate();
		} catch (Exception e) {
					// TODO: handle exception
		}
	}
	public void updateUser(int id,String username)
	{
		String query="update Account\r\n"
				+ "set username=?\r\n"
				+ "where id=?";
		try {
			conn = new DBcontext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (Exception e) {
					// TODO: handle exception
		}
	}
}
