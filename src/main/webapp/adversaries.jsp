<%@include file="header.jsp" %>
<%@include file="connection.jsp" %>
<main>
    <div id="main_container">
        <div>
            <form>
                <input type="search" name="search"><label>Search</label>
            </form>

<%
if(session.getAttribute("msg")!=null){
            %>
            <div class="worning-msg">
                <%=session.getAttribute("msg")%>
            </div>
            <%
                session.setAttribute("msg", null);
                }%>
            <hr>
                        <h1>Referees</h1>
                        <table border='1' cellspacing='0'>
                                <tr>
                                    <th>#</th>
                                     <th>Names</th>
                                     <th colspan="2">Modify</th>
                                </tr>
<%
    String sql = "SELECT * FROM  Adversaries";
    PreparedStatement statement = conn.prepareStatement(sql);
    ResultSet rs = statement.executeQuery();
    while(rs.next()){
                    out.print("<tr><td>"+rs.getString("Ad_id")+"</td>");
                    out.print("<td>"+rs.getString("Name")+"</td>");
                    out.print("<td><a href='edit_adversary.jsp?ad_id="+rs.getString("Ad_id")+"'>Edit</a></td>");
                    out.print("<td><a href='delete.jsp?ad_id="+rs.getString("Ad_id")+"'>Delete</a></td></tr>");
    }
//    if(!rs.next()){
//              out.print("<tr><td colspan(5)> no data added <button class='btn'>add new Match</td></tr>");
//            }
%>
                        </table>
        </div></div>    
</main>

<%@include  file="footer.jsp"%>