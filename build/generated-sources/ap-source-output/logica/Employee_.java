package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.User;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-17T22:32:28")
@StaticMetamodel(Employee.class)
public class Employee_ { 

    public static volatile SingularAttribute<Employee, Date> birthdate;
    public static volatile SingularAttribute<Employee, User> user_fk;
    public static volatile SingularAttribute<Employee, String> nationality;
    public static volatile SingularAttribute<Employee, String> street;
    public static volatile SingularAttribute<Employee, String> last_name;
    public static volatile SingularAttribute<Employee, String> cellphone;
    public static volatile SingularAttribute<Employee, Integer> id;
    public static volatile SingularAttribute<Employee, String> position;
    public static volatile SingularAttribute<Employee, Double> salary;
    public static volatile SingularAttribute<Employee, String> first_name;
    public static volatile SingularAttribute<Employee, String> dni;
    public static volatile SingularAttribute<Employee, String> email;

}