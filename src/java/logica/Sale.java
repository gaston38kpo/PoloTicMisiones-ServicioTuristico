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
import persistencia.ControladoraPersistencia;

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
    @JoinColumn(name = "client_fk")
    private Client client_fk;

    @ManyToOne
    @JoinColumn(name = "employee_fk")
    private Employee employee_fk;

    @ManyToOne
    @JoinColumn(name = "service_code_fk")
    private Service service_code_fk;

    @ManyToOne
    @JoinColumn(name = "package_code_fk")
    private Package package_code_fk;

    public Sale() {
    }

    public Sale(int sale_number, String payment_mehod, Date date_sale, Client client_fk, Employee employee_fk, Service service_code_fk, Package package_code_fk) {
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

    public Client getClient_fk() {
        return client_fk;
    }

    public void setClient_fk(Client client_fk) {
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

    public double getSaleCost(double item_cost, String payment_method) {

        switch (payment_method) {
            case "Transferencia":
                return item_cost + item_cost * 0.245;
            case "Tarjeta de Debito":
                return item_cost + item_cost * 0.3;
            case "Tarjeta de Credito":
                return item_cost + item_cost * 0.9;
            default:
                return item_cost;
        }
    }

    public int getDaysBetweenTodayAnd(Date other_date) {

        // La fecha actual
        Date today = new Date(System.currentTimeMillis());

        int milisecondsByDay = 86400000;
        int days = (int) ((today.getTime() - other_date.getTime()) / milisecondsByDay);

        return days;
    }

    public double getDailyEarnings() {

        ControladoraPersistencia controlPersis = new ControladoraPersistencia();

        int max_difference = 0;
        double cost_with_commission;
        double global_cost = 0;

        for (Sale sale : controlPersis.getAllSales()) {
            // Obtengo la diferencia entre el dia de la primera compra y el presente
            int days = getDaysBetweenTodayAnd(sale.getDate_sale());

            if (max_difference < days) {
                max_difference = days;
            }

            if (sale.getService_code_fk() != null) {
                cost_with_commission = getSaleCost(sale.getService_code_fk().getCost_service(), sale.getPayment_mehod());
                global_cost += cost_with_commission;
            } else if (sale.getPackage_code_fk() != null) {
                cost_with_commission = getSaleCost(sale.getPackage_code_fk().getPackage_cost(), sale.getPayment_mehod());
                global_cost += cost_with_commission;
            }
        }
        
        double daily_profit;
        
        // Si da la casualidad que la diferencia de dias es 0 (es decir dentro de las 24 horas) se toma el valor sin modificar
        if (max_difference > 0) {
            daily_profit = global_cost / max_difference;
        } else {
            daily_profit = global_cost;
        }
        
        double daily_profit_rounded = Math.round(daily_profit * Math.pow(10, 2)) / Math.pow(10, 2);
        return daily_profit_rounded;

    }

    public double getMonthlyEarnings() {

        ControladoraPersistencia controlPersis = new ControladoraPersistencia();

        int max_difference = 0;
        double cost_with_commission;
        double global_cost = 0;  

        for (Sale sale : controlPersis.getAllSales()) {
            // Obtengo la diferencia entre el dia de la primera compra y el presente
            int days = getDaysBetweenTodayAnd(sale.getDate_sale());

            if (max_difference < days) {
                max_difference = days;
            }

            if (sale.getService_code_fk() != null) {
                cost_with_commission = getSaleCost(sale.getService_code_fk().getCost_service(), sale.getPayment_mehod());
                global_cost += cost_with_commission;
            } else if (sale.getPackage_code_fk() != null) {
                cost_with_commission = getSaleCost(sale.getPackage_code_fk().getPackage_cost(), sale.getPayment_mehod());
                global_cost += cost_with_commission;
            }
        }

        double monthly_profit;
        
        // Si la venta mas lejana esta dentro de los ultimos 30 dias se toma el resultado como ganancia mensual
        // de lo contrario, si la venta mas lejana es mayor a 30 dias, las ganancias se dividen entre 30 para calcular un 
        // aproximado de ganancias mensuales.       
        if (max_difference > 30) {
            monthly_profit = global_cost / 30;
        } else {
            monthly_profit = global_cost;
        }
        
        double monthly_profit_rounded = Math.round(monthly_profit * Math.pow(10, 2)) / Math.pow(10, 2);
        return monthly_profit_rounded;
    }

}
