# Conexion

Estare usando el paquete connectivity con la version 0.4.9 para saber que tipo de conexion tiene el dispositivo.

Primero declare una variable selected de tipo int, para guardar que tipo de conexion existe donde:
0. No existe conexion
1. Red movil
2. Wifi

El paquete connectivity nos da la posibilidad de obtener un stream en el cual se escucha el tipo de conexion, lo cual nos permite saber cuando cambia la conexion cambia:

```
subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      getTypeOfConnection();
      setState(() {});
    });
```

Tambien cree un metodo que se mandara a llamar en el listen del stream para cambiar la interfaz de la aplicacion.

```
  getTypeOfConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      selected = 1;
      print("mobile");
      _pageController.jumpToPage(1);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      selected = 2;
      print("wifi");

      _pageController.jumpToPage(2);
    } else {
      // i am no connected
      selected = 0;
      print("No connection");
      _pageController.jumpToPage(0);
    }
  }
```

Lo demas es simplemente un pageview con su controller.