package likey;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeyDAO {

    public int like(String userId, String evaluationId, String userIp){
        String SQL = "INSERT INTO LIKEY VALUES (?, ?, ?)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try{
            conn= DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.setString(2, evaluationId);
            pstmt.setString(3, userIp);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try{
                if(conn !=null) conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            try{
                if(pstmt !=null) pstmt.close();
            }catch (Exception e){
                e.printStackTrace();
            }
            try{
                if(rs !=null) rs.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return -1;
    }
}
