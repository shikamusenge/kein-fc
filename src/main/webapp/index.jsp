<%-- 
    Document   : index.jsp
    Created on : Aug 12, 2023, 9:10:29 PM
    Author     : shikamusenge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kein Fc</title>
    <link rel="icon" href="imgs/logoball.jpg" type="imgs/icon">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav>
    <div id="container">
    <div id="menu-icon" class="d-none">
        <span class="mat">menu</span>
    </div>
    <div id="navbar-brand">
        Kein Fc
    </div>
    <div id="nav-link" class="d-flex">
        <link rel="icon" href="imgs/logoball" type="imgs/icon">
        <div class="na-link"><a href="index.html">Home</a></div>
        <div class="na-link"><a href="index.html">About</a></div>
        <div class="na-link"><a href="#" onclick="viewLoginForm()">login</a></div>
        <div class="na-link"><a href="#" onclick="viewSignupForm()">signup</a></div>
    </div>
</div>
</nav>
<main>
<div id="left">
    <p><a href="https://www.ferwafa.rw  target="_blank" rel="noopener noreferrer">FERWAFA</a></p>
    <p><a href="https://www.fifa.rw  target="_blank" rel="noopener noreferrer">FIFA</a></p>
    <p><a href="https://www.ferwafa.rw  target="_blank" rel="noopener noreferrer">FERWAFA</a></p>

</div>
<div id="center">
    <h3>Staff</h3>
    <div class="stafmember">
        <img src="./imgs/MY PASSPORT PHOTO.png" alt="" srcset="">
        <div class="name">Jeff MUHINYUZA</div>
        <div class="role">Presdent</div>
    </div>
    <div class="stafmember">
        <img src="./imgs/logoball.jpg" alt="" srcset="">
        <div class="name">Dreck GATO,</div>
        <div class="role">Secretary</div>
    </div>
    <div class="stafmember">
        <img src="./imgs/logoball.jpg" alt="" srcset="">
        <div class="name">Jeanne KAYITERA</div>
        <div class="role">Captain: Rico Pie</div>
    </div>
    <div class="stafmember">
        <img src="./imgs/logoball.jpg" alt="" srcset="">
        <div class="name">Monday Chrito</div>
        <div class="role">Accountant</div>
    </div>
</div>
<div id="right">
    <div class="martch">
        <img src="./imgs/arton52507-d7e6c.jpg" alt="" srcset="">
    <caption>KAINE FC Vs Gasabo Veterans at Nyamirambo Play ground on 1st  september 2022.</caption>
    </div>
</div>
</main>
<footer>
    <h3>copyRight &copy; Reserved IPRC NGOMA</h3>
</footer>
<div id="login-form">
    <div id="form-container">
    <form action="login.jsp" class="card">
        <div class="card-title"><h3>Login form</h3> <h3 class="close" onclick="closeCard()">&times</h3></div>
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
                <div><label for="user">Username</label></div>
                <div><input type="text" name="usn" placeholder="Enter username"></div>
            </div>
            <div class="input-group">
                <div><label for="user">Password</label></div>
                <div><input type="password" name="psw" placeholder="Enter your password"></div>
            </div>
            <div class="input-group">
                
                <div><input type="submit" name="psw" value="login"></div>
            </div>
        </div> 
        <div class="card-footer">
          <h1><a href="signup.html">Signup</a></h1>
        </div> 
    </form>
</div>
</div>
<div id="signup-form">
    <div id="form-container">
    <form action="account_service.jsp" class="card">
        <div class="card-title"><h3>Create Account</h3> <h3 class="close" onclick="closeCard()">&times</h3></div>
        <div id="card-body">
                        <% 
if(session.getAttribute("msg")!=null){
            %>
            <div class="worning-msg">
                <%=session.getAttribute("msg")%>
            </div>
            <% }%>
            <div class="input-group">
                <div><label for="user">Username</label></div>
                <div><input type="text" name="usn" placeholder="Enter username"></div>
            </div>
            <div class="input-group">
                <div><label for="user">New Password</label></div>
                <div><input type="password" name="psw" placeholder="Enter your New password"></div>
            </div>
            <div class="input-group">
                <div><label for="user">Confirm Password</label></div>
                <div><input type="password" name="psw" placeholder="Re Enter your password"></div>
            </div>
            <div class="input-group">
                <div><input type="submit" name="psw" value="login"></div>
            </div>
        </div> 
        <div class="card-footer">
          <h1><a href="signup.html">Signup</a></h1>
        </div> 
    </form>
</div>
                <script>
function viewSignupForm(){
    const formDiv = document.getElementById(`signup-form`);
    formDiv.style.display="block";
}
function viewLoginForm(){
    const formDiv = document.getElementById(`login-form`);
    formDiv.style.display="block";
}
function closeCard(){
    const formDiv = document.getElementById(`signup-form`);
    const loginDiv = document.getElementById(`login-form`);
    formDiv.style.display="none";
    loginDiv.style.display="none";
}
    </script>
                <% 
if(request.getParameter("page")=="login"){
                %>
                <script>
                    alret(request.getParameter("page"));
                    </script>
                <% } %>
</body>
</html>