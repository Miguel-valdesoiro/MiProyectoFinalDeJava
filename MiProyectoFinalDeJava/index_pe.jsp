<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Set"%>
<%@page import="java_14.Alumno"%>
<%@page import="java.util.Map"%>
<%@page import="java_14.OperacionesCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // para poder colocar la base de datos se define    |______|
    OperacionesCrud crud = new OperacionesCrud("colegio");
    Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();

    //vamos a ordenar las claves---> pregunta examen TreeMap
    TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);
    //recuperamos las claves del hashMap
    Set<String> claves = alumnos_tm.keySet();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>13.-Selección simple</title>
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
    <center> <h2>Busqueda un valor y mostrarlo con una lista (seleccion simple)</h2></center>
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
                <%
                    // una vez ya tenemos la clave lo vamos a meter en cboCodigo
                    for (String s : claves) {
                    
                %>
                <option value='<%=s%>' > <%=s%></option>  

                <%
                    }
                   
                %>

            </select><br><br>
            <input type ='submit' name ='cmdSeleccionar' value="SELECCIONAR" />
        </form>

        <%
           
         
            if (salida == true) {
                
                String ruta = request.getContextPath() + "/Ejercicio13/image/" + a.getFoto();

        %>  

        <input type ='text' value='<%=a.getCodigo()%>'  disabled/>
        <input type ='text' value='<%=a.getNombre()%>' disabled />
        <input type ='text' value='<%=a.getEdad()%>' disabled />
        <input type ='text' value='<%=a.getEstatura()%>' disabled/>
        <img class ='redondear' src='<%=ruta%>'  title ='<%=a.getNombre()%>' >

        <%
            }
        %>

    </center>

</body>
</html>
