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
        <title>Osigurano lice</title>
    </head>
    <body>
       <form name="klinika" method="post" action ="klinika">
            <input type="hidden" name="action" value="">
         <table> 
                <tr>
                    <td><a href="#" onclick="izborLekaraForm()">Izbor lekara</a></td>
                    <td><a href="#" onclick="podnosenjeZahtevaForm()">Podnošenje zahteva</td>
                </tr>
            </table>
       </form>
    </body>
<script>
    function izborLekaraForm() {
       document.klinika.action.values = "izborLekaraForm";
       document.klinika.submit();
    }
    
    function podnosenjeZahtevaForm() {
       alert('Zahtev je poslat');
    }
</script>
</html>
