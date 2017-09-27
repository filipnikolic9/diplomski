<%-- 
    Document   : pocetnOsiguranoLice
    Created on : Sep 24, 2017, 10:04:35 PM
    Author     : nemanjanikolic
--%>

<%@page import="model.Osiguranolice"%>
<%@page import="model.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/loginKlinika.css"/>
        <script text="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <title>Doktor</title>
    </head>
    <body>
         <table class="form-container" style="float: right; width: 100%; margin: 0px; margin-bottom: 100px" >
            <tr><td>Lekar: Marko Simeonovic <img style="float: right; width: 20px;height: 20px;" src="../css/img/logout.png"></td></tr>
        </table>
        <table class="form-container" style="margin-top:  100px;  width: 50%;"> 
            <tr>
            <form name="form1" method="GET" action ="../action/izborTermina">
                <td><a href="#" class="submit-button" onclick="izborTerminaForm()">Kreiranje termina</a></td>
            </form>
            <form name="form2" method="GET" action ="../action/podnosenjeZahteva">
                <input type="hidden" name="idOl" value="">
                <td><a id="zahtev" class="submit-button" href="#" onclick="podnosenjeZahtevaForm()">Prihvatanje zahteva</td>
            </form>
        </tr>
    </table>
</body>
<script>
    function izborTerminaForm() {
        document.form1.submit();
    }

    function podnosenjeZahtevaForm() {
        document.form2.submit();
    }
</script>
</html>
