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
        "Java EE": "6 Web",
        "EclipseLink": "JPA 2.1",
        "jdk": "8u301",
        "jre": "8u301",
        "Tomcat": "8.0.53",
        "MySQL Connector java": "5.1.23",
        "Persistencia": "javax.persistence-2.0.0",
        "XAMPP": "v3.3.0",
        "Mucho": "♥",
        "Rick": "Astley"
      }
    ]
  }
]

```
## SUPUESTOS

### Seccion VENTAS:
- En el listado de ventas, aquel campo (servicio o paquete) que este vacio, se mostrara con un guion "-" lo que supone que no se contrató ese y se contrato el otro campo.
- Al vender un paquete, se supone que este debe de estar previamente creado en la seccion PAQUETES para conocer su codigo de paquete.

### Seccion PAQUETES:
- El servicio adquirido para armar el mismo es por unidad y deben elegirse 2 o mas para que se pueda crear el paquete.
- El maximo de servicios en un paquete es de 5 (Cinco).
- El minimo de servicios en un paquete es de 2 (Dos).

### Bonus:
- Ganancias diarias: se divide la suma total de los ingresos de ventas entre la cantidad de dias entre la ganancia mas lejana y el presente.
- Ganancias mensuales: se divide la suma total de los ingresos de ventas entre 30, en caso de que la ganancia mas lejana este por debajo de los 30 dias, 
se toma como ganancia mensual la suma total sin aplicarle la division.

## Errores conocidos:
- No se puede eliminar un elemento que esta siendo usado por otro, por ejemplo, un usuario que pertenece a un empleado.
- Hay problemas con la codificacion por lo que suelen fallar las acentuaciones y demas caracteres especiales.
- La pagina no cuenta con diseño web responsivo actualmente.

# Primeros conceptos y diseños previos al actual:

![boceto pagina web](https://user-images.githubusercontent.com/77559010/146664366-a1a91366-4844-454e-b6bd-8147104ea437.jpg)

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
