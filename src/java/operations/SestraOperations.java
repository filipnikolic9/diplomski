/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import model.Korisnik;
import model.Lekar;
import model.Osiguranolice;
import model.Sestra;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author aleksa.buha
 */
public class SestraOperations {
      SessionFactory sFactory = null;

    private static SestraOperations instace;

    public static SestraOperations getIntance() {
        if (instace == null) {
            instace = new SestraOperations();
        }
        return instace;
    }

    private SestraOperations() {
        sFactory = HibernateUtil.getSessionFactory();
    }

    public Sestra napuniObjekatSestra(Korisnik korisnik) {
         Sestra sestra=null;
               try {
            Session session = sFactory.openSession();
             sestra = (Sestra) session.get(Sestra.class, korisnik.getUserId());

        } catch (HibernateException e) {
            System.out.println(e);
        }
               return sestra;
    }
}
