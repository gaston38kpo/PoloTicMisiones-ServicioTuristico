package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Client;
import logica.Employee;
import logica.Package;
import logica.Service;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-08T21:29:44")
@StaticMetamodel(Sale.class)
public class Sale_ { 

    public static volatile SingularAttribute<Sale, Date> date_sale;
    public static volatile SingularAttribute<Sale, String> payment_mehod;
    public static volatile SingularAttribute<Sale, Package> package_code_fk;
    public static volatile SingularAttribute<Sale, Client> client_fk;
    public static volatile SingularAttribute<Sale, Employee> employee_fk;
    public static volatile SingularAttribute<Sale, Service> service_code_fk;
    public static volatile SingularAttribute<Sale, Integer> sale_number;

}