<%-- 
    Document   : login.jsp
    Created on : Aug 12, 2023, 9:00:35 PM
    Author     : shikamusenge
--%>
<%@include file="connection.jsp" %>
<%
    String userName = request.getParameter("usn");
    String password = request.getParameter("psw");
    String sql = "SELECT * FROM users WHERE u_Name = ? AND u_password = ?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, userName);
    statement.setString(2, password);
    ResultSet resultSet = statement.executeQuery();
    if(resultSet.next()) {
                session.setAttribute("user",userName);
                session.setAttribute("userId",resultSet.getString("user_id"));
              response.sendRedirect("dashboard.jsp");
    }else{
              session.setAttribute("msg","Invalid username or Password");
              response.sendRedirect("index.jsp");
            }
%>