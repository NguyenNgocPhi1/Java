/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Contact;
import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PC
 */
public class UserDAO {
    public User checkLogin(String username, String password){
        User u = null;
        try{
        Connection conn = DbContext.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("select * from users where username=? and password=?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rst = pstmt.executeQuery();
        while(rst.next()){
            u = new User(rst.getString("username")
                    ,rst.getString("password")
                    ,rst.getString("email")
                    ,rst.getBoolean("isAdmin"));  
        }
        conn.close();
        }catch (SQLException ex){
            System.out.println("Loi SQL: " + ex.toString());
        }
        return u;
    }
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        User u = dao.checkLogin("admin", "12345");
        if(u != null){
            System.out.println("Of - Admin" + u.isIsadmin());
        }
        else{
            System.out.println("Loi");
        }
    }
}
