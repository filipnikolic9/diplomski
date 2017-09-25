/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import model.Lekar;
import model.Osiguranolice;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author aleksa.buha
 */
public class OsiguranoLiceOperations {
     SessionFactory sFactory = null;

    private static OsiguranoLiceOperations instace;

    public static OsiguranoLiceOperations getIntance() {
        if (instace == null) {
            instace = new OsiguranoLiceOperations();
        }
        return instace;
    }

    private OsiguranoLiceOperations() {
        sFactory = HibernateUtil.getSessionFactory();
    }

    public void promeniNadleznogLekara(int idOl, int idLekara) {
        try {
            Session session = sFactory.openSession();
            org.hibernate.Transaction transaction = session.beginTransaction();
            Osiguranolice ol = (Osiguranolice) session.get(Osiguranolice.class, idOl);
            Lekar lekar=(Lekar) session.get(Lekar.class, idLekara);
            ol.setKorisnikByNadlezniLekar(lekar.getKorisnik());
            transaction.commit();
        } catch (HibernateException e) {
        }
    }
}
