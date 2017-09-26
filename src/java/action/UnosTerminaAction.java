/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import model.Lekar;
import model.Raspored;
import operations.LekarOperations;

/**
 *
 * @author aleksa.buha
 */
public class UnosTerminaAction implements Action {

    @Override
    public String obradiZahtev(HttpServletRequest request) {
        String page = "error";
        if (request.getMethod().equalsIgnoreCase("POST")) {
            int lekar = Integer.parseInt(request.getParameter("lekar"));
            Lekar l = LekarOperations.getIntance().getLekar(lekar);
            int rbr = Integer.parseInt(request.getParameter("rbr"));
            List<Raspored> termini = new ArrayList<>();
            for (int i = 1; i < rbr; i++) {
                String termin = request.getParameter("termin" + i);
                if (termin != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
                    Date datum = null;
                    try {
                        datum = sdf.parse(termin);
                    } catch (ParseException ex) {
                        System.out.println("OVO SRANJE NIJE DOBROOOOO! DATUM JE SRANJE");
                    }
                    if (datum == null) {
                        return page;
                    }
                    termini.add(new Raspored(0, l.getKorisnik(), datum, "SLOBODAN"));
                }
            }
            LekarOperations.getIntance().sacuvajTermine(termini);
            System.out.println("SACUVANO!!!");
        }
        return page;
    }

}
