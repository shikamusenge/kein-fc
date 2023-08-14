<%@include file="header.jsp" %>
<%@include file="connection.jsp" %>
<main>
    <div id="main_container">
            <div>
            <form>
                <input type="search" name="search"><label>Search</label>
            </form>
            <hr>
        
            <form action="addMatch.jsp" class="card" method="post">
        <div class="card-title"><h3>Add New Match</h3> <h3 class="close" onclick="closeCard()">&times</h3></div>
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
                <div><input type="Date" name="date" placeholder="Choose Matche Date"></div>
            </div>
            <div class="input-group">
                <div><label for="M_pg">PlayGround </label></div>
                <div><input type="text" name="pg" placeholder="Select play ground"></div>
            </div>
                 <div class="input-group">
                <div><label for="user">Referee </label></div>
                <div>
                    <select name="ref_id">
                        <option value="" disabled selected > Select Referee</option>
                       <%
   String sql = "SELECT Ref_id,CONCAT_WS(' ',F_Name,L_Name) as Names FROM Referees";
  PreparedStatement statement = conn.prepareStatement(sql);
   ResultSet rs = statement.executeQuery();
    while(rs.next()){
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
                        <option value="" disabled selected> Select Referee</option>
                       <%
   sql = "SELECT Ad_id,Name as Names FROM Adversaries";
   statement = conn.prepareStatement(sql);
   rs = statement.executeQuery();
    while(rs.next()){
                    out.print("<option value='"+rs.getString("Ad_id")+"'>"+rs.getString("Names")+"</option>");
    }
%>
                        
                        
                    </select>
                </div>
            </div>
            
            <div class="input-group">
                <div><input type="submit" name="add_match" value="Save"></div>
            </div>
        </div> 
        <div class="card-footer">
        </div> 
    </form>
    
    </div>

    
</main>
<%@include  file="footer.jsp"%>