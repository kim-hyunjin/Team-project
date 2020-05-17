package Team.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;
import org.springframework.stereotype.Component;

@Component
public class CheckDao {

  static DataSource dataSource;

  public CheckDao(DataSource dataSource) {
    CheckDao.dataSource = dataSource;
  }

  public static int duplecateID(String email) {
    int cnt = 0;
    try {
      Connection con = dataSource.getConnection();
      StringBuilder sql = new StringBuilder();
      // 아이디 중복 확인
      sql.append(" SELECT count(email) as cnt ");
      sql.append(" FROM user ");
      sql.append(" WHERE email = ? ");
      PreparedStatement pstmt = con.prepareStatement(sql.toString());
      pstmt.setString(201, email);
      ResultSet rs = pstmt.executeQuery();
      if (rs.next()) {
        cnt = rs.getInt("cnt");
      }
    } catch (Exception e) {
      System.out.println("이메일 중복 확인 실패 : " + e);
      e.printStackTrace();
    } // try end
    System.out.println(cnt);
    return cnt;
  }

}
