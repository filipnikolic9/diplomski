/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.util.List;
import model.Korisnik;
import model.Lekar;
import model.Osiguranolice;
import model.Zahtev;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class ZahteviOperations {

    private static final String NOVI_ZAHTEV = "NOVI_ZAHTEV_ZA_PREGLEDOM";
    private static final String ZAHTEV_OBRADJEN = "ZAHTEV_OBRADJEN";
    SessionFactory sFactory = null;

    private static ZahteviOperations instace;

    public static ZahteviOperations getIntance() {
        if (instace == null) {
            instace = new ZahteviOperations();
        }
        return instace;
    }

    private ZahteviOperations() {
        sFactory = HibernateUtil.getSessionFactory();
    }

    public void noviZahtev(int ol) {
        try {
            Session session = sFactory.openSession();
            org.hibernate.Transaction transaction = session.beginTransaction();
            Korisnik k = (Korisnik) session.get(Korisnik.class, ol);
            Zahtev zahtev = new Zahtev(0, k, NOVI_ZAHTEV);
            session.persist(zahtev);
            transaction.commit();
        } catch (HibernateException e) {
            System.out.println(e);
        }
    }

    public List<Zahtev> vratiSve() {
        List<Zahtev> zahtevi = null;
        try {
            Session session = sFactory.openSession();
            Query q = session.createQuery("from Zahtev as zahtev");
            zahtevi = q.list();
        } catch (HibernateException e) {
        }
        return zahtevi;
    }

    public List<Zahtev> getZahteveZaPregledZaLekara(int idLekara) {
          List<Zahtev> zahtevi = null;
        try {
            Session session = sFactory.openSession();
            Query q = session.createQuery("from Zahtev as zahtev WHERE (zahtev.korisnik.osiguranoliceByUserId.korisnikByNadlezniLekar.userId= :idLekara) AND (zahtev.stanje= :stanje)");
            q.setParameter("idLekara", idLekara);
            q.setParameter("stanje","NOVI_ZAHTEV_ZA_PREGLEDOM");
            zahtevi = q.list();
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return zahtevi;
    }

    public void obradiZahtev(int idZahteva) {
        try {
            Session session=sFactory.openSession();
            Transaction transaction=session.beginTransaction();
            Zahtev z=(Zahtev) session.get(Zahtev.class, idZahteva);
            z.setStanje(ZAHTEV_OBRADJEN);
            session.persist(z);
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
