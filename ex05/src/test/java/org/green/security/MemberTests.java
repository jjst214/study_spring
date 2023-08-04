package org.green.security;

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
		String sql = "insert into book values(seq_book.nextval, ?, ?, ?, ?, sysdate)";
		for(int i=1; i<=50; i++) {
			Connection con = null;
			PreparedStatement psmt = null;
			
			try {
				con = ds.getConnection();
				psmt = con.prepareStatement(sql);
//				//비밀번호는 암호화로 등록
//				psmt.setString(2, pwencoder.encode("pw"+i));
//				if(i<=30) {
//					psmt.setString(1, "user"+i);
//					psmt.setString(3, "일반사용자"+i);
//				}else if(i<=40) {
//					psmt.setString(1, "manager"+i);
//					psmt.setString(3, "운영자"+i);
//				}else {
//					psmt.setString(1, "admin"+i);
//					psmt.setString(3, "관리자"+i);
//				}
				psmt.setString(1, "테스트도서"+i);
				psmt.setString(2, i+"출판사");
				psmt.setString(3, "작가"+i);
				psmt.setString(4, "1000"+i);
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
		}
	}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into tbl_member_auth(userid, auth) values(?,?)";
		for(int i=1; i<=50; i++) {
			Connection con = null;
			PreparedStatement psmt = null;
			try {
				con = ds.getConnection();
				psmt = con.prepareStatement(sql);
				if(i<=30) {
					psmt.setString(1, "user"+i);
					psmt.setString(2, "ROLE_USER");
				}else if(i<=40) {
					psmt.setString(1, "manager"+i);
					psmt.setString(2, "ROLE_MEMBER");
				}else {
					psmt.setString(1, "admin"+i);
					psmt.setString(2, "ROLE_ADMIN");
				}
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
		}
	}
}
