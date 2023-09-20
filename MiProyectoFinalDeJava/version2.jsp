<%-- 
    Document   : index
    Created on : 16-nov-2022, 8:03:37
    Author     : pedro
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.time.Year"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOCALDATE</title>
        <style>
            input[type=text] {
                text-align:center;
                border-radius: 5px;
                border: 2px solid #39c;
            }

        </style>
    </head>
    <body>
        <%
            String dia = "";
            String mes = "";
            LocalDate localDate = LocalDate.now();
            String diaSemana = localDate.getDayOfWeek() + "";
            String diaNumerico = localDate.getDayOfMonth() + "";
            String meses = localDate.getMonth() + "";
            int anio = localDate.getYear();

            Map<String, String> dia_sh = new HashMap<>();
            dia_sh.put("MONDAY", "LUNES");
            dia_sh.put("TUESDAY", "MARTES");
            dia_sh.put("WEDNESDAY", "MIERCOLES");
            dia_sh.put("THURSDAY", "JUEVES");
            dia_sh.put("FRIDAY", "VIERNES");
            dia_sh.put("SATURDAY", "SABADO");
            dia_sh.put("SUNDAY", "SUNDAY");

            dia = dia_sh.get(diaSemana);
            
            Map<String, String> mes_sh = new HashMap<>();
            mes_sh.put("JANUARY","ENERO");
            mes_sh.put("FEBRUARY","FEBRERO");
            mes_sh.put("MARCH","MARZO");
            mes_sh.put("APRIL","ABRIL");
            mes_sh.put("MAY","MAYO");
            mes_sh.put("JUNE","JUNIO");
            mes_sh.put("JULY","JULIO");
            mes_sh.put("AUGUST","AGOSTO");
            mes_sh.put("SEPTEMBER","SEPTIEMBRE");
            mes_sh.put("OCTOBER","OCTUBRE");
            mes_sh.put("NOVEMBER","NOVIEMBRE");
            mes_sh.put("DECEMBER","DICIEMBRE");
            
            mes = mes_sh.get(meses);
            

        %>

    <center><h2>Dia de la semana y fecha en Cajas</h2></center><br><br>
    <center>
        <input type='text' name='txtSemana' value='<%=dia%>' disabled />
        <input type='text' name='txtDia' value= '<%=diaNumerico%>' disabled />
        <input type='text' name='txtMes' value='<%=mes%>' disabled />
        <input type ='text' name ='txtAnio'  value='<%=anio%>' disabled />
    </center>


</body>
</html>
