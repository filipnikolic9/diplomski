/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.util.List;
import model.Lekar;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author aleksa.buha
 */
public class LekarOperations {

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
            org.hibernate.Transaction transaction = session.beginTransaction();
            Query q = session.createQuery("from Lekar as lekar");
            lekari = q.list();
        } catch (HibernateException e) {
        }
        return lekari;
    }
}
