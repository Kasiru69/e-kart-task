import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';
class mycart extends StatefulWidget {
  const mycart({super.key});

  @override
  State<mycart> createState() => _mycartState();
}

class _mycartState extends State<mycart> {
  List<int> _arr1=[];
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text("My cart",style: TextStyle(color: Colors.black87),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height-300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all()),
              child: ListView.builder(itemCount:cart.list1().length,itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${cart.list2()[index]}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price : ${cart.list3()[index]} inr"),
                            IconButton(onPressed: (){
                              setState(() {
                                cart.removefromcart(cart.list1()[index]);
                              });
                            }, icon: Icon(Icons.delete))
                          ],
                        )
                      ],
                    )
                  ),
                );
              }),
            ),
            Container(
              height: 148,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total price ",style: TextStyle(fontSize: 30),),
                  Text("${cart.Price()} inr",style: TextStyle(fontSize: 30),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

