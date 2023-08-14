<%-- 
    Document   : header
    Created on : Aug 12, 2023, 10:25:28 PM
    Author     : shikamusenge
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("user")==null){
session.setAttribute("session_msg", "You Must login first");
response.sendRedirect("index.jsp?page=login");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard</title>
 <link rel="icon" href="imgs/logoball.jpg" type="imgs/icon">
     <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
<nav>
    <!--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-->
    <div id="container">
    <div id="menu-icon" class="d-none">
        <span class="mat">menu</span>
    </div>
    <div id="navbar-brand">
        Kein Fc
    </div>
    <div id="nav-link" class="d-flex">
        <div class="nav-link"><a href="dashboard.jsp">DashBoard</a></div>
        <div class="nav-link"><a href="matches.jsp">Matches</a></div>
        <div class="nav-link"><a href="referees.jsp">Referees</a></div>
        <div class="nav-link"><a href="adversaries.jsp">Adversaries</a></div>
        <div class="nav-link"><a href="logout.jsp">logout( <%=session.getAttribute("user")%> )</a></div>
    </div>
</div>
</nav>