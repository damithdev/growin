import 'dart:async';

import 'package:flutter/material.dart';
import 'package:growin/http/GrowinApi.dart';
import 'package:growin/model/User.dart';
import 'package:growin/UserGetStarted.dart';
import 'package:growin/OnBoardView.dart';

import 'util/DefaultColorScheme.dart';
import 'dashboard/UserDashboard.dart';
import 'auth/UserMobileNumberVerification.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  fetch() async{
    User user = await GrowinApi().user();
//    if(user.createdIn!=null){
//      if(user.isEmailVerified){
//        Navigator.pushAndRemoveUntil(
//          context,
//          MaterialPageRoute(builder: (context) => Dashboard(user: user)),
//              (Route<dynamic> route) => false,
//        );
//      }else{
//        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext coontext)=>EmailVerify(user: user)));
//      }
//    }else{
//      Navigator.of(context).pushReplacement(MaterialPageRoute(
//          builder: (BuildContext context) => OnBoard()));
//    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => OnBoardView()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => fetch());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/images/growin.png",width: 150,filterQuality: FilterQuality.high,),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(DefaultColorScheme.primaryColor),

              ),
            )
          ],
        )
      ),
    );
  }
}
