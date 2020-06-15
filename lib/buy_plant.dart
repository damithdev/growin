import 'package:flutter/material.dart';
import 'package:growin/core/User.dart';



class BuyPlant extends StatefulWidget {

  final Garden garden;
  final User user;

  const BuyPlant({Key key, this.garden, this.user}) : super(key: key);




  @override
  _BuyPlantState createState() => _BuyPlantState(garden,user);
}

class _BuyPlantState extends State<BuyPlant> {

  final Garden garden;
  final User user;

  _BuyPlantState(this.garden, this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text("Checkout",style: TextStyle(fontSize: 17),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ((){
            Navigator.of(context).pop();
          }),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: ((){

            }),
          )
        ],
      ),
      body:Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("${garden.price}.00 LKR",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w700),),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("Plant coins amount",style: TextStyle(color: Colors.grey[600],fontSize: 14),),
                            SizedBox(height: 5,),
                            Row(
                              children: <Widget>[
                                Text(garden.price.toString(),style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),),
                                SizedBox(width: 5,),
                                Image.asset("assets/images/coin.png",width: 20,)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Plant",style: TextStyle(fontSize: 15,color: Colors.grey),),
                      SizedBox(height: 20,),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(garden.plantName,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                        subtitle: Row(
                          children: <Widget>[
                            Text("Life time",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            SizedBox(width: 5,),
                            Text("100 Days",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff25CBA6)),)
                          ],
                        ),
                        leading:  CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffBBFADA),
                          child: Image.asset("assets/images/leaf.png",width: 30,filterQuality: FilterQuality.high,),
                        ),
                      )
                    ],
                  ),

                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding:EdgeInsets.only(left: 20,right: 20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Attention Please",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black54),),
                      SizedBox(height: 20,),
                      Text("Please pay before 7 days from order place date.\nPayment Confirmation process take 2 business days.\nYou can't water your plant in Every week on Sunday",style: TextStyle(fontSize: 15,color: Colors.grey[500],fontWeight: FontWeight.w500))


                    ],
                  )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: MediaQuery.of(context).padding.bottom+50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                    onPressed: ()=>{

                    },
                    color: Colors.blueGrey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Container(
                      padding: EdgeInsets.all(18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Pay by Bank",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                          Icon(Icons.arrow_forward,color: Colors.white,size: 30,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
