# Trabajo practico final del Polo Tic de Misiones (Silicon Misiones)
### Datos:
```
[
  {
    "Nombre BD": "servicio_turistico",
    "usuario": "root",
    "password": ""
  },
  {
    "Elementos usados": [
      {
        "NetBeans": "8.2",
        "jdk": "8u301",
        "jre": "8u301",
        "Tomcat": "8.0.53",
        "MySQL Connector java": "5.1.23",
        "Persistencia": "javax.persistence-2.0.0",
        "XAMPP": "v3.3.0",
        "Mucho": "♥"
      }
    ]
  }
]

```
## SUPUESTOS

### Seccion VENTAS:
En el listado de ventas, aquel campo (servicio o paquete) que este vacio, se mostrara con un guion "-" lo que supone que no se contrató ese y se contrato el otro campo.
Al vender un paquete, se supone que este debe de estar previamente creado en la seccion PAQUETES para conocer su codigo de paquete.

### Seccion PAQUETES:
El servicio adquirido para armar el mismo es por unidad y deben elegirse 2 o mas para que se pueda crear el paquete.

### Bonus:
Las ganancias diarias se calculan en base a la media de ingresos dividido la cantidad de dias desde la primera compra, las ganancias mensuales se divide el ingreso entre 30, este ultimo valor representa un aproximado (porque tambien existen meses de 31 y 28 dias).

# Primeros conceptos y diseños previos al actual:

![boceto pagina web](https://user-images.githubusercontent.com/77559010/146626339-fd8a458d-4d74-4579-8fa1-a4a8ced22cb8.png)

# Diagrama de clases:

![Diagrama de clases](https://user-images.githubusercontent.com/77559010/146626343-eb985661-1c33-47ce-9b0e-5eb7ee743500.png)

# Vista previa de la pagina:

### 🐱‍💻LOGIN
![image](https://user-images.githubusercontent.com/77559010/146624051-2f1032cf-15c6-4111-9053-4f5fe2a6fbdd.png)
### 🏡INDEX
![image](https://user-images.githubusercontent.com/77559010/146624056-a4c7f81e-febf-4e78-bf80-b476fbdfaeba.png)
### ✍ALTA
![image](https://user-images.githubusercontent.com/77559010/146624060-f7c58712-2922-4a59-80e8-12086faec061.png)
### 💡BAJA Y LECTURA
![image](https://user-images.githubusercontent.com/77559010/146624093-d673252f-ea6b-4968-9c64-6ba325cf7232.png)
### 🤹‍♀️MODIFICACION
![image](https://user-images.githubusercontent.com/77559010/146624101-634a980c-2e5e-481c-ae33-eb2374ed823b.png)
