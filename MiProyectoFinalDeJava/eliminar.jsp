<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java_14.OperacionesCrud"%>
<%@page import="java_14.Alumno"%>
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
        <title>15</title>
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
    <center><h2> Eliminar un alumno</h2></center>

    <%
        boolean salida = false;
        Alumno a = null;
        String codigo = "";
        String mensaje = "";
        String oculto = "";
        if (request.getParameter("cmdBuscar") != null) {
            codigo = request.getParameter("cboCodigo");
            a = alumnos_hm.get(codigo);
            salida = true;
        }
    %>

    <%
        if (request.getParameter("cmdEliminar") != null) {

            oculto = request.getParameter("txtOculto");
            if (crud.eliminarAlumno(oculto)) {
                mensaje = "ELEMENTO BORRADO";
                alumnos_hm = crud.getHashMapAlumno();// se pide nuevamente los valores al HashMap
                alumnos_tm = new TreeMap<>(alumnos_hm);
                claves = alumnos_tm.keySet();

            } else {
                mensaje = " ERROR: ELIMINAR";
            }

        }

    %>



    <center>
        <form action=''>
            <select name="cboCodigo" size="1">
                <%                    for (String s : claves) {
                        if (s.equalsIgnoreCase(codigo)) {


                %>
                <option selected value='<%=s%>'><%=s%></option>  
                <%
                } else {
                %>
                <option  value='<%=s%>'><%=s%></option> 
                <%
                        }
                    }
                %>
            </select>
            <input type='hidden'  name='txtOculto' value='<%=codigo%>' /><!-- cajita oculta -->
            <input type='submit' name='cmdBuscar' value='BUSCAR' />
            <input type='submit' name='cmdEliminar' value='ELIMINAR' />
            <input type='text' name='txtMensaje' value='<%=mensaje%>' placeholder="MENSAJE" />
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

