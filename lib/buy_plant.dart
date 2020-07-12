import 'package:flutter/material.dart';
import 'package:growin/core/GWidgets.dart';

import 'core/User.dart';


class Checkout extends StatefulWidget {

  final User user;
  final Garden garden;


  Checkout(this.user, this.garden);

  @override
  _CheckoutState createState() => _CheckoutState(user,garden);
}

class _CheckoutState extends State<Checkout> {

  final User user;
  final Garden garden;

  List<bool> paymentType = [false,true];

  _CheckoutState(this.user, this.garden);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Checkout",style: TextStyle(fontSize: 15),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.of(context).pop();
        },),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text("For Payment",style: TextStyle(fontSize: 18,color: Colors.black38),)
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("${garden.plantName}",style: TextStyle(fontSize: 15,color: Colors.grey),),
                        Text("Rs. ${garden.price}.00",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w600),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(5),
                  isSelected: paymentType,
                  onPressed: (int){
                    setState(() {
                      if(int==0){
                        paymentType[0] = true;
                        paymentType[1] = false;
                      }else{
                        paymentType[1] = true;
                        paymentType[0] = false;
                      }

                    });
                  },
                  constraints: BoxConstraints(
                    minWidth: 0
                  ),
                  fillColor: Colors.blue,
                  borderColor: Colors.blue[200],
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 11,bottom: 11),
                        child: Text("Online Payment",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: paymentType[0]?Colors.white:Colors.blue[200]),)),
                    Container(
                        padding: EdgeInsets.only(left: 8,right: 8,top: 11,bottom: 11),
                        child: Text("Bank Payment",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: paymentType[1]?Colors.white:Colors.blue[200])),
                    )
                  ],
                ),
              ),
            ),
            paymentType[0]?Container(
              height: 200,
              child: Center(
                child: Text("Coming Soon",style: TextStyle(fontSize: 20,color: Colors.grey),),
              ),
            ):Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Bank Deposit/Transfer ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.grey),),
                  SizedBox(height: 25,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Bank Name ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                      ),
                      Expanded(
                        child: Text("Commerical Bank",style: TextStyle(fontSize: 14,color: Colors.black),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Account Name ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                      ),
                      Expanded(
                        child: Text("A.Haniman",style: TextStyle(fontSize: 14,color: Colors.black),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Account Number ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                      ),
                      Expanded(
                        child: Text("18974738758",style: TextStyle(fontSize: 14,color: Colors.black),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Branch ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                      ),
                      Expanded(
                        child: Text("Wellwatha",style: TextStyle(fontSize: 14,color: Colors.black),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text("Brach Code ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                      ),
                      Expanded(
                        child: Text("010",style: TextStyle(fontSize: 14,color: Colors.black),),
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text("Payment instruction",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.grey),),
                  SizedBox(height: 25,),
                  Text("Send your Bank slip or transaction screenshot to our email/WhatsApp/Viber with your payment PIN code",style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 10,)



                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(15),
              child: PrimaryButton(
                text: "Confirm Order",
                onPress:paymentType[0]?null:(){

                },

              ),
            )

          ],
        ),
      ),

    );
  }
}
