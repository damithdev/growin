import 'package:flutter/material.dart';
import 'package:growin/core/GWidgets.dart';
import 'package:growin/core/User.dart';



class Dashboard extends StatefulWidget {

  final User user;

  const Dashboard({Key key, this.user}) : super(key: key);



  @override
  _DashboardState createState() => _DashboardState(user);
}

class _DashboardState extends State<Dashboard> {

  final User user;

  _DashboardState(this.user);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello ${user.firstName}");
  }
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFD),
      drawer: Builder(
        builder: (BuildContext context){
          return Container(
            width: MediaQuery.of(context).size.width-50,
            child: Drawer(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 25,right: 20,bottom: MediaQuery.of(context).padding.bottom+20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset("assets/images/growin.png",width: 100,filterQuality: FilterQuality.high,),
                        SizedBox(
                          height: 30,
                        ),
                        Text("${user.firstName} ${user.lastName}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                        Text("${user.email}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey[600]),),
                        SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          onTap: ((){

                          }),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffFFC785),
                            child: Image.asset("assets/images/userx.png",width: 20,filterQuality: FilterQuality.high,),
                          ),
                          title: Text("My Account",style: TextStyle(color: Color(0xff535353),fontSize: 15),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xff535353),size: 18,),
                        ),
                        ListTile(
                          onTap: ((){

                          }),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffFFA19E),
                            child: Image.asset("assets/images/withdrawmoney.png",width: 20,filterQuality: FilterQuality.high,),
                          ),
                          title: Text("Transaction history",style: TextStyle(color: Color(0xff535353),fontSize: 15),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xff535353),size: 18,),
                        ),
                        ListTile(
                          onTap: ((){

                          }),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff8DE4FF),
                            child: Image.asset("assets/images/gear.png",width: 20,filterQuality: FilterQuality.high,),
                          ),
                          title: Text("Setting",style: TextStyle(color: Color(0xff535353),fontSize: 15),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xff535353),size: 18,),
                        ),
                        ListTile(
                          onTap: ((){

                          }),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff7DFFE2),
                            child: Image.asset("assets/images/question.png",width: 20,filterQuality: FilterQuality.high,),
                          ),
                          title: Text("Support Center",style: TextStyle(color: Color(0xff535353),fontSize: 15),),
                          trailing: Icon(Icons.arrow_forward_ios,color: Color(0xff535353),size: 18,),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,right: 20,bottom: MediaQuery.of(context).padding.bottom+40),
                      child: PrimaryButton(
                        icon: Image.asset("assets/images/refer.png",width: 30,filterQuality: FilterQuality.high,),
                        onPress: ((){

                        }),
                        text: "Refer Friend",
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Icon(Icons.menu,color: Color(0xff858585),),
              onPressed: ()=>Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,color: Color(0xff858585),),
            onPressed: ()=>{

            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/images/homebg.png"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Good morinig",style: TextStyle(fontSize: 20,color: Colors.grey[600]),),
                SizedBox(height: 5,),
                new Text("${user.firstName} ${user.lastName}",style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset("assets/images/emsx.png",width: 800,),
                        Text("You don't have any plants",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Text("To begin, buy a plant from us to grow in your garden.",style: TextStyle(color: Colors.grey[600],fontSize: 16),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: MediaQuery.of(context).padding.bottom+20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                text: "Buy a Plant",
                onPress: (()=>{

                }),
              ),
            ),
          )
        ],
      )
    );
  }
}
