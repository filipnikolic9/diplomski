/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.util.List;
import javafx.beans.property.IntegerProperty;
import javax.servlet.http.HttpServletRequest;
import model.Lekar;
import operations.LekarOperations;
import operations.OsiguranoLiceOperations;

public class PromenaNadleznogLekaraAction implements Action {

    private static final String ERROR_PAGE = "error";
    //ToDo
    private static final String ATTRIBUTE_NAME_LEKARI="lekari";
    private static final  String LEKARI_COMBO_BOX="cmb_lekari";
    private static final  String ID_OL="txt_id_ol";

    @Override
    public String obradiZahtev(HttpServletRequest request) {
        String page = ERROR_PAGE;
        if (request.getMethod().equalsIgnoreCase("GET")) {
            page = "izmenaNadleznogLekara";
            List<Lekar> lekari=LekarOperations.getIntance().getLekari();
            request.setAttribute(ATTRIBUTE_NAME_LEKARI, lekari);
        }
        if (request.getMethod().equalsIgnoreCase("POST")) {
            int idOsiguranogLica=Integer.parseInt(request.getParameter(LEKARI_COMBO_BOX)); 
            int idLekara=Integer.parseInt(request.getParameter(ID_OL)); 
            OsiguranoLiceOperations.getIntance().promeniNadleznogLekara(idOsiguranogLica, idLekara);
            page="osiguranoLiceHomePage";
        }
        return page;
    }

}
