<%-- 
    Document   : izborLekara
    Created on : Sep 24, 2017, 10:30:15 PM
    Author     : nemanjanikolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Izbor lekara</title>
    </head>
    <body>
        <form name="klinika" method="post" action ="../action">
        <input type="hidden" name="action" value="">
        <input type="hidden" name="osiguranoLiceID" value="">    
         <table> 
                <tr>
                    <td>Izbor lekara</td>
                </tr>
                <tr>
                    <td>Stari lekar:</td>
                    <td>
                        <select>
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Novi lekar:</td>
                    <td>
                        <select>
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><a href="#"/>Potvrdi</td>
                    <td><a href="#"/>Odustani</td>
                </tr>
            </table>
       </form>
    </body>
</html>
