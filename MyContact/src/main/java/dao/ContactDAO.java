/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author KHOACNTT
 */
public class ContactDAO {
    
    public ArrayList<Contact> readAll()
    {
        ArrayList<Contact> kq = new ArrayList<>();
        try{
        Connection conn = DbContext.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("select * from contact");
        ResultSet rst = pstmt.executeQuery();
        while(rst.next()){
            kq.add(new Contact(rst.getInt("id"),rst.getString("name"),rst.getString("email"),rst.getString("phone")));  
        }
        conn.close();
        }catch (SQLException ex){
            System.out.println("Loi SQL: " + ex.toString());
        }
        return kq;        
    }
    public ArrayList<Contact> search(String name){
        ArrayList<Contact> kq = new ArrayList<>();
        try {
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("select * from contact where name like ?");
            pstmt.setString(1,"%" + name + "%");
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                kq.add(new Contact(rst.getInt("id"),rst.getString("name"),rst.getString("email"),rst.getString("phone")));
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL: " + ex.toString());
        }
        return kq;
    }
    public Contact findById (int id){
        Contact kq =null;
        try {
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("select * from contact where id=?");
            pstmt.setInt(1, id);
            ResultSet rst = pstmt.executeQuery();
            if (rst.next()) {
                kq = new Contact(rst.getInt("id"),rst.getString("name"),rst.getString("email"),rst.getString("phone"));
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL: " + ex.toString());
        }
        return kq;
    }
    public int Insert(Contact x)
    {
        int kq =0;
        
        try {
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("Insert into contact (name,email,phone) values (?,?,?)");
            pstmt.setString(1, x.getName());
            pstmt.setString(2, x.getEmail());
            pstmt.setString(3, x.getPhone());
            kq = pstmt.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL: " + ex.toString());
        }
        return kq;
    }
    
    public int update(Contact x)
    {
        int kq =0;
        
        try {
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("update contact set name=?,email=?,phone=? where id=?");
            pstmt.setString(1, x.getName());
            pstmt.setString(2, x.getEmail());
            pstmt.setString(3, x.getPhone());
            pstmt.setInt(4, x.getId());
            kq = pstmt.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL: " + ex.toString());
        }
        return kq;
    }
    
    public int delete(int id)
    {
        int kq =0;
        
        try {
            Connection conn = DbContext.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("delete from contact where id=?");
            pstmt.setInt(1, id);
            kq = pstmt.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Loi SQL: " + ex.toString());
        }
        return kq;
    }
    
}
