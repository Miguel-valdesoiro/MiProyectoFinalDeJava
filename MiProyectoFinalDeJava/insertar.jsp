<%-- 
    Document   : Ejercicio14
    Created on : 21-nov-2022, 16:23:35
    Author     : pedro
--%>

<%@page import="java_14.OperacionesCrud"%>
<%@page import="java_14.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>14</title>
    </head>
    <body>
    <center> <h2>Insertar un alumno.</h2></center>

    <%
        OperacionesCrud crud = new OperacionesCrud("colegio");

        String codigo = crud.getCodigo();
        String nombre = "";
        String edad = "";
        String estatura = "";
        String foto = "";
        String mensaje = "";

        if (request.getParameter("cmdInsertar") != null) {
            codigo = request.getParameter("txtCodigo");
            nombre = request.getParameter("txtNombre");
            edad = request.getParameter("txtEdad");
            estatura = request.getParameter("txtEstatura");
            foto = request.getParameter("txtFoto");

            Alumno alumno = new Alumno(codigo, nombre, Integer.parseInt(edad), Double.parseDouble(estatura), foto);
            //llamamos al metodoCrud de insertar
            // me dara una señal de si se ha podido hacer o hay un error
            if (crud.insertarAlumno(alumno)) {
                    mensaje ="REGISTRO INSERTADO";
            } else {
                    mensaje="ERROR: INSERTAR";
            }

        }

    %>

    <center>
        <form action="">

            <input type="text" style='font-weight: bold;' name="txtCodigo" value='<%=codigo%>' placeholder='Código' readonly/>
            <input type="text" name="txtNombre" value='<%=nombre%>' placeholder='Nombre'/>
            <input type="number"  name ='txtEdad' min='1' max='120' step='1'  value ='<%=edad%>' placeholder ='Edad'/><!-- Podemos poner un rango de edad -->
            <input type="number" name='txtEstatura' style = 'width : 120px'  min='1' max='1.90'  step='0.01'  value='<%=estatura%>' placeholder='Estatura' />
            <input type="text" name="txtFoto" value='<%=foto%>' placeholder='Foto' />

            <input type='submit' name='cmdInsertar' value='INSERTAR' />
            <input type='submit' name='cmdNuevo' value='NUEVO' /><br><br>
            <input type='text' name='txtMensaje' value='<%=mensaje%>' placeholder='MENSAJE' disabled/>
        </form>        
    </center>





</body>
</html>
