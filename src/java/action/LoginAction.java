/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Korisnik;
import model.Lekar;
import model.Osiguranolice;
import model.Sestra;
import model.Zahtev;
import operations.KorisnikOperations;
import operations.LekarOperations;
import operations.OsiguranoLiceOperations;
import operations.SestraOperations;
import operations.ZahteviOperations;

public class LoginAction implements Action {

    private static final String POLJE_ZA_KORISNICKO_IME = "korisnickoIme";
    private static final String POLJE_ZA_SIFRU = "sifra";
    private static final String ERROR_PAGE = "error";
    private static final int DOKTOR_ROLE = 3;
    private static final int SESTRA_ROLE = 2;
    private static final int OSIGURANO_LICE_ROLE = 1;
    private static final String LEKARI_ATRIBUT="lekari";
    //ToDo
    private static final String KORISNIK_ATTRIBUTE = "korisnik";

    @Override
    public String obradiZahtev(HttpServletRequest request) {
        String errorMessage = "";
        String strana = ERROR_PAGE;
        if (request.getMethod().equalsIgnoreCase("GET")) {
            strana = "login";
        }
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String korisnickoIme = request.getParameter(POLJE_ZA_KORISNICKO_IME);
            String korisnickaSifra = request.getParameter(POLJE_ZA_SIFRU);
            Korisnik korisnik = KorisnikOperations.getIntance().getKorisnikWithUserNameAndPassword(korisnickoIme, korisnickaSifra);
            
            if (korisnik == null) {
                errorMessage = "Korisnicko ime i/ili sifra nisu dobri";
                strana = ERROR_PAGE;
                return strana;
            }

            HttpSession session = request.getSession(true);
            int uloga = korisnik.getUloges().get(0).getIdUloge();

            switch (uloga) {
                case DOKTOR_ROLE:
                    strana = "doktorHomePage";
                    Lekar lekar=LekarOperations.getIntance().getLekar(korisnik.getUserId());
                    session.setAttribute(KORISNIK_ATTRIBUTE, lekar);
                    break;
                case SESTRA_ROLE:
                    strana = "sestraHomePage";
                    Sestra sestra=napuniObjekatSestra(korisnik);
                    session.setAttribute(KORISNIK_ATTRIBUTE, sestra);
                    List<Lekar> lekari=LekarOperations.getIntance().getLekari();
                    request.setAttribute(LEKARI_ATRIBUT, lekari);
                    break;
                case OSIGURANO_LICE_ROLE:
                    strana = "osiguranoLiceHomePage";
                    Osiguranolice ol = napuniOsiguranoLice(korisnik);
                    session.setAttribute(KORISNIK_ATTRIBUTE, ol);
                    break;
                default:
                    strana = ERROR_PAGE;

            }
        }
        return strana;
    }

    private Osiguranolice napuniOsiguranoLice(Korisnik korisnik) {
        return OsiguranoLiceOperations.getIntance().napuniOl(korisnik);
    }

    private Sestra napuniObjekatSestra(Korisnik korisnik) {
       return SestraOperations.getIntance().napuniObjekatSestra(korisnik);
    }

}
