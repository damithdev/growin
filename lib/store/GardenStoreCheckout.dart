import 'package:flutter/material.dart';
import 'package:growin/model/Garden.dart';
import 'package:growin/util/CustomWidget.dart';
import 'package:growin/util/PaymentType.dart';

import '../model/User.dart';


class GardenStoreCheckout extends StatefulWidget {

  final User user;
  final Garden garden;


  GardenStoreCheckout(this.user, this.garden);

  @override
  _GardenStoreCheckoutState createState() => _GardenStoreCheckoutState(user,garden);
}

class _GardenStoreCheckoutState extends State<GardenStoreCheckout> {

  final User user;
  final Garden garden;


  dynamic paymentType = PaymentType.bankDeposit;
  String referCode = "";


  _GardenStoreCheckoutState(this.user, this.garden);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Confirm Payment",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("DETAILS",style:TextStyle(fontSize: 14,color: Colors.grey[600])),
                  SizedBox(height: 30,),
                  Text(garden.plantName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Rs ${garden.price}.00",style: TextStyle(fontSize: 15),),
                  SizedBox(height: 20,),
                  Text("100 days of the lifetime of this plant. you can water your plant per day, and you can upgrade/downgrade your plant(upgrade or downgrade will not affect plant lifetime.",style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 10,),
                  FlatButton(
                    child: Text("Refer code",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.blue),),
                    onPressed: (){

                    },
                    padding: EdgeInsets.all(0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("PAYMENT METHOD",style:TextStyle(fontSize: 14,color: Colors.grey[600])),
                  SizedBox(height: 30,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child:Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  child: Icon(Icons.credit_card,color: paymentType==PaymentType.creditCard?Colors.white:Colors.black38,size: 43,),
                                  padding: EdgeInsets.all(15),
                                  decoration:paymentType==PaymentType.creditCard?BoxDecoration(
                                    color: Color(0xff44EC96),
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Color(0xff44EC96))
                                  ):BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.grey[300])

                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    paymentType = PaymentType.creditCard;
                                  });

                                },
                              ),
                              SizedBox(height: 20,),
                              Text("Credit Card",style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child:Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  child: Icon(Icons.account_balance,color: paymentType==PaymentType.bankDeposit?Colors.white:Colors.black38,size: 43,),
                                  padding: EdgeInsets.all(15),
                                  decoration:paymentType==PaymentType.bankDeposit?BoxDecoration(
                                      color: Color(0xff44EC96),
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Color(0xff44EC96))
                                  ):BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: Colors.grey[300])

                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    paymentType = PaymentType.bankDeposit;
                                  });
                                },
                              ),
                              SizedBox(height: 20,),
                              Text("Bank deposit",style: TextStyle(color: Colors.grey),)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      )
                    ],
                  )

                ],
              ),
            ),
            Visibility(child: Center(child: Text("Sorry online payment currently not available",style: TextStyle(color: Colors.red,fontSize: 14),)),
            visible: paymentType==PaymentType.creditCard,),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PrimaryButton(
                onPress: paymentType==PaymentType.creditCard?null:(){

                },
                text: "Confirm",
              ),
            )


          ],
        ),
      ),
    );
  }



}
