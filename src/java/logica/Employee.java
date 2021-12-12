package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Employee implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Basic
    private String first_name;
    private String last_name;
    private String street;
    private String dni;
    private String nationality;
    private String cellphone;
    private String email;
    private String position;
    private double salary;

    @Temporal(TemporalType.DATE)
    private Date birthdate;

    @OneToOne
    private User user_fk;
    

    public Employee() {
    }

    public Employee(int id, String first_name, String last_name, String street, String dni, String nationality, String cellphone, String email, String position, double salary, Date birthdate, User user_fk) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.street = street;
        this.dni = dni;
        this.nationality = nationality;
        this.cellphone = cellphone;
        this.email = email;
        this.position = position;
        this.salary = salary;
        this.birthdate = birthdate;
        this.user_fk = user_fk;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public User getUser_fk() {
        return user_fk;
    }

    public void setUser_fk(User user_fk) {
        this.user_fk = user_fk;
    }

}
