/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.util.Date;
import model.Korisnik;
import model.Lekar;
import model.Pregled;
import model.Sestra;
import model.Zahtev;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author aleksa.buha
 */
public class PregledOperations {
    private static final String PREGLED_CEKA_POTVRDU="NEPOTVRDJEN";
    
        SessionFactory sFactory = null;

    private static PregledOperations instace;

    public static PregledOperations getIntance() {
        if (instace == null) {
            instace = new PregledOperations();
        }
        return instace;
    }

    private PregledOperations() {
        sFactory = HibernateUtil.getSessionFactory();
    }

    public void zakaziPregled(int idZahteva, int idSestre, Date datum) {
        try {
             Session session=sFactory.openSession();
             Transaction transaction=session.beginTransaction();
             
             Zahtev zahtev=(Zahtev) session.get(Zahtev.class, idZahteva);
             Sestra sestra=(Sestra) session.get(Sestra.class, idSestre);
             Pregled pregled=new Pregled(0, zahtev.getKorisnik(), sestra.getKorisnik(), datum, PREGLED_CEKA_POTVRDU);
      
             session.persist(pregled);
             
             transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        }      
    }

    
   
}
