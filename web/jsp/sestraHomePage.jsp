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
        <script text="text/javascript" src="js/jquery-3.2.1.min.js"></script>
        <title>Sestra</title>
    </head>
    <body>
       <form name="klinika" method="post" action ="../action">
        <input type="hidden" name="action" value="">
        <input type="hidden" name="osiguranoLiceID" value="">    
         <table> 
                <tr>
                    <td><a href="#" onclick="izborLekaraForm()">Izbor lekara</a></td>
                    <td id="pregledSestra"><a href="#" onclick="pregledSestraForm()">Podnošenje zahteva</td>
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
