
package logica;

import java.util.Date;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Sale {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;    
    private int id_client_fk;
    private Date date_sale;
    private String payment_mehod;
    private int id_employee_fk;
    private int package_code_fk;
    
}
