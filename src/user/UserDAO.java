package user;

import util.DatabaseUtil;

import javax.xml.crypto.Data;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public int login(String userId, String userPassword) {
        String SQL = "SELECT userPassword FROM USER WHERE userId= ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
            try{
                conn= DatabaseUtil.getConnection();
                pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, userId);
                rs= pstmt.executeQuery();
                if(rs.next()){
                    if(rs.getString(1).equals(userPassword)){
                        return 1;
                    }
                    else {
                        return 0; // 비밀번호 틀림
                    }
                }
                return -1;
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
            return -2;
        }
    public int join(UserDTO user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, false)";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        try{
            conn= DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserId());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserEmail());
            pstmt.setString(4, user.getUserEmailHash());
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

    public boolean getUserEmailChecked(String userId) {
        String SQL = "INSERT userEmailChecked From USER WHERE userId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn= DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            rs= pstmt.executeQuery();
            if(rs.next()){
                return rs.getBoolean(1);
            }
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
        return false;
    }

    public String getUserEmail(String userId){
        String SQL = "INSERT userEmail From USER WHERE userId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn= DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            rs= pstmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
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
        return null;
    }

    public boolean setUserEmailChecked(String userId) {
        String SQL = "UPDATE USER SET userEmailChecked = true WHERE userId = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn= DatabaseUtil.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userId);
            pstmt.executeUpdate();
            return true;
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
        return false;
    }
}
