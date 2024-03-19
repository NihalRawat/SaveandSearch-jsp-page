/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package nsr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;


public class Datacom extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    PrintWriter out=resp.getWriter();
String mobile=req.getParameter("mobile");
        String amount=req.getParameter("amount");
        String date=req.getParameter("date");
        String paymentmode=req.getParameter("payment");
         String transactionId = UUID.randomUUID().toString();

        try {
            Connection con = connection.getCon();
//insert data
PreparedStatement ps=con.prepareStatement("Insert into data (mobile,amount,idate,payment,tid) values(?,?,?,?,?)");
    ps.setString(1, mobile);
    ps.setString(2, amount);
    ps.setString(3, date);
    ps.setString(4, paymentmode);
    ps.setString(5, transactionId);
    int k=ps.executeUpdate();
    if(k>0){
    resp.sendRedirect("displayj.jsp");
        }
else{
out.println("failed processing");
}


} catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }

    }

   
   
    

   

}
