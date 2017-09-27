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
        <title>Osigurano lice</title>
    </head>
    <body>
        <table class="form-container" style="float: right; width: 100%; margin: 0px; margin-bottom: 100px" >
            <tr><td>Sestra: Ivana Ivanovic <img style="float: right; width: 20px;height: 20px;" src="../css/img/logout.png"></td></tr>
        </table>

       <form name="klinika" method="post" action ="klinika">
            <input type="hidden" name="action" value="podnosenjeZahteva">
         <table class="form-container"> 
             <tr>
                    <th>Osigurano lice </th>
                     <th>Termini: </th>
                </tr>
                <tr>
                    <td>Ivan Bogdanovic</td>
                    <td>
                        <select class="opp">
                            <option>12-12-2017 10:00</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top: 4px;"><a class="submit-button" href="#">Potvrdi</td>
                </tr>
            </table>
       </form>
    </body>
</html>
