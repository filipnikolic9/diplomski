<%-- 
    Document   : izborLekara
    Created on : Sep 24, 2017, 10:30:15 PM
    Author     : nemanjanikolic
--%>

<%@page import="model.Korisnik"%>
<%@page import="model.Osiguranolice"%>
<%@page import="action.PromenaNadleznogLekaraAction"%>
<%@page import="java.util.List"%>
<%@page import="model.Lekar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/loginKlinika.css"/>
        <title>Izbor lekara</title>
    </head>
    <body>
      <table class="form-container" style="float: right; width: 100%; margin: 0px; margin-bottom: 100px" >
            <tr><td>Osigurano lice: Bogdan Bogdanovic<img style="float: right; width: 20px;height: 20px;" src="../css/img/logout.png"></td></tr>
        </table>
        <form name="klinika" method="post" action ="../action">
        <input type="hidden" name="action" value="">
        <input type="hidden" name="osiguranoLiceID" value=""> 
         
         <table class="form-container" style="margin-top: 100px"> 
                <tr>
                    <td class="form-title" colspan="2" style="padding-bottom: 17px;" >Izbor lekara</td>
                </tr>
                <tr>
                    <td clas="form-title" style="">Stari lekar:</td>
                    <td><input class="form-field" type=""  style="margin-bottom: 10px;"value="Marko Simeunovic"></td>
                </tr>
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
                    <td><a class="submit-button" href="#"/>Potvrdi</td>
                    <td><a class="submit-button" href="#"/>Odustani</td>
                </tr>
            </table>
       </form>
    </body>
</html>
