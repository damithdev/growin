import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:growin/getstart.dart';

import 'core/PColors.dart';


class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  double page_number = 0;

  final _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              controller: _controller,
              onPageChanged:((val){
                setState(() {
                  page_number = val.toDouble();
                });
              }),
              children: <Widget>[
                screen1(),
                screen2(),
                screen3()
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FlatButton(
                  child: Text("Skip",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w400),),
                  onPressed: ()=>{
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => GetStart()))
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: MediaQuery.of(context).padding.bottom+20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DotsIndicator(
                        dotsCount: 3,
                        position: page_number,
                        decorator: DotsDecorator(
                          color: Colors.grey[300],
                          activeColor: PColor.primaryColor,
                        ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        page_number!=0?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: Text("Back",style: TextStyle(color: PColor.primaryColor,fontSize: 16,fontWeight: FontWeight.w300),),
                              onPressed: ()=>{
                                _controller.animateToPage(page_number.toInt()-1, duration: Duration(milliseconds: 300), curve: Curves.linear)
                              },
                            ),
                          ),
                        ):SizedBox(
                          width: 10,
                        ),
                        page_number==2?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: Text("Done",style: TextStyle(color: PColor.primaryColor,fontSize: 16,fontWeight: FontWeight.w300),),
                              onPressed: ()=>{
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) => GetStart()))

                              },
                            ),
                          ),
                        ):Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: Text("Next",style: TextStyle(color: PColor.primaryColor,fontSize: 16,fontWeight: FontWeight.w300),),
                              onPressed: ()=>{
                                _controller.animateToPage(page_number.toInt()+1, duration: Duration(milliseconds: 300), curve: Curves.linear)

                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget screen1(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/images/buy.png",alignment: Alignment.bottomCenter,width: double.infinity,height: MediaQuery.of(context).size.height-500,filterQuality: FilterQuality.high,fit: BoxFit.contain,),
        ),
        SizedBox(height: 0,),
        Padding(
          padding: const EdgeInsets.only(top: 0,left: 50,right: 50),
          child: Column(
            children: <Widget>[
              Text("Buy a Plant",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("To begin, buy a plant from us to grow in your garden.",style: TextStyle(fontSize: 16,color: Colors.grey[500]),textAlign: TextAlign.center,)
            ],
          ),
        )

      ],
    );
  }


  Widget screen2(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/images/watering.png",alignment: Alignment.bottomCenter,width: double.infinity,height: MediaQuery.of(context).size.height-500,filterQuality: FilterQuality.high,fit: BoxFit.contain,),
        ),
        SizedBox(height: 0,),
        Padding(
          padding: const EdgeInsets.only(top: 0,left: 50,right: 50),
          child: Column(
            children: <Widget>[
              Text("Take care of your plant everyday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("Receive reward coins when you water your plants everyday.",style: TextStyle(fontSize: 16,color: Colors.grey[500]),textAlign: TextAlign.center,)
            ],
          ),
        )

      ],
    );
  }


  Widget screen3(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Image.asset("assets/images/sell.png",alignment: Alignment.bottomCenter,width: double.infinity,height: MediaQuery.of(context).size.height-500,filterQuality: FilterQuality.high,fit: BoxFit.contain,),
        ),
        SizedBox(height: 0,),
        Padding(
          padding: const EdgeInsets.only(top: 0,left: 50,right: 50),
          child: Column(
            children: <Widget>[
              Text("Sell Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("You can resell your plant to us for a valuable rate after the completion of 100 days.",style: TextStyle(fontSize: 16,color: Colors.grey[500]),textAlign: TextAlign.center,)
            ],
          ),
        )

      ],
    );
  }
}
