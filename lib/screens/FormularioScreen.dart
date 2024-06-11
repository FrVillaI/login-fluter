import 'package:flutter/material.dart';

void main(){
  runApp(Formulario());
}

class Formulario extends StatelessWidget {
  const Formulario({super.key});

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
        title: const Text('Formulario'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return (Column(
    children: <Widget>[
      Text("Ingrese sus datos"),
      IdField(),
      NombreField(),
      PrecioField(),
      DescripcionField(),
    ],
  ));
}


final TextEditingController _idController = TextEditingController();
final TextEditingController _nombreController = TextEditingController();
final TextEditingController _precioController = TextEditingController();
final TextEditingController _descripcionController = TextEditingController();

Widget IdField() {
  return TextFormField(
    controller: _idController,
    decoration: const InputDecoration(
      hintText: 'Ingrese el ID',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese el ID';
      }
      return null;
    },
  );
}

Widget NombreField() {
  return TextFormField(
    controller: _nombreController,
    decoration: const InputDecoration(
      hintText: 'Ingrese el Nombre',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese el nombre';
      }
      return null;
    },
  );
}

Widget PrecioField() {
  return TextFormField(
    controller: _precioController,
    decoration: const InputDecoration(
      hintText: 'Ingrese el precio',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese el precio';
      }
      return null;
    },
  );
}

Widget DescripcionField() {
  return TextFormField(
    controller: _descripcionController,
    decoration: const InputDecoration(
      hintText: 'Ingrese la descripcion',
      fillColor: Colors.white,
      filled: true,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Por favor ingrese la descripcion';
      }
      return null;
    },
  );
}