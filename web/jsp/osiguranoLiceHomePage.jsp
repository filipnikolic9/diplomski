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
        <script text="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <title>Osigurano lice</title>
    </head>
    <body>
        <%
            Osiguranolice ol = (Osiguranolice) session.getAttribute("korisnik");
            Korisnik k = ol.getKorisnikByUserId();
        %>

        <input type="hidden" name="action" value="">
        <table> 
            <tr>
                <td>Osigurano lice: <%=k.getIme() + " " + k.getPrezime()%></td>
            </tr>
            <tr>
            <form name="form1" method="GET" action ="../action/promenaLekara">
                <td><a href="#" onclick="izborLekaraForm()">Izbor lekara</a></td>
            </form>
            <form name="form2" method="GET" action ="../action/podnosenjeZahteva">
                <input type="hidden" name="idOl" value="<%=k.getUserId()%>">
                <td><a id="zahtev" href="#" onclick="podnosenjeZahtevaForm()">Podnošenje zahteva</td>
            </form>>
        </tr>
    </table>
</body>
<script>
    function izborLekaraForm() {
        document.form1.action.values = "izborLekaraForm";
        document.form1.submit();
    }

    function podnosenjeZahtevaForm() {
        $("#zahtev").text('Zahtev je poslat');
        document.form2.submit();
    }
</script>
</html>
