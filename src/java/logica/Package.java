package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Package implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int package_code;
    
    @Basic
    private double package_cost;
    
    @ManyToMany
    private List<Service> list_of_services;
    

    public Package() {
    }

    public Package(int package_code, double package_cost, List<Service> list_of_services) {
        this.package_code = package_code;
        this.package_cost = package_cost;
        this.list_of_services = list_of_services;
    }

    public int getPackage_code() {
        return package_code;
    }

    public void setPackage_code(int package_code) {
        this.package_code = package_code;
    }

    public double getPackage_cost() {
        return package_cost;
    }

    public void setPackage_cost(double package_cost) {
        this.package_cost = package_cost;
    }

    public List<Service> getList_of_services() {
        return list_of_services;
    }

    public void setList_of_services(List<Service> list_of_services) {
        this.list_of_services = list_of_services;
    }

    
}
    