<%@include file="header.jsp" %>
<%@include file="connection.jsp" %>
<%
String id = request.getParameter("ref_id");
String sql2=" select * from Referees where Ref_id=?";
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
                <input type="hidden" name="ref_id" value='<%=id%>'>
        <div class="card-title"><h3>Add New Referee</h3> </div>
        <div id="card-body">
            <div class="input-group">
                <div><label for="user">First Name</label></div>
                <div><input type="Text" name="fname" placeholder="Enter First Name" value='<%=rs2.getString("F_Name")%>' required></div>
            </div>
            <div class="input-group">
                <div><label for="M_pg">Last Name</label></div>
                <div><input type="text" name="lname" placeholder="Enter Last Name" value='<%=rs2.getString("L_Name")%>' ></div>
            </div>
                 
            <div class="input-group">
                <div><label for="M_pg">Age</label></div>
                <div><input type="text" placeholder="Enter Age" required value='<%=rs2.getString("Age")%>'></div>
            </div>
             <div class="input-group">
                <div><label for="M_pg">Sex/Gender</label></div>
                <div><select name='sex' required>
                                <option value="" selected disabled>Select gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                    </select></div>
            </div>
            <div class="input-group">
                <div><label for="M_pg">Telephone</label></div>
                <div><input type="text" name="phone" placeholder="07xx xxx xxx" value='<%=rs2.getString("Telephone")%>'></div>
            </div>
            <div class="input-group">
                <div><input type="submit" name="edit_referee" value="submit"></div>
            </div>
        </div> 
        <div class="card-footer">
        </div> 
    </form>
    
    </div>
<%
    }
    if(request.getParameter("edit_referee")!=null){
    int ref_id = Integer.parseInt(request.getParameter("ref_id"));
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String age = request.getParameter("age");
    String sex = request.getParameter("sex");
    String phone = request.getParameter("phone");
    String sql = "update Referees Set F_Name=?, L_Name=?, Age=?, Sex=?, Telephone=? where Ref_id=?";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, fname);
    statement.setString(2, lname);
    statement.setString(3, age);
    statement.setString(4, sex);
    statement.setString(5, phone);
    statement.setInt(6, ref_id);
    if(statement.executeUpdate()==1){
    session.setAttribute("msg", "Referee with id= "+ref_id+"updated successfuly !");
    response.sendRedirect("referees.jsp");
}
else{


}
    }
%>
    
</main>
<%@include  file="footer.jsp"%>