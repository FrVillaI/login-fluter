import 'package:firebase_database/firebase_database.dart'; 
import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(Productos()); 
} 
 
class Productos extends StatelessWidget { 
  const Productos({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      home: Lista(), 
    ); 
  } 
} 
 
class Lista extends StatefulWidget { 
  @override 
  _ListaState createState() => _ListaState(); 
} 
 
class _ListaState extends State<Lista> { 
  List<Map<dynamic, dynamic>> productList = []; 
 
  @override 
  void initState() { 
    super.initState(); 
    getData(); 
  } 
 
  void getData() { 
    DatabaseReference productoRef = FirebaseDatabase.instance.ref('producto'); 
    productoRef.onValue.listen((DatabaseEvent event) { 
      final data = event.snapshot.value; 
      updateProductList(data); 
    }); 
  } 
 
  void updateProductList(dynamic data) { 
    if (data != null && data is Map<dynamic, dynamic>) { 
      List<Map<dynamic, dynamic>> tempList = []; 
      data.forEach((key, value) { 
        if (value is Map<dynamic, dynamic>) {
          tempList.add({ 
            "producto": value['producto'],  
            "precio": value['precio']
          });
        }
      }); 
 
      setState(() { 
        productList = tempList; 
      }); 
    } 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text('Firebase ListView'), 
      ), 
      body: ListView.builder( 
        itemCount: productList.length, 
        itemBuilder: (context, index) { 
          return ListTile( 
            title: Text('${productList[index]["producto"]}'), 
            subtitle: Text('${productList[index]["precio"]}'),             
          ); 
        }, 
      ), 
    ); 
  } 
}
