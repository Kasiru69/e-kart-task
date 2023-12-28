import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';
class productdetails extends StatefulWidget {
  final String category,image,name,description;
  final double price;
  final int id;
  const productdetails(this.id,this.category,this.image,this.name,this.price,this.description, {Key? key}) : super(key: key);


  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  String _category="",_image="",_name="",_description="";
  double _price=0.0;
  int _id=0;
  void initState(){
    _id=widget.id;
    _category=widget.category;
    _image=widget.image;
    _name=widget.name;
    _description=widget.description;
    _price=widget.price;
  }
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Product Details",style: TextStyle(color: Colors.black87),),
        leading: IconButton(
          color: Colors.black87,
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("  ${_category}",style: TextStyle(fontSize: 30),),
              Container(
                height: 250,
                child: Image.network(_image,fit: BoxFit.fill,),
              ),
              Text("${_name}",style: TextStyle(fontSize: 15),),
              Text("Price : ${_price} inr",style: TextStyle(fontSize: 15),),
              Text("Details : ${_description}",style: TextStyle(fontSize: 15),),
              Text("Quantity : ${(cart.ispresent(_id))?1:0}"),
              ElevatedButton(onPressed: (){
                setState(() {
                  if(!cart.ispresent(_id)) cart.addtocart(_id,_name,_price*1.0);
                  else cart.removefromcart(_id);
                });
              }, child: (cart.ispresent(_id))?Text("Remove from Cart"):Text("Add to cart"))
            ],
          ),
        ),
      )
    );
  }
}
