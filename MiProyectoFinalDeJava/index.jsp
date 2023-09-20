<%-- 
    Document   : index
    Created on : 16-nov-2022, 8:03:37
    Author     : pedro
--%>

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

            switch (diaSemana) {

                case "MONDAY":
                    dia = "LUNES";
                    break;
                case "TUESDAY":
                    dia = "MARTES";
                    break;
                case "WEDNESDAY":
                    dia = "MIERCOLES";
                    break;
                case "THURSDAY":
                    dia = "JUEVES";
                    break;
                case "FRIDAY":
                    dia = "VIERNES";
                    break;
                case "SATURDAY":
                    dia = "SABADO";
                    break;
                case "SUNDAY":
                    dia = "DOMINGO";

            }
            switch (meses) {

                case "JANUARY":
                    mes = "ENERO";
                    break;
                case "FEBRUARY":
                    mes = "MARTES";
                    break;
                case "MARCH":
                    mes = "MARZO";
                    break;
                case "APRIL":
                    mes = "ABRIL";
                    break;
                case "MAY":
                    mes = "MAYO";
                    break;
                case "JUNE":
                    mes = "JUNIO";
                    break;
                case "JULY":
                    mes = "JULIO";
                    break;
                case "AUGUST":
                    mes = "AGOSTO";
                    break;
                case "SEPTEMBER":
                    mes = "SEPTIEMBRE";
                    break;
                case "OCTOBER":
                    mes = "OCTOBER";
                    break;
                case "NOVEMBER":
                    mes = "NOVIEMBRE";
                    break;
                case "DECEMBER":
                    mes = "DICIEMBRE";
                    break;

            }
        %>

    <center><h2>Dia de la semana y fecha en Cajas</h2></center><br><br>
    <center>
        <input type='text'  value='<%=dia%>' disabled />
        <input type='text'  value= '<%=diaNumerico%>' disabled />
        <input type='text' value='<%=mes%>' disabled />
        <input type ='text'  value='<%=anio%>' disabled />
    </center>


</body>
</html>
