import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../http/CountryList.dart';


class CountrySelector extends StatefulWidget {
  @override
  _CountrySelectorState createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {


  List<Map> _cList;
  String str = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _cList = codes;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFBFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          icon: new Icon(Icons.arrow_back,size: 27,),
          onPressed: ()=>{
            Navigator.pop(context)
          },
        ),
        title: Text("Select country",style: TextStyle(fontSize: 16),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20,top: 5),
            child: TextField(
              onChanged: ((strx){
                setState(() {
                 _cList =  codes.where((element) => element['name'].toString().toLowerCase().startsWith(strx.toLowerCase())).toList();
                });
              }),
              decoration: InputDecoration.collapsed(
                hintText: "Search",
              ),


            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _cList.length,
        itemBuilder: (context, index) {
          return new InkWell(
            onTap: ()=>{
              Navigator.pop(context,_cList[index])
            },
            child:Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Container(child: new Text('${_cList[index]["dial_code"]}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                    width: 50,
                  ),
                  new Text('${_cList[index]["name"]}',style: TextStyle(fontSize: 14))
                ],
              ),
            ),
          );
        },
      ),
    );
  }



}
