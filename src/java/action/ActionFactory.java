/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

/**
 *
 * @author aleksa.buha
 */
public class ActionFactory {
    //ToDo
    private static final String LOGIN="/login";
    private static final String PROMENA_NADLEZNOG_LEKARA="/";
    
    public static Action createAction(String path){
        Action action=null;
        
        if(path.equalsIgnoreCase(LOGIN)){
            action=new LoginAction();
        }
        
         if(path.equalsIgnoreCase(PROMENA_NADLEZNOG_LEKARA)){
            action=new LoginAction();
        }
        
        return action;
    }
}
