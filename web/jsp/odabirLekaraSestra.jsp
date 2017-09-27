<%-- 
    Document   : odabirLekaraSestra
    Created on : Sep 28, 2017, 12:34:04 AM
    Author     : nemanjanikolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/loginKlinika.css"/>
        <title>Sestra</title>
    </head>
    <body>
        <table class="form-container" style="float: right; width: 100%; margin: 0px; margin-bottom: 100px" >
            <tr><td>Sestra: Ivana Ivanovic<img style="float: right; width: 20px;height: 20px;" src="../css/img/logout.png"></td></tr>
        </table>

        <table class="form-container" style=" width: 50%;"> 
            <tr>
                 <td>Novi lekar:</td>
                    <td>
                        <select class="opp">
                            <option>Nemanja Nikolic</option>
                            <option>Nikola Jovanovic</option>                          
                        </select>
                    </td>
             </tr> 
             <tr>
                <td style="margin-bottom: 10px"><a href="#" class="submit-button" onclick="potvrdi()">Izberi</a></td>
                </tr>
            </table>
    </body>
</html>
