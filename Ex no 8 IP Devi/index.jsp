<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<html>
    <head>
        <title>JDBC Program</title>
    </head>
    <body>
        <%
            int number_Of_Employees = 0;
            double total = 0.0;
            double avg_Salary_Of_Employees = 0.0;
            double highest_Salary_Of_Employees = 0.0;
            String query = "SELECT * FROM emlpoyees";
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/internetprogramming","root","Dinesh@2024");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next()){
                    number_Of_Employees++;
                    double max = rs.getDouble("salary");
                    total += max;
                    if(highest_Salary_Of_Employees < max)
                        highest_Salary_Of_Employees = max;
                }
                avg_Salary_Of_Employees = total / number_Of_Employees;
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
        %>
        <table border = 1>
            <thead>
                <th style = "font-size : 30px;">Number_Of_Employees</th>
                <th style = "font-size : 30px;">Avg_Salary_Of_Employees</th>
                <th style = "font-size : 30px;">Highest_Salary_Of_Employees</th>
            </thead>
            <tbody>
                <td style = "font-size : 25px;"><%= number_Of_Employees %></td>
                <td style = "font-size : 25px;"><%= avg_Salary_Of_Employees %></td>
                <td style = "font-size : 25px;"><%= highest_Salary_Of_Employees %></td>
            </tbody>
        </table>
    </body>
</html>
