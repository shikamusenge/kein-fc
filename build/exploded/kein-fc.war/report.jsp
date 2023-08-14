<%@include file="header.jsp" %>

<main>
    <div id="main_container">
 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h1 {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin: 0;
        }
        
        .container {
            width: 400px;
            margin: 30px auto;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        
        label {
            display: block;
            margin-bottom: 5px;
        }
        
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        button[type="submit"] {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            float: right;
        }
        
        button[type="submit"]:hover {
            background-color: #555;
        }
    </style>
    <h1>Generate Report</h1>
    
    <div class="container">
        <form action="get_report.jsp" method="post" target="_blank">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" required>
            
            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" required>
            
            <button type="submit">Generate Report</button>
        </form>
    </div>

    </div>
</main>

<%@include  file="footer.jsp"%>