package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Service implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int service_code;

    @Basic
    private String name;
    private String description;
    private String destination;
    private double cost_service;

    @Temporal(TemporalType.DATE)
    private Date date_service;
    

    public Service() {
    }

    public Service(int service_code, String name, String description, String destination, double cost_service, Date date_service) {
        this.service_code = service_code;
        this.name = name;
        this.description = description;
        this.destination = destination;
        this.cost_service = cost_service;
        this.date_service = date_service;
    }

    public int getService_code() {
        return service_code;
    }

    public void setService_code(int service_code) {
        this.service_code = service_code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public double getCost_service() {
        return cost_service;
    }

    public void setCost_service(double cost_service) {
        this.cost_service = cost_service;
    }

    public Date getDate_service() {
        return date_service;
    }

    public void setDate_service(Date date_service) {
        this.date_service = date_service;
    }

   
}
