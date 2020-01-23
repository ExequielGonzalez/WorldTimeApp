import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
  void getData() async {
    Response response =
        await get('https://jsonplaceholder.typicode.com/todos/1');
    Map datos = jsonDecode(response.body);
    print(datos);
    print(datos['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
