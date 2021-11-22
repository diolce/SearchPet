# SearchPet

Aplicacion de prueba que obtiene sus datos de la api https://www.petfinder.com/developers/v2/docs/, se permite listar animales, buscar por tipo de animal y acceder al detalle, en la segunda pestaña marca en el mapa anotaciones con las organizaciones cerca de la localización buscada asi como buscar las organizacion cercanas a un punto marcado en el mapa. Esta preparada para el almacenamiento de datos provenientes del servidor.


#### Prerquisitos para el funcionamiento del projecto
* Crear una cuenta en la api para generar una api_key y el client_secret necesario para el funcionamiento del servicio 
* Al ejecutar el pod install nos pedira a traves del plugin de cocoapods-keys las credenciales necesarias, las introducimos y RUN

# Arquitectura 
Se sigue la arquitectura MVVM 
Se sigue el patron coordinator para definir el flujo de pantallas.
La decodificacion de objetos prepara el objeto para almacenarlo de forma persistente
Se usa realm para almacenar el token bearer


![](name-of-giphy.gif)
