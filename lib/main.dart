import 'package:app_flutter_login_firebase/screens/FormularioScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:app_flutter_login_firebase/screens/Productos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './screens/LoginScreen.dart';
import './screens/RegistroScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Fire());
}

class Fire extends StatelessWidget {
  const Fire({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Título'),
      ),
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context) {
  return Column(
    children: <Widget>[
      Text("Bienvenido"),
      botonLogin(context),
      botonRegistro(context),
      botonProductos(context),
      botonFormulario(context)
    ],
  );
}

Widget botonLogin(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
      child: Text("Login"));
}

Widget botonRegistro(BuildContext context) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Registro()));
      },
      child: Text("Registro"));
}

Widget botonProductos(BuildContext context) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Productos()));
      },
      child: Text("Productos"));
}

Widget botonFormulario(BuildContext context) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.amber)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Formulario()));
      },
      child: Text("Formulario"));
}
