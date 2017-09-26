/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import javax.servlet.http.HttpServletRequest;
import operations.ZahteviOperations;


public class PodnosenjeZahtevaZaPregledomAction implements Action{

    private static String HIDDEN_FIELD_FOR_ID="idOl";
            
    @Override
    public String obradiZahtev(HttpServletRequest request) {
        String page="error";
        if(request.getMethod().equalsIgnoreCase("GET")){
            int idOl=Integer.parseInt(request.getParameter(HIDDEN_FIELD_FOR_ID));
            ZahteviOperations.getIntance().noviZahtev(idOl);
            page="osiguranoLiceHomePage";
        }
        return page;
    }
    }