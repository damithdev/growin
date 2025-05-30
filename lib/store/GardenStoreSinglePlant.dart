import 'package:flutter/material.dart';
import 'package:growin/model/Garden.dart';
import 'package:growin/store/GardenStoreCheckout.dart';
import 'package:growin/util/CustomWidget.dart';
import 'package:growin/model/User.dart';


class GardenStoreSinglePlant extends StatefulWidget {

  final Garden garden;
  final User user;

  const GardenStoreSinglePlant({Key key, this.garden, this.user}) : super(key: key);




  @override
  _GardenStoreSinglePlantState createState() => _GardenStoreSinglePlantState(garden,user);
}

class _GardenStoreSinglePlantState extends State<GardenStoreSinglePlant> {

  final Garden garden;
  final User user;

  _GardenStoreSinglePlantState(this.garden, this.user);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: new Icon(
            Icons.arrow_back,
            size: 27,
            color: Color(0xff858585),
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.help_outline,
              size: 27,
              color: Color(0xff858585),
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    "assets/images/growlit.png",
                    width: 80,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    "assets/images/Garden.png",
                    width: 130,
                  )
                ],
              ),
            ),
          ),
          Align(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 100,),
                          Text(garden.plantName,style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),),
                          SizedBox(height: 20,),
                          SizedBox(
                            width: 290,
                            child: Text(garden.description,style: TextStyle(fontSize: 16,color: Colors.grey[500]),textAlign: TextAlign.center,),
                          ),
                          SizedBox(height: 40,),
                          Text("${garden.price.toDouble()}0 LKR",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 300),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40,right: 20),
                            child: FadeInImage.assetNetwork(
                              placeholder:"assets/images/pldddant.png" ,
                              image: garden.plantImage,
                              fit: BoxFit.fitWidth,
                              width: 170,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Container(
                              padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                              decoration: BoxDecoration(
                                  color: Color(0xffF0F0F0),
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset("assets/images/coin.png",width: 17,),
                                  SizedBox(width: 5,),
                                  Text(garden.price.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,bottom: MediaQuery.of(context).padding.bottom+30),
                      child: PrimaryButton(
                        text: "Buy now",
                        onPress: ((){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext bcontext)=>GardenStoreCheckout(user,garden)));
                        }),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
