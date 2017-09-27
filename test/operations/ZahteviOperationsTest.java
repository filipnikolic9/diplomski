/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import java.util.List;
import model.Zahtev;
import org.junit.Assert;
import org.junit.Test;

/**
 *
 * @author aleksa.buha
 */
public class ZahteviOperationsTest {
    

    @Test
    public void testGetZahteveZaPregledLekara() {
       int idLekara=1;
       List<Zahtev> zahtevi=ZahteviOperations.getIntance().getZahteveZaPregledZaLekara(idLekara);
       Assert.assertNotNull(zahtevi);
    }
    
}
