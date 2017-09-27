/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.util.Date;
import java.util.List;
import model.Korisnik;
import model.Lekar;
import model.Raspored;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author aleksa.buha
 */
public class LekarOperations {
private static final String ZAUZET="ZAUZET";

    SessionFactory sFactory = null;

    private static LekarOperations instace;

    public static LekarOperations getIntance() {
        if (instace == null) {
            instace = new LekarOperations();
        }
        return instace;
    }

    private LekarOperations() {
        sFactory = HibernateUtil.getSessionFactory();
    }

    public List<Lekar> getLekari() {
        List<Lekar> lekari = null;
        try {
            Session session = sFactory.openSession();
            Query q = session.createQuery("from Lekar as lekar");
            lekari = q.list();
        } catch (HibernateException e) {
        }
        return lekari;
    }

    public Lekar getLekar(int id) {
        Lekar lekar = null;
        try {
            Session session = sFactory.openSession();
            lekar = (Lekar) session.get(Lekar.class, id);
        } catch (Exception e) {
            System.out.println(e);
        }
        return lekar;
    }

    public void sacuvajTermine(List<Raspored> termini) {
        try {
            Session session = sFactory.openSession();
            Transaction transaction = session.beginTransaction();
            for (Raspored raspored : termini) {
                session.persist(raspored);
            }
            transaction.commit();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void rezervisiTermin(int idLekara, Date datum) {
        try {
            Session session = sFactory.openSession();
            Transaction transaction = session.beginTransaction();
            List<Raspored> listaRasporeda = null;
            Korisnik korisnik = (Korisnik) session.get(Korisnik.class, idLekara);
            Query query = session.createQuery("from Raspored as raspored WHERE (raspored.korisnik= :korisnik) AND (raspored.datum= :datum)");
            listaRasporeda = (List<Raspored>) query.list().get(0);
            if (listaRasporeda == null) {
                throw new Exception();
            }else{
                Raspored raspored=listaRasporeda.get(0);
                raspored.setStanje(ZAUZET);
                transaction.commit();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
