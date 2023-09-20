<%-- 
    Document   : indexs
    Created on : 18-nov-2022, 9:07:41
    Author     : pedro
--%>

<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java_14.Alumno"%>
<%@page import="java_14.OperacionesCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    OperacionesCrud crud = new OperacionesCrud("colegio");

    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();

    TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

    Set<String> claves = alumnos_tm.keySet();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>14</title>
         <style>
        .redondear {
        width: 40px;
        height: 40px;
        border: 2px solid black;
        border-radius: 80px;
        }
        </style>
 
    </head>
    <body>
        <h1>14. Buscar un alumno y mostrarlo (Lista selección simple)</h1>

        <%
            boolean salida = false;
            Alumno a = null;
            if (request.getParameter("cmdSeleccionar") != null) {
                String codigo = request.getParameter("cboCodigo");
                a = alumnos_hm.get(codigo);
                salida = true;
            }
        %>




    <center>
        <form action=''>
            <select name="cboCodigo" size="1">
                <%                    for (String s : claves) {
                %>
                <option value='<%=s%>'><%=s%></option>  
                <%
                    }
                %>
            </select><br><br>
            <input type='submit' name='cmdSeleccionar' value='SELECCIONAR' />
        </form>


        <%
            if (salida == true) {
                String ruta = request.getContextPath() + "/Ejercicio13/image/" + a.getFoto();

        %>       

        <center>
            <br><br>
            <img class='redondear' src='<%=ruta%>' title='<%=a.getNombre()%>'><br><br>

            <input type='text' value='<%=a.getCodigo()%>' disabled />
            <input type='text' value='<%=a.getNombre()%>' disabled />
            <input type='text' value='<%=a.getEdad()%>' disabled />
            <input type='text' value='<%=a.getEstatura()%>' disabled />

        </center>

        <%
            }
        %>






    </center>







</body>
</html>
