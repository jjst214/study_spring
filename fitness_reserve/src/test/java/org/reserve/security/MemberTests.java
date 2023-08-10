package org.reserve.security;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {
	@Setter(onMethod_ = {@Autowired})
	private PasswordEncoder pwencoder;
	@Setter(onMethod_ = {@Autowired})
	private DataSource ds;
	@Test
	public void testInsertMember() {
		String sql = "insert into member values(seq_mno.nextval, ?, ?, ?, ?, ?, ?, sysdate, '1')";
//		for(int i=1; i<=50; i++) {
			Connection con = null;
			PreparedStatement psmt = null;
			
			try {
				con = ds.getConnection();
				psmt = con.prepareStatement(sql);
//				//비밀번호는 암호화로 등록
				psmt.setString(2, pwencoder.encode("1234"));
//				if(i<=30) {
					psmt.setString(1, "green");
					psmt.setString(3, "김그린");
					psmt.setString(4, "01013771566");
					psmt.setString(5, "green@gmail.com");
					psmt.setString(6, "울산광역시 삼산동");
				psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if(psmt != null) {
					try {
						psmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
//		}
	}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into auth(mid, auth) values(?,?)";
//		for(int i=1; i<=50; i++) {
			Connection con = null;
			PreparedStatement psmt = null;
			try {
				con = ds.getConnection();
				psmt = con.prepareStatement(sql);
					psmt.setString(1, "green");
					psmt.setString(2, "ROLE_MEMBER");
				psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				if(psmt != null) {
					try {
						psmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
//		}
	}
}
