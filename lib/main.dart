import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Cart.dart';
import 'package:task/ProductList.dart';
import 'package:task/mycart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
      child: MaterialApp(
        home: Main(),
      ),
    );
  }
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _index=0;
  List<Widget> rote=[ProductList(),mycart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rote[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: (_index==0)?Colors.blue:Colors.black87,),label: " ",),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: (_index==1)?Colors.blue:Colors.black87,),label: " ",),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index=index;
          });
        },
      ),
    );
  }
}


