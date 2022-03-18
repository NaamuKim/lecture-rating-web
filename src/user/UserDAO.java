package user;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
    public int join(String userId, String userPassword) {
        String SQL="INSERT INTO USER VALUES (?, ?)";
        try{
            Connection conn = DatabaseUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.setString(2, userPassword);
            return pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }
}
