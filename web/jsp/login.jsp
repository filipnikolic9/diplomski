<%-- 
    Document   : login
    Created on : Sep 24, 2017, 1:32:10 PM
    Author     : nemanjanikolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/loginKlinika.css"/>
        <script text="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <title>Log in</title>
    </head>
    <body>
        <form name="klinika" class="form-container" method="post" action ="../action/login">
            <input type="hidden" name="action" value="/login">
            <table> 
                <tr>
                    <td>Korisničko ime:</td>
                    <td><input id = "korisnickoIme" class="form-field" type="text" name="korisnickoIme"></td>
                </tr>
                <tr>
                    <td>Šifra:</td>
                    <td><input id ="sifra" class="form-field" type="password" name="sifra"></td>
                </tr>
                <tr>
                    <td><a class="submit-button" href="#" onclick="potvrdi()">Potvrdi</a></td>
                </tr>
            </table>
        </form>
    </body>
<script>
    function potvrdi () {
        var korisnickoIme = $("#korisnickoIme").val();
        var sifra = $("#sifra").val();
        var greska = false;
        if (korisnickoIme == "") {
            alert('Niste uneli korisničko ime');
            $("#korisnickoIme").css("border-color","red")
            $("#korisnickoIme").focus();
            greska = true; 
        } 
        if (sifra == "" && greska == false) {
            alert('Niste uneli šifru');
            $("#sifra").css("border-color","red")
            $("#sifra").focus();
            greska = true;
            
        } 
        if (greska == false) {
            document.klinika.submit();       
        } 
    }
</script>    
</html>
