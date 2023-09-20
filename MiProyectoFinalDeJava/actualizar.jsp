<%-- 
    Document   : index
    Created on : 22-nov-2022, 16:48:55
    Author     : pedro
--%>

<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java_14.Alumno"%>
<%@page import="java_14.OperacionesCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>16</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
                width: 100px;
            }
            .redondear {
                width: 40px;
                height: 40px;
                border: 2px solid black;
                border-radius: 60px;
            }
        </style>
    </head>
    <body>
        <%
            OperacionesCrud crud = new OperacionesCrud("colegio");

            Map<String, Alumno> alumnos_hm = crud.getHashMapAlumno();

            TreeMap<String, Alumno> alumnos_tm = new TreeMap<>(alumnos_hm);

            Set<String> claves = alumnos_tm.keySet();
        %>     
        <h1>16.- Actualizar un alumno.</h1>

        <%
            boolean salida = false;
            String mensaje = "";
            String codigo = "";
            String nombre="";
            String edad ="";
            String estatura="";
            String foto="";            
            Alumno a = null;

            if (request.getParameter("cmdBuscar") != null) {
                codigo = request.getParameter("cboCodigo");
                a = alumnos_hm.get(codigo);
                salida = true;
            }
            if (request.getParameter("cmdActualizar") != null) {
               codigo = request.getParameter("txtCodigo");
               nombre=request.getParameter("txtNombre");
               edad =request.getParameter("txtEdad");
               estatura =request.getParameter("txtEstatura");
               foto =request.getParameter("txtFoto");
               
              
               Alumno alumno= new Alumno(codigo,nombre,Integer.parseInt(edad),Double.parseDouble(estatura),foto);
               
               if(crud.actualizarAlumno(alumno)){
                mensaje="OK Actualizado Alumno";
            }else{
                mensaje="ERROR: Actualizar";
            }
            }

        %>
    <center>

        <form action="">

            <select  name='cboCodigo' size='1'/>
            <%                for (String s : claves) {
            %>
            <option value='<%=s%>'><%=s%> </option>
            <%
                }
            %>
            </select>
            <input type='submit' name='cmdBuscar' value='BUSCAR'/>
            <input type='submit' name='cmdActualizar' valur='ACTUALIZAR'/>
            <input type='text' style='width:180px' name='txtMensaje' value='<%=mensaje%>' placeholder="MENSAJE"/><br><br>
 <%
                    if (salida) {
                        codigo=a.getCodigo();
                        nombre= a.getNombre();
                        edad= a.getEdad()+"";
                        estatura = a.getEstatura()+"";
                        foto = a.getFoto();
                       String ruta= request.getContextPath()+"/Ejercicio16/image/"+a.getFoto();
        
    %>

   

        <input type="text" name='txtCodigo' value='<%=codigo%>' readonly />
         <input type="text" name="txtNombre" value='<%=nombre%>'/>
            <input type="number"  name ='txtEdad' min='1' max='120' step='1'  value ='<%=edad%>' /><!-- Podemos poner un rango de edad -->
            <input type="number" name='txtEstatura' style = 'width : 120px'  min='1' max='1.90'  step='0.01'  value='<%=estatura%>' />
            <input type="text" name="txtFoto" value='<%=foto%>' placeholder='Foto' />
            <img class='redondear' src='<%=ruta%>'/>
        <%
            }
        %>


    </center>
 </form>
</body>
</html>
