import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Cart.dart';
import 'package:task/fetchdata.dart';
import 'package:task/productdetails.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> _arr=[];
  //Cart cart=Provider.of<Cart>(context);
  void initState()
  {
    fetch().then((List<dynamic> arr){
      setState(() {
        _arr=arr;
      });
    });
    print(_arr);
  }
  Future<List<dynamic>> fetch()async{
    var data=await fetchdata("https://fakestoreapi.com/products");
    List<dynamic> decode=jsonDecode(data);
    return decode;
    //print(decode);
    //print(decode.length);
  }
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Products",style: TextStyle(color: Colors.black87),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(itemCount:_arr.length,itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => productdetails(_arr[index]['id'],_arr[index]['category'],_arr[index]['image'],_arr[index]['title'],_arr[index]['price']*1.0,_arr[index]['description'])),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: MediaQuery.of(context).size.height/4,width: MediaQuery.of(context).size.width/2,
                    color: Colors.white54,
                      child: Image.network(_arr[index]['image'],fit: BoxFit.fill,),
                    ),
                    Text("${_arr[index]['title']}"),
                    Text("Price : ${_arr[index]['price']} inr"),
                    ElevatedButton(
                        onPressed: (){
                      setState(() {
                        if(!cart.ispresent(_arr[index]['id'])) cart.addtocart(_arr[index]['id'],_arr[index]['title'],_arr[index]['price']*1.0);
                        else cart.removefromcart(_arr[index]['id']);
                      });
                      print(cart.list1());
                      //else cart.removefromcart(_arr[index]['id']);
                    }, child: (cart.ispresent(_arr[index]['id']))?Text("Remove from Cart"):Text("Add to cart"))
                  ],
                )
              ),
            ),
          );
        }),
      ),
    );
  }
}

