import 'dart:async';

import 'package:flutter/material.dart';
import 'package:growin/core/GrowinApi.dart';
import 'package:growin/core/User.dart';
import 'package:growin/getstart.dart';
import 'package:growin/onBoard.dart';

import 'core/PColors.dart';
import 'dashboard.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  fetch() async{
    User user = await GrowinAPI().user();
    if(user.createdIn!=null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(user: user)));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => OnBoard()));
    }
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
                valueColor: AlwaysStoppedAnimation(PColor.primaryColor),

              ),
            )
          ],
        )
      ),
    );
  }
}
