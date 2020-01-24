import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String time;
  String location;
  String flag;
  String url;

  WorldTime({this.location, this.url, this.flag});

  //!funciones asincronas
  /*
  *! Las funciones asincronas no se ejecutan hasta que transcurre el tiempo
  *! que se le pasa como primer parametro. Lo bueno es que si salgo de esa
  *! ventana, aun asi el tiempo sigue transcurriendo.

  *! Se debe usar async y await para que funcionen.
  *! async dice que es un funcion asincrona
  *! await no ejecuta la funcion hasta que no transcurre el tiempo
  *! Las funciones asincronas no detienen la ejecucion del programa
  */

  void getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$url");
      Map datos = jsonDecode(response.body);
      // print(datos);
      // print(datos['title']);

      String data = datos['datetime'];
      // print(data);

      DateTime now = DateTime.parse(data);
      now = now.add(Duration(hours: int.parse(datos['abbreviation'])));
      time = DateFormat.Hm().format(now);
      // time = now.toString();
    } catch (error) {
      print(error);
      time = 'Se ha producido un error. No es posible obtener la hora actual';
    }
  }
}
