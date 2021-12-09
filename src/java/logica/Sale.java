package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Sale implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int sale_number;    
    
    @Basic
    private String payment_mehod;
    
    @Temporal(TemporalType.DATE)
    private Date date_sale;    
    
    @ManyToOne
    @JoinColumn(name="client_fk")
    private int client_fk;
    
    @ManyToOne
    @JoinColumn(name="employee_fk")
    private Employee employee_fk;
    
    @ManyToOne
    @JoinColumn(name="service_code_fk")
    private Service service_code_fk;
    
    @ManyToOne
    @JoinColumn(name="package_code_fk")
    private Package package_code_fk;
    

    public Sale() {
    }

    public Sale(int sale_number, String payment_mehod, Date date_sale, int client_fk, Employee employee_fk, Service service_code_fk, Package package_code_fk) {
        this.sale_number = sale_number;
        this.payment_mehod = payment_mehod;
        this.date_sale = date_sale;
        this.client_fk = client_fk;
        this.employee_fk = employee_fk;
        this.service_code_fk = service_code_fk;
        this.package_code_fk = package_code_fk;
    }

    public int getSale_number() {
        return sale_number;
    }

    public void setSale_number(int sale_number) {
        this.sale_number = sale_number;
    }

    public String getPayment_mehod() {
        return payment_mehod;
    }

    public void setPayment_mehod(String payment_mehod) {
        this.payment_mehod = payment_mehod;
    }

    public Date getDate_sale() {
        return date_sale;
    }

    public void setDate_sale(Date date_sale) {
        this.date_sale = date_sale;
    }

    public int getClient_fk() {
        return client_fk;
    }

    public void setClient_fk(int client_fk) {
        this.client_fk = client_fk;
    }

    public Employee getEmployee_fk() {
        return employee_fk;
    }

    public void setEmployee_fk(Employee employee_fk) {
        this.employee_fk = employee_fk;
    }

    public Service getService_code_fk() {
        return service_code_fk;
    }

    public void setService_code_fk(Service service_code_fk) {
        this.service_code_fk = service_code_fk;
    }

    public Package getPackage_code_fk() {
        return package_code_fk;
    }

    public void setPackage_code_fk(Package package_code_fk) {
        this.package_code_fk = package_code_fk;
    }

    
}
