/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

public class LookUpView {

    //ToDo
    private static final String ERROR_PAGE = "/";
    private static final String LOGIN = "/";
    private static final String DOKTOR_HOME_PAGE = "/jsp/kreiranjeTermina.jsp";
    private static final String SESTRA_HOME_PAGE = "/";
    private static final String OSIGURANO_LICE_HOME_PAGE = "/jsp/osiguranoLiceHomePage.jsp";
    private static final String IZMENA_NADLEZNOG_LEKARA = "/jsp/izborLekara.jsp";

    public static String getView(String name) {
        String view = null;
        if (name.equalsIgnoreCase("error")) {
            view = ERROR_PAGE;
        }
        
        if (name.equalsIgnoreCase("login")) {
            view = LOGIN;
        }

        if (name.equalsIgnoreCase("doktorHomePage")) {
            view = DOKTOR_HOME_PAGE;
        }
        if (name.equalsIgnoreCase("sestraHomePage")) {

            view = SESTRA_HOME_PAGE;
        }
        if (name.equalsIgnoreCase("osiguranoLiceHomePage")) {
            view = OSIGURANO_LICE_HOME_PAGE;
        }
        if (name.equalsIgnoreCase("izmenaNadleznogLekara")) {
            view = IZMENA_NADLEZNOG_LEKARA;
        }
        return view;
    }
}
