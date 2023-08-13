<%@include file="header.jsp" %>
<main>
    <div id="main_container">
        <div>
            <form>
                <input type="search" name="search"><label>Search</label>
            </form>
<div> <a href="add_match.jsp" class="btn">Addnew Match</a> </div>

            <hr>
                        <h1>Matches</h1>
                        <table border='1' cellspacing='0'>
                                <tr>
                                    <th>#</th>
                                     <th>Date</th>
                                     <th>Playground</th>
                                     <th>Referee</th>
                                     <th>Adversary</th>
                                     <th colspan="2">Modify</th>
                                </tr>
<%@include file="connection.jsp" %>
<%
    String sql = "SELECT Date, Mt_id,Play_Ground,CONCAT_WS(' ',F_Name,L_Name) as Referee,Name as Adversary FROM Matches INNER JOIN Referees INNER JOIN Adversaries WHERE Matches.Ad_id=Adversaries.Ad_id AND  Matches.Ref_id=Referees.Ref_id";
    PreparedStatement statement = conn.prepareStatement(sql);
    ResultSet rs = statement.executeQuery();
    while(rs.next()){
                    out.print("<tr><td>"+rs.getString("Mt_id")+"</td>");
                    out.print("<td>"+rs.getString("Date")+"</td>");
                    out.print("<td>"+rs.getString("Play_Ground")+"</td>");
                    out.print("<td>"+rs.getString("Referee")+"</td>");
                    out.print("<td>"+rs.getString("Adversary")+"</td>");
                    out.print("<td><a href='editmatch.jsp?mtchid="+rs.getString("Mt_id")+"'>Edit</a></td>");
                    out.print("<td><a href='editmatch.jsp?mtchid="+rs.getString("Mt_id")+"'>Delete</a></td></tr>");
    }
//    if(!rs.next()){
//              out.print("<tr><td colspan(5)> no data added <button class='btn'>add new Match</td></tr>");
//            }
%>
                        </table>
        </div></div>    
</main>

<%@include  file="footer.jsp"%>