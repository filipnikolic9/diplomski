<%-- 
    Document   : pocetnOsiguranoLice
    Created on : Sep 24, 2017, 10:04:35 PM
    Author     : nemanjanikolic
--%>

<%@page import="model.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script text="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <title>Osigurano lice</title>
    </head>
    <body>
         <% 
            Korisnik k = (Korisnik) request.getAttribute("korisnik");
        %>
       <form name="klinika" method="post" action ="klinika">
        <input type="hidden" name="action" value="">
        <input type="hidden" name="korisnikID" value="<%=k.getUserId() %>">
         <table> 
                <tr>
                    <td>Osigurano lice: <%=k.getIme() + " " + k.getPrezime() %></td>
                </tr>
                <tr>
                    <td><a href="#" onclick="izborLekaraForm()">Izbor lekara</a></td>
                    <td><a id="zahtev" href="#" onclick="podnosenjeZahtevaForm()">Podnošenje zahteva</td>
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
       $("#zahtev").text('Zahtev je poslat');
    }
</script>
</html>
