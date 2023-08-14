<%@include file="header.jsp" %>
<%@include file="connection.jsp" %>
<main>
    <div id="main_container">
            <div>
            <form>
                <input type="search" name="search"><label>Search</label>
            </form>
            <hr>
        
            <form class="card" method="post">
        <div class="card-title"><h3>Add New Referee</h3> </div>
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
                <div><label for="user">First Name</label></div>
                <div><input type="Text" name="fname" placeholder="Enter First Name" required></div>
            </div>
            <div class="input-group">
                <div><label for="M_pg">Last Name</label></div>
                <div><input type="text" name="lname" placeholder="Enter Last Name"></div>
            </div>
                 
            <div class="input-group">
                <div><label for="M_pg">Age</label></div>
                <div><input type="number" name="age" placeholder="Enter Age" min="13" max="100" required=""></div>
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
                <div><input type="text" name="phone" placeholder="07xx xxx xxx"></div>
            </div>
            <div class="input-group">
                <div><input type="submit" name="add_referee" value="submit"></div>
            </div>
        </div> 
        <div class="card-footer">
        </div> 
    </form>
    
    </div>
<%
    if(request.getParameter("add_referee")!=null){
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String age = request.getParameter("age");
    String sex = request.getParameter("sex");
    String phone = request.getParameter("phone");
    String sql = "INSERT INTO Referees values(Null,?, ?, ?, ?, ?)";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, fname);
    statement.setString(2, lname);
    statement.setString(3, age);
    statement.setString(4, sex);
    statement.setString(5, phone);
    statement.executeUpdate();
    session.setAttribute("msg", "Referee added !");
    response.sendRedirect("add_referee.jsp");
    }
%>
    
</main>
<%@include  file="footer.jsp"%>