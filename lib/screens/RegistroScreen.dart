import './LoginScreen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

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
        title: const Text('Registro'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return (Column(
    children: <Widget>[
      Text("Ingrese sus datos"),
      CorreoField(),
      ContraseniaField(),
      BotonRegistro(context)
    ],
  ));
}


final TextEditingController _correoController = TextEditingController();

Widget CorreoField() {
  return TextFormField(
    controller: _correoController,
    decoration: const InputDecoration(
      hintText: 'Ingrese el correo electronico',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese el correo electronico';
      }
      return null;
    },
  );
}

final TextEditingController _contraseniaController = TextEditingController();

Widget ContraseniaField() {
  return TextFormField(
    controller: _contraseniaController,
    decoration: const InputDecoration(
      hintText: 'Ingrese la contraseña',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese la contraseña';
      }
      return null;
    },
  );
}

Widget BotonRegistro(context) {
  return (FilledButton(
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 35, 150, 0))),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
      },
      child: Text("Registrarse")));
}
