package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Service;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-18T23:18:56")
@StaticMetamodel(Package.class)
public class Package_ { 

    public static volatile SingularAttribute<Package, Integer> package_code;
    public static volatile SingularAttribute<Package, Double> package_cost;
    public static volatile ListAttribute<Package, Service> list_of_services;

}