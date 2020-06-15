import 'package:flutter/material.dart';
import 'package:growin/core/GWidgets.dart';
import 'package:growin/core/User.dart';
import 'package:growin/store.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'core/GrowinApi.dart';

class Dashboard extends StatefulWidget {
  final User user;

  const Dashboard({Key key, this.user}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState(user);
}

class _DashboardState extends State<Dashboard> {
  User user;

  _DashboardState(this.user);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  void _onRefresh() async {
    User userx = await GrowinAPI().user();
    _refreshController.refreshCompleted();

    if (userx.createdIn != null) {
      setState(() {
        user = userx;
      });
    } else {}
  }

  void _onLoading() async {
    User userx = await GrowinAPI().user();
    if (userx.createdIn != null) {
      setState(() {
        user = userx;
      });
    } else {}
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFD),
      drawer: Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width - 50,
            child: Drawer(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 25,
                        right: 20,
                        bottom: MediaQuery.of(context).padding.bottom + 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/growin.png",
                          width: 100,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "${user.firstName} ${user.lastName}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${user.email}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          onTap: (() {}),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffFFC785),
                            child: Image.asset(
                              "assets/images/userx.png",
                              width: 20,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          title: Text(
                            "My Account",
                            style: TextStyle(
                                color: Color(0xff535353), fontSize: 15),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff535353),
                            size: 18,
                          ),
                        ),
                        ListTile(
                          onTap: (() {}),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xffFFA19E),
                            child: Image.asset(
                              "assets/images/withdrawmoney.png",
                              width: 20,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          title: Text(
                            "Transaction history",
                            style: TextStyle(
                                color: Color(0xff535353), fontSize: 15),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff535353),
                            size: 18,
                          ),
                        ),
                        ListTile(
                          onTap: (() {}),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff8DE4FF),
                            child: Image.asset(
                              "assets/images/gear.png",
                              width: 20,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          title: Text(
                            "Setting",
                            style: TextStyle(
                                color: Color(0xff535353), fontSize: 15),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff535353),
                            size: 18,
                          ),
                        ),
                        ListTile(
                          onTap: (() {}),
                          contentPadding: EdgeInsets.all(0),
                          leading: CircleAvatar(
                            backgroundColor: Color(0xff7DFFE2),
                            child: Image.asset(
                              "assets/images/question.png",
                              width: 20,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                          title: Text(
                            "Support Center",
                            style: TextStyle(
                                color: Color(0xff535353), fontSize: 15),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xff535353),
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: MediaQuery.of(context).padding.bottom + 40),
                      child: PrimaryButton(
                        icon: Image.asset(
                          "assets/images/refer.png",
                          width: 30,
                          filterQuality: FilterQuality.high,
                        ),
                        onPress: (() {}),
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
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xff858585),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color(0xff858585),
            ),
            onPressed: () => {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SmartRefresher(
            controller: _refreshController,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: Stack(
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
                      new Text(
                        "Good ${greeting()}",
                        style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      new Text(
                        "${user.firstName} ${user.lastName}",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Visibility(
                        child: notPlant(),
                        visible: false,
                      ),
                      Visibility(
                        child: plantView(),
                        visible: true,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).padding.bottom + 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: PrimaryButton(
                        text: "Buy a Plant",
                        onPress: (() => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => Store()))
                            }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: DraggableScrollableSheet(
              minChildSize: 0.2,
              initialChildSize: 0.2,
              builder: (context, scrollController) {
                return scoreBoard(scrollController);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget scoreBoard(scorllControl) {
    return SingleChildScrollView(
      controller: scorllControl,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              width: 80,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Your earned points ",style: TextStyle(fontSize: 14,color: Colors.grey),),
                            SizedBox(width: 5,),
                            Icon(Icons.info_outline,color: Color(0xff20BFF1),size: 20,)
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset("assets/images/coin.png",width: 40,),
                            SizedBox(width: 10,),
                            Text("1004",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                          ],
                        )

                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){

                    },
                    padding: EdgeInsets.all(0),
                    elevation: 1.4,
                    shape: CircleBorder(

                    ),
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration:BoxDecoration(
                            gradient:LinearGradient(colors: [Color(0xff25CBA6), Color(0xff44EC96)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(60)
                        ),
                        child: Image.asset("assets/images/water.png",width: 30,),
                      ),
                    ),
                  )

                ],
              ),
            ),
            Divider(),
            Container(
              height: 1000,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Points of the week",style: TextStyle(fontSize: 15,color: Colors.grey),),
                      InkWell(
                        onTap: (){

                        },
                        child: Text("View all",style: TextStyle(fontSize: 15,color: Color(0xff25CBA6)),),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget plantView() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.only(top: 130),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120,
                      ),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Barberton Daisy",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("24 days ",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff25CBA6))),
                              Text(
                                "left in 100 days",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/smile.png",
                              width: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Your plant Health",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                  Text(
                                    "10%",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Color(0xff25CBA6))),
                        child: Text(
                          "Upgrade",
                          style: TextStyle(color: Color(0xff25CBA6)),
                        ),
                        onPressed: (() {}),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 20, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.red,
                        size: 17,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Waiting for payment approval",
                        style: TextStyle(fontSize: 14, color: Colors.redAccent),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Align(
                  child: Image.asset(
                    "assets/images/pldddant.png",
                    width: 130,
                    fit: BoxFit.contain,
                  ),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 17),
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        color: Color(0xffF0F0F0),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/coin.png",
                          width: 17,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "500",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget notPlant() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/emsx.png",
              width: 800,
            ),
            Text(
              "You don't have any plants",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "To begin, buy a plant from us to grow in your garden.",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
