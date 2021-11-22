# SearchPet

Aplicación de prueba que obtiene sus datos de la api https://www.petfinder.com/developers/v2/docs/, se permite listar animales, buscar por tipo de animal y acceder al detalle, en la segunda pestaña marca en el mapa anotaciones con las organizaciones cerca de la localización buscada asi como buscar las organización cercanas a un punto marcado en el mapa. Está preparada para el almacenamiento de datos provenientes del servidor.


#### Prerequisitos para el funcionamiento del projecto.
* Crear una cuenta en la api para generar una api_key y el client_secret necesario para el funcionamiento del servicio. 
* Al ejecutar el pod install nos pedirá a través del plugin de cocoapods-keys las credenciales necesarias, las introducimos y RUN.

# Arquitectura 
Se sigue la arquitectura MVVM. 
Se sigue el patrón coordinator para definir el flujo de pantallas.
La decodificación de objetos prepara el objeto para almacenarlo de forma persistente (aunque solo se usa en la persistencia del token).


![](first.gif)  ![](second.gif)
