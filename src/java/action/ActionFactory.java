/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

public class ActionFactory {
    //ToDo
    private static final String LOGIN="/login";
    private static final String PROMENA_NADLEZNOG_LEKARA="/promenaLekara";
    private static final String PODNOSENJE_ZAHTEVA_ZA_PREGLEDOM="/podnosenjeZahteva";
    private static final String UNOS_TERMINA="/unesiTermine";
    private static final String ZAKAZIVANJE_TERMINA="/zakaziTermin";
    
    public static Action createAction(String path){
        Action action=null;
        
        if(path.equalsIgnoreCase(LOGIN)){
            action=new LoginAction();
        }
        
         if(path.equalsIgnoreCase(PROMENA_NADLEZNOG_LEKARA)){
            action=new PromenaNadleznogLekaraAction();
        }
        
          if(path.equalsIgnoreCase(PODNOSENJE_ZAHTEVA_ZA_PREGLEDOM)){
            action=new PodnosenjeZahtevaZaPregledomAction();
        }
          
          if(path.equalsIgnoreCase(PODNOSENJE_ZAHTEVA_ZA_PREGLEDOM)){
            action=new PodnosenjeZahtevaZaPregledomAction();
        }
          
            if(path.equalsIgnoreCase(UNOS_TERMINA)){
            action=new UnosTerminaAction();
        }
            
             if(path.equalsIgnoreCase(ZAKAZIVANJE_TERMINA)){
            action=new ZakazivanjeTerminaSestraAction();
        }
          
        return action;
    }
}
