/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Lekar;
import model.Raspored;
import model.Zahtev;
import operations.LekarOperations;
import operations.PregledOperations;
import operations.ZahteviOperations;

public class ZakazivanjeTerminaSestraAction implements Action {

    private static final String PRAMETAR_ID_LEKARA = "idLekara";
    private static final String ZAHTEVI_ATRIBUT = "zahteviZaPregledom";
    private static final String POLJE_TERMIN = "termin";
    private static final String ZAHTEV_ID = "zahtevId";
    private static final String SLOBODNI_TERMINI = "slobodniTermini";
    private static final String ID_SESTRE = "idSestre";

    @Override
    public String obradiZahtev(HttpServletRequest request) {
        String page = "error";
        if (request.getMethod().equalsIgnoreCase("GET")) {
            String sidLekara = request.getParameter(PRAMETAR_ID_LEKARA);
            int idLekara = Integer.parseInt(sidLekara);
            List<Zahtev> zahteviZaPregledima = ZahteviOperations.getIntance().getZahteveZaPregledZaLekara(idLekara);
            request.setAttribute(ZAHTEVI_ATRIBUT, zahteviZaPregledima);
            Lekar lekar = LekarOperations.getIntance().getLekar(idLekara);
            List<Raspored> slobodniTermini = lekar.getKorisnik().getRasporeds();
            request.setAttribute(SLOBODNI_TERMINI, slobodniTermini);
            page = "zakazivanjeTermina";
        }
        if (request.getMethod().equalsIgnoreCase("POST")) {
            int idSestre = Integer.parseInt(request.getParameter(ID_SESTRE));
            int idZahteva = Integer.parseInt(request.getParameter(ZAHTEV_ID));
            String sDate = request.getParameter(POLJE_TERMIN);
           int idLekara = Integer.parseInt(request.getParameter(PRAMETAR_ID_LEKARA));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
            Date datum = null;
            try {
                datum = sdf.parse(sDate);
            } catch (ParseException ex) {
                System.out.println("Datum nije dobar!");
            }
            if (datum == null) {
                return page;
            }
            
            ZahteviOperations.getIntance().obradiZahtev(idZahteva);
            PregledOperations.getIntance().zakaziPregled(idZahteva, idSestre, datum);
            LekarOperations.getIntance().rezervisiTermin(idLekara, datum);

            List<Zahtev> zahteviZaPregledima = ZahteviOperations.getIntance().getZahteveZaPregledZaLekara(idLekara);
            request.setAttribute(ZAHTEVI_ATRIBUT, zahteviZaPregledima);
            Lekar lekar = LekarOperations.getIntance().getLekar(idLekara);
            List<Raspored> slobodniTermini = lekar.getKorisnik().getRasporeds();
            request.setAttribute(SLOBODNI_TERMINI, slobodniTermini);
            page = "zakazivanjeTermina";
        }
        return page;
    }

}
