package org.green.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	@Test
	public void testConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "springex";
		String pass = "green";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, id, pass);
			log.info(con);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void inbook() {
		String sql = "insert into book values(seq_book.nextval, ?, ?, ?, ?, sysdate)";
		Connection con = null;
		DataSource ds = null;
		PreparedStatement psmt = null;
		
	}
}
