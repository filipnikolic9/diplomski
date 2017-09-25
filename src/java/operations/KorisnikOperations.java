/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.util.List;
import model.Korisnik;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

public class KorisnikOperations {

    SessionFactory sFactory = null;

    private static KorisnikOperations instace;

    public static KorisnikOperations getIntance() {
        if (instace == null) {
            instace = new KorisnikOperations();
        }
        return instace;
    }

    private KorisnikOperations() {
        sFactory = HibernateUtil.getSessionFactory();
    }

    public List<Korisnik> getKorisnike() {
        List<Korisnik> tasks = null;
        try {
            Session session = sFactory.openSession();
            org.hibernate.Transaction transaction = session.beginTransaction();
            Query q = session.createQuery("from Korisnik as korisnik");
            tasks = q.list();
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return tasks;
    }

    public Korisnik getKorisnik(int id) {
        Korisnik k = null;
        try {
            Session session = sFactory.openSession();
            k = (Korisnik) session.get(Korisnik.class, id);
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return k;
    }

    public void upadateKorisnik(Korisnik korisnik) {
        try {
            Session session = sFactory.openSession();
            org.hibernate.Transaction transaction = session.beginTransaction();
            Korisnik db_t = (Korisnik) session.get(Korisnik.class, korisnik.getUserId());
            db_t = (Korisnik) session.merge(korisnik);
            transaction.commit();
        } catch (HibernateException e) {
        }
    }

    public Korisnik getKorisnikWithUserNameAndPassword(String korisnickoIme, String korisnickaSifra) {
        Korisnik k = null;
        try {
            Session session = sFactory.openSession();
            String hql = "FROM Korisnik k WHERE k.korisnickoIme= :korisnickoIme";
            Query query = session.createQuery(hql);
            query.setParameter("korisnickoIme", korisnickoIme);
            List<Korisnik> results = query.list();
            if(!results.isEmpty()){
                if(results.get(0).getKorisnickaSifra().equals(korisnickaSifra)){
                    k=results.get(0);
                    k.getUloges().size();
                }
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return k;
    }
}
