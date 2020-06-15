import 'package:flutter/material.dart';
import 'package:growin/core/GrowinApi.dart';
import 'package:growin/core/User.dart';
import 'package:growin/plantView.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Store extends StatefulWidget {
  final User user;

  const Store({Key key, this.user}) : super(key: key);

  @override
  _StoreState createState() => _StoreState(user);
}

class _StoreState extends State<Store> {

  final User user;



  RefreshController _refreshController = RefreshController(initialRefresh: false);
  bool loader =true;
  List<Garden> gardenList = [];

  _StoreState(this.user);

  void _onRefresh() async{
    List<Garden> glist = await GrowinAPI().getGarden();
    _refreshController.refreshCompleted();

    if(glist!=null){
      setState(() {
        gardenList = glist;
      });

    }else{

    }

  }

  void _onLoading() async{

    List<Garden> glist = await GrowinAPI().getGarden();
    if(glist!=null){
      setState(() {
        gardenList = glist;
      });

    }else{

    }
    _refreshController.refreshCompleted();

  }

  loadData() async{
    setState(() {
      loader=true;
    });
    List<Garden> glist = await GrowinAPI().getGarden();
    setState(() {
      loader=false;
    });
    if(glist!=null){
      setState(() {
        gardenList = glist;
      });
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }







  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFAFBFD),
        body: SmartRefresher(
          controller: _refreshController,
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xff25CBA6), Color(0xff44EC96)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
                  padding: EdgeInsets.all(20),
                  child: Align(
                    alignment: Alignment.centerLeft,
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
                if (loader) Container(
                    margin: EdgeInsets.only(top: 160,bottom: 60),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        plantLoader()
                      ],
                    ),
                ) else gardenList.length!=0?Container(
                  margin: EdgeInsets.only(top: 160,bottom: 60),
                  child: ListView.builder(
                    itemCount: gardenList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (content,index){
                      return plantItem(gardenList[index]);
                    },
                  ),
                ):Container(),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: new Icon(
                      Icons.arrow_back,
                      size: 27,
                      color: Colors.white,
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: new Icon(
                        Icons.help_outline,
                        size: 27,
                        color: Colors.white,
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }



  Widget plantItem(Garden garden){
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Stack(
        children: <Widget>[
          Align(
            child: RaisedButton(
              elevation: 0,
              onPressed: ((){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>PlantView(garden: garden,user:user)));
              }),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(0.0),
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(
                            0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            garden.plantName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: (() {
                              openLink(garden.descriptionLink);
                            }),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.info_outline,
                                  size: 17,
                                  color: Color(0xff20BFF1),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  "About this plant",
                                  style: TextStyle(
                                      color: Color(0xff20bff1),
                                      fontWeight: FontWeight.w300
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text("${garden.price.toDouble()} LKR",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 20),
                  child: FadeInImage.assetNetwork(
                    placeholder:"assets/images/pldddant.png" ,
                    image: garden.plantImage,
                    fit: BoxFit.fitWidth,
                    width: 120,
                  ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
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
          )

        ],
      ),
    );
  }

  void openLink(url) async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {

    }
  }


  Widget plantLoader(){
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Stack(
        children: <Widget>[
          Align(
            child: RaisedButton(
              elevation: 0,
              onPressed: ((){

              }),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.all(0.0),
              child: InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(
                            0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[100],
                            enabled: true,
                            child: Container(
                              color: Colors.white,
                              width: 190,
                              height: 25,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: (() {}),
                            child: Row(
                              children: <Widget>[
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[200],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: Container(
                                    color: Colors.white,
                                    width: 120,
                                    height: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200],
                        highlightColor: Colors.grey[100],
                        enabled: true,
                        child: Container(
                          color: Colors.white,
                          width: 100,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 20),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      enabled: true,

                      child: Image.asset(
                        "assets/images/pldddant.png",
                        width: 120,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[200],
                      highlightColor: Colors.grey[100],
                      enabled: true,
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
                            Text("500",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13),)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
