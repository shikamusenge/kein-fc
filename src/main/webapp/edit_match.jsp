<%@include file="header.jsp" %>
<%@include file="connection.jsp" %>
<%
String id = request.getParameter("mtchid");
String sql2=" select * from Matches where Mt_id=?";
PreparedStatement stmt= conn.prepareStatement(sql2);
stmt.setString(1,id);
ResultSet rs2 = stmt.executeQuery();
while(rs2.next()){
%>
<main>
    <div id="main_container">
            <div>
            <form>
                <input type="search" name="search"><label>Search</label>
            </form>
            <hr>
        
            <form class="card" method="post">
                <input type="hidden" value='<%=id %>' name='Mt_id'>
        <div class="card-title"><h3>Add New Match</h3></div>
        <div id="card-body">
                <%
if(session.getAttribute("msg")!=null){
            %>
            <div class="worning-msg">
                <%=session.getAttribute("msg")%>
            </div>
            <%
                session.setAttribute("msg", null);
                }%>
            <div class="input-group">
                <div><label for="user">Date</label></div>
                <div><input type="text"
                            name="date" value='<%=rs2.getString("Date")%>'placeholder="Choose Matche Date"></div>
            </div>
            <div class="input-group">
                <div><label for="M_pg">PlayGround </label></div>
                <div><input type="text" name="pg" value='<%=rs2.getString("Play_Ground")%>'  placeholder="Enter Play ground">
            </div>
                <div><label for="user">Referee </label></div>
                <div>
                    <select name="ref_id">
                        <option value="" disabled> Select Referee</option>
                       <%
   String sql= "SELECT Ref_id,CONCAT_WS(' ',F_Name,L_Name) as Names FROM Referees";
  PreparedStatement statement = conn.prepareStatement(sql);
   ResultSet rs= statement.executeQuery();
    while(rs.next()){
    if(rs.getString("Ref_id")==rs2.getString("Ref_id"))
        out.print("<option value='"+rs.getString("Ref_id")+"' slected>"+rs.getString("Names")+"</option>");
        else
    out.print("<option value='"+rs.getString("Ref_id")+"'>"+rs.getString("Names")+"</option>");
    }
%>
                        
                        
                    </select>
                </div>
            </div> 
            <div class="input-group">  
                <div><label for="user">Adversary </label></div>
                <div>
                        <select  name="ad_id">
                        <option value="" disabled> Select Referee</option>
                       <%
   sql = "SELECT Ad_id,Name as Names FROM Adversaries";
   statement = conn.prepareStatement(sql);
   rs = statement.executeQuery();
    while(rs.next()){
                   if(rs.getString("Ad_id")==rs2.getString("Ad_id"))
                   out.print("<option value='"+rs.getString("Ad_id")+"' selected>"+rs.getString("Names")+"</option>");
                   else
                    out.print("<option value='"+rs.getString("Ad_id")+"'>"+rs.getString("Names")+"</option>");
    }
%>
                        
                        
                    </select>
                </div>
            </div>
            
            <div class="input-group">
                <div><input type="submit" name="edit_post" value="Save"></div>
            </div>
        </div> 
        <div class="card-footer">
        </div> 
    </form>
    
    </div>
<% }%>
    
</main>
<%
    if(request.getParameter("edit_post")!=null){
   String Mt_id=request.getParameter("Mt_id");
   int userId = Integer.parseInt(session.getAttribute("userId").toString());
   String playground = request.getParameter("pg");
   int ref_id = Integer.parseInt(request.getParameter("ref_id"));
   int ad_id = Integer.parseInt(request.getParameter("ad_id"));
   String date = request.getParameter("date");
    String sql = "UPDATE Matches set Date=?, Play_Ground=?, Ref_Id=?, Ad_id=?, user_id=? WHERE Mt_id=?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, date);
    statement.setString(2, playground);
    statement.setInt(3, ref_id);
    statement.setInt(4, ad_id);
    statement.setInt(5, userId);
    statement.setString(6, Mt_id);
    statement.executeUpdate();
    session.setAttribute("msg", "Match updated successfully!");
    response.sendRedirect("matches.jsp");
   }
%> 
<%@include  file="footer.jsp"%>