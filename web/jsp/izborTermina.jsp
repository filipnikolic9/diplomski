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
            <input type="hidden" name="action" value="podnosenjeZahteva">
         <table> 
                <tr>
                    <td>Izabrani lekar:</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Termini: </td>
                    <td>
                        <select>
                            <option>12-12-2017 10:00</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><a href="#">Podnesi zahtev</td>
                </tr>
            </table>
       </form>
    </body>
</html>
