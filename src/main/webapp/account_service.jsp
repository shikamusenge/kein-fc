<%@include file="connection.jsp" %>
<%
    String userName = request.getParameter("usn");
    String password = request.getParameter("psw");
    String sql = "INSERT INTO users(u_Name,u_Password) values(?, ?)";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, userName);
    statement.setString(2, password);
    statement.executeUpdate();
    session.setAttribute("user",userName);
    response.sendRedirect("index.jsp");
%>
