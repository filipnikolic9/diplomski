/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Korisnik;
import operations.KorisnikOperations;

/**
 *
 * @author aleksa.buha
 */
public class LoginAction implements Action {

    private static final String POLJE_ZA_KORISNICKO_IME = "korisnickoIme";
    private static final String POLJE_ZA_SIFRU = "sifra";
    private static final String ERROR_PAGE = "error";
    private static final int DOKTOR_ROLE = 1;
    private static final int SESTRA_ROLE = 2;
    private static final int OSIGURANO_LICE_ROLE = 3;
    //ToDo
    private static final String SESSION_ATTRIBUTE = "/";

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
            session.setAttribute(SESSION_ATTRIBUTE, korisnik);

            int uloga = korisnik.getUloges().get(0).getIdUloge();

            switch (uloga) {
                case DOKTOR_ROLE:
                    strana = "doktorHomePage";
                    break;
                case SESTRA_ROLE:
                    strana = "sestraHomePage";
                    break;
                case OSIGURANO_LICE_ROLE:
                    strana = "osiguranoLiceHomePage";
                    break;
                default:
                    strana = ERROR_PAGE;

            }
        }
        return strana;
    }

}
