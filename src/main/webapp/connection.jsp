<%@page import="java.sql.*"%>
<%
    String DB_URL = "jdbc:mysql://localhost:3306/fc_games";
    String USER = "root"; 
    String PASS = "123";
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
    %>
