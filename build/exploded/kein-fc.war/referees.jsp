<%@include file="header.jsp" %>
<%@include file="connection.jsp" %>
<main>
    <div id="main_container">
        <div>
            <form>
                <input type="search" name="search"><label>Search</label>
            </form>
<div> <a href="add_referee.jsp" class="btn">Addnew Referee</a> </div>
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
                                     <th>First Name</th>
                                     <th>Last Name</th>
                                     <th>Age</th>
                                     <th>Sex</th>
                                     <th colspan="2">Modify</th>
                                </tr>
<%
    String sql = "SELECT * FROM  Referees";
    PreparedStatement statement = conn.prepareStatement(sql);
    ResultSet rs = statement.executeQuery();
    while(rs.next()){
                    out.print("<tr><td>"+rs.getString("Ref_id")+"</td>");
                    out.print("<td>"+rs.getString("F_Name")+"</td>");
                    out.print("<td>"+rs.getString("L_Name")+"</td>");
                    out.print("<td>"+rs.getString("age")+"</td>");
                    out.print("<td>"+rs.getString("sex")+"</td>");
                    out.print("<td><a href='edit_referee.jsp?ref_id="+rs.getString("Ref_id")+"'>Edit</a></td>");
                    out.print("<td><a href='delete.jsp?ref_id="+rs.getString("Ref_id")+"'>Delete</a></td></tr>");
    }
//    if(!rs.next()){
//              out.print("<tr><td colspan(5)> no data added <button class='btn'>add new Match</td></tr>");
//            }
%>
                        </table>
        </div></div>    
</main>

<%@include  file="footer.jsp"%>