
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
    private int service_code_fk;
    private int package_code_fk;

    public Sale() {
    }

    public Sale(int id, int id_client_fk, Date date_sale, String payment_mehod, int id_employee_fk, int service_code_fk, int package_code_fk) {
        this.id = id;
        this.id_client_fk = id_client_fk;
        this.date_sale = date_sale;
        this.payment_mehod = payment_mehod;
        this.id_employee_fk = id_employee_fk;
        this.service_code_fk = service_code_fk;
        this.package_code_fk = package_code_fk;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_client_fk() {
        return id_client_fk;
    }

    public void setId_client_fk(int id_client_fk) {
        this.id_client_fk = id_client_fk;
    }

    public Date getDate_sale() {
        return date_sale;
    }

    public void setDate_sale(Date date_sale) {
        this.date_sale = date_sale;
    }

    public String getPayment_mehod() {
        return payment_mehod;
    }

    public void setPayment_mehod(String payment_mehod) {
        this.payment_mehod = payment_mehod;
    }

    public int getId_employee_fk() {
        return id_employee_fk;
    }

    public void setId_employee_fk(int id_employee_fk) {
        this.id_employee_fk = id_employee_fk;
    }

    public int getService_code_fk() {
        return service_code_fk;
    }

    public void setService_code_fk(int service_code_fk) {
        this.service_code_fk = service_code_fk;
    }

    public int getPackage_code_fk() {
        return package_code_fk;
    }

    public void setPackage_code_fk(int package_code_fk) {
        this.package_code_fk = package_code_fk;
    }
    
    
}
