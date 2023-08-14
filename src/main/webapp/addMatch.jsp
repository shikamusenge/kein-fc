<%@include file="connection.jsp" %>
<%
    int userId = Integer.parseInt(session.getAttribute("userId").toString());
    String playground = request.getParameter("pg");
    int ref_id = Integer.parseInt(request.getParameter("ref_id"));
    int ad_id = Integer.parseInt(request.getParameter("ad_id"));
    String date = request.getParameter("date");
    String sql = "INSERT INTO Matches values(Null,?, ?, ?, ?, ?)";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, date);
    statement.setString(2, playground);
    statement.setInt(3, ref_id);
    statement.setInt(4, ad_id);
    statement.setInt(5, userId);
    statement.executeUpdate();
    session.setAttribute("msg", "Match added !");
    response.sendRedirect("add_match.jsp");
%>
