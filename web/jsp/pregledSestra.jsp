<%-- 
    Document   : sestraHomePage
    Created on : Sep 25, 2017, 10:45:10 PM
    Author     : nemanjanikolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sestra</title>
    </head>
    <body>
        <form name="klinika" method="post" action="../action/pregledaSestra">
        <table>
            <tr>
                <td>Pregledi za zakazivanje</td>
            </tr>
            <tr>
                <th>Osigurano lice: </th>
                <th>Termini</th> 
                <th colspan="2">Akcija</th> 
            </tr>
            <tr>
                <td>ovde ide od lice</td>
                <td>ovde idu termini</td> 
                <td><a href="#">Prihvati</td> 
                <td><a href="#">Obrisi</td> 
            </tr>
            <tr>
                <td><a href="#">Prosledi doktoru<td>
            </tr>
        </table>
        </form>
    </body>
</html>
