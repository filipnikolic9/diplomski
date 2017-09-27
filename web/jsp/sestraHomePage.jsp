<%-- 
    Document   : pocetnOsiguranoLice
    Created on : Sep 24, 2017, 10:04:35 PM
    Author     : nemanjanikolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/loginKlinika.css"/>
        <script text="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <title>Sestra</title>
    </head>
    <body>
        <table class="form-container" style="float: right; width: 100%; margin: 0px; margin-bottom: 100px" >
            <tr><td>Sestra: Ivana Ivanovic<img style="float: right; width: 20px;height: 20px;" src="../css/img/logout.png"></td></tr>
        </table>
       <form name="klinika" method="post" action ="../action">
        <input type="hidden" name="action" value="">
        <input type="hidden" name="osiguranoLiceID" value="">    
        <table class="form-container" style=" width: 40%;">
                <tr>
                    <td><a href="#" class="submit-button" onclick="izborLekaraForm()">Promena lekara</a></td>
                    <td id="pregledSestra"><a class="submit-button" href="#" onclick="izborTermina()">Izbor termina</td>
                </tr>
            </table>
       </form>
    </body>
<script>
    function izborLekaraForm() {
       document.klinika.action.values = "../action/izborLekaraForm";
       document.klinika.submit();
    }
    
    function pregledSestraForm() {
        document.klinika.action.values = "../action/pregledSestraForm";
        alert('Zahtev je poslat');
        $("#pregledSestra").text("Poslat zahtev");
        document.klinika.submit();

    }
</script>
</html>
