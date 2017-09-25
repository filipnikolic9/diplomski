<%-- 
    Document   : pocetna
    Created on : Sep 24, 2017, 2:52:57 PM
    Author     : nemanjanikolic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <link rel="stylesheet" href="js/jquery.datetimepicker.full.min.js">
            <script text="text/javascript" src="js/jquery-3.2.1.min.js"></script>
            <link rel="stylesheet" type="text/css" href="js/jquery.datetimepicker.css"/>
            <script src="js/jquery.datetimepicker.full.min.js"></script>
            <title>Diplomski</title>
        </head>
        <body>
            <h1>Lekar : </h1>
            <form name="klinika" method="post" action ="klinika">
            <input type="hidden" name="action" value="unosTermina">
            <input type="hidden" name="rbr" value="">
            <table> 
                <tr>
                    <td>Termin</td>
                    <td><input id="datetimepicker" type="input" name="termin" ></td>
                </tr>
                <tr>
                    <td><a href="#" onclick="noviTermin()">Novi termin</a></td>
                    <td><a href="#" onclick="sacuvajTermine()">Sačuvaj termine</a></td>
                </tr>
            </table>
            <table id="termini">
                <tr>
                    <th>Termin</th>
                    <th>Akcija</th>
                </tr>   
            </table> 
        </form>
        </body>
<script>
    var rbr = 1;
    var nizTermina = [];
    $( function() {
        $( "#datetimepicker" ).datetimepicker({
             allowTimes:[
                '07:00', '07:30', '08:00', '08:30', '09:00', 
                '09:30', '10:00', '10:30', '11:00', '11:30',
                '12:00', '12:30', '13:00', '13:30'
               ]

        });
    } );
    
    
    var postojiTermin = false;
    function noviTermin() {
        postojiTermin = false;
        var termin = $("#datetimepicker").val();
        
        for (var i =0; i< nizTermina.length; i++) {
                if (nizTermina[i] == termin) {
                    postojiTermin = true;
                    break;
                } 
        } 
        
        if (postojiTermin == false) {
            var noviRed = '<tr>';
            noviRed += '<td><input type="text" id="termini" name="termin' + rbr + '" value="' + termin + '"/></td>';
            noviRed += '<td><a href="#" onClick="$(this).parent().parent().remove(); obrisi(' + rbr + ');">Obriši</td></tr>';
            noviRed += '</tr>';
            $("#termini tr:last").after(noviRed);
            nizTermina.push(termin);
            rbr++;
        } else {
            alert('Unesli ste postojeći termin');
        }
         
         
    }
    
    function obrisi(rbr) {
        delete nizTermina[rbr-1];
    }
    
    function sacuvajTermine() {
        document.klinika.rbr.values = rbr;
        document.klinika.submit();
    }
</script>
</html>