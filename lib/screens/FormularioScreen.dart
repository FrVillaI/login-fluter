import 'package:firebase_database/firebase_database.dart'; 
import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(Formulario()); 
} 
 
class Formulario extends StatelessWidget { 
  const Formulario({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return const MaterialApp( 
      home:Home(), 
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
      body: Cuerpo(), 
    ); 
  } 
} 
 
Widget Cuerpo(){ 
  return( 
    Column( 
      children: <Widget>[ 
        Text("Formulario"), 
        CampoId(), 
        CampoProducto(), 
        CampoPrecio(), 
        BotonGuardar(), 
      ], 
      ) 
  ); 
} 
 
final TextEditingController _id = TextEditingController(); 
Widget CampoId(){ 
  return( 
    TextField( 
      controller: _id, 
      decoration: InputDecoration( 
        hintText: "Ingresar ID" 
      ), 
    ) 
  ); 
} 
 
final TextEditingController _precio = TextEditingController(); 
Widget CampoProducto(){ 
  return( 
    TextField( 
      controller: _producto, 
      decoration: InputDecoration( 
        hintText: "Ingresar Producto" 
      ), 
    ) 
  ); 
} 
 
final TextEditingController _producto = TextEditingController(); 
Widget CampoPrecio(){ 
  return( 
    TextField( 
      controller: _precio, 
      decoration: InputDecoration( 
        hintText: "Ingresar Precio" 
      ), 
    ) 
  ); 
} 
 
Widget BotonGuardar(){ 
  return( 
    FilledButton( 
      onPressed: (){ 
        guardar(); 
      },child: Text("Guardar"), 
    ) 
  ); 
} 
 
Future <void> guardar()async{ 
  DatabaseReference ref= FirebaseDatabase.instance.ref("producto/"+_id.text); 
  await ref.set({ 
    "id":_id.text, 
    "producto":_producto.text, 
    "precio":_precio.text 
  }); 
}