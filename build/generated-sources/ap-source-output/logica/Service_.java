package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Package;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-08T21:29:44")
@StaticMetamodel(Service.class)
public class Service_ { 

    public static volatile SingularAttribute<Service, Date> date_service;
    public static volatile SingularAttribute<Service, Double> cost_service;
    public static volatile SingularAttribute<Service, String> name;
    public static volatile SingularAttribute<Service, String> destination;
    public static volatile SingularAttribute<Service, Integer> service_code;
    public static volatile SingularAttribute<Service, String> description;
    public static volatile ListAttribute<Service, Package> list_of_packages;

}