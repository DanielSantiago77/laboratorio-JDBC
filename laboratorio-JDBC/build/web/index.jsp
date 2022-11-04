<%-- 
    Document   : index
    Created on : 4/11/2022, 4:22:04 p. m.
    Author     : DANIEL BARRANTES
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Lista de Usuarios </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>     
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container">
            <nav class="navbar bg-light">
                <div class="container-fluid">
                </div>
            </nav>
            <div class="row mt-2">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"> id </th>
                                <th scope="col"> Nombre </th>
                                <th scope="col"> Fecha de nacimiento </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3308/prueba?user=root&password=");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `persona`;");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                            </tr>

                            <%
                                }
                                } catch (Exception e) {
                                    out.print( " Error MySQL " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
