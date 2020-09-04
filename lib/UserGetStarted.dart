import 'package:flutter/material.dart';
import 'package:growin/util/CustomWidget.dart';
import 'package:growin/util/DefaultColorScheme.dart';
import 'package:growin/auth/UserSignIn.dart';
import 'package:growin/signup/UserSignUp.dart';

class UserGetStarted extends StatefulWidget {
  @override
  _UserGetStartedState createState() => _UserGetStartedState();
}

class _UserGetStartedState extends State<UserGetStarted> {
  @override
  Widget build(BuildContext context) {

    var mediaQuary = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/sback.png",alignment: Alignment.bottomCenter,width: double.infinity,fit: BoxFit.cover,)
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        child: Text("SIGN IN",style: TextStyle(color: DefaultColorScheme.primaryColor,fontSize: 15),),
                        onPressed: ()=>{
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>UserSignIn()))

                        },
                      ),
                    ),
                  ),
                  Image.asset("assets/images/growin.png",width: 100,filterQuality: FilterQuality.high,),
                  Text("Cultivate today\nHarvest tomorrow",style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:mediaQuary+20 ,left: 20,right: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child:PrimaryButton(
                  text: "GET STARTED",
                  onPress: ((){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>new UserSignUp()));
                  }),
                )
              ),
            )
          ],
        )
      )
    );
  }
}
