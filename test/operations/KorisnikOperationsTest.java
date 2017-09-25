/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package operations;

import model.Korisnik;
import org.junit.Test;
import static org.junit.Assert.*;

public class KorisnikOperationsTest {
    
    public KorisnikOperationsTest() {
    }

    @Test
    public void testGetKorisnikWithUserNameAndPasswordWhenIsRegular() {
        String korisnickoIme="ivan";
        String sifra="1234";
        
        Korisnik korisnik=KorisnikOperations.getIntance().getKorisnikWithUserNameAndPassword(korisnickoIme, sifra);
        assertNotNull(korisnik);
        assertEquals(korisnik.getIme(), "ivan");
        assertEquals(korisnik.getPrezime(), "bogdanovic");
    }
    
     @Test
    public void testGetKorisnikWithUserNameAndPasswordWhenIsNotRegular() {
        String korisnickoIme="ivan";
        String sifra="1111";
        
        Korisnik korisnik=KorisnikOperations.getIntance().getKorisnikWithUserNameAndPassword(korisnickoIme, sifra);
        assertNull(korisnik);
      
    }
    
      
    
}
