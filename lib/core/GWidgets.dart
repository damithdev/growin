import 'package:flutter/material.dart';


class PrimaryButton extends StatelessWidget {

  PrimaryButton({@required this.text,@required this.onPress,this.loading=false,this.icon});

  String text;
  VoidCallback onPress;
  bool loading;

  Widget icon;


  @override
  Widget build(BuildContext context) {
    if(!loading){
      return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.all(0.0),
        elevation: 0.9,
        onPressed: onPress,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(this.icon!=null?15:20),
            decoration:BoxDecoration(
                gradient:onPress!=null?LinearGradient(colors: [Color(0xff25CBA6), Color(0xff44EC96)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ):null,
                color: onPress==null?Colors.grey[300]:null,
                borderRadius: BorderRadius.circular(8.0)
            ),
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                this.icon!=null?this.icon:SizedBox(),
                this.icon!=null?SizedBox(width: 20,):SizedBox(),
                Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
              ],
            ),
          ),
        ),
      );
    }else{
      return loader();
    }

  }


  Widget loader(){
    return Container(
      padding: EdgeInsets.all(20),
      decoration:BoxDecoration(
          gradient:onPress!=null?LinearGradient(colors: [Color(0xff25CBA6), Color(0xff44EC96)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ):null,
          color: onPress==null?Colors.grey[300]:null,
          borderRadius: BorderRadius.circular(8.0)
      ),
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
          ),
          SizedBox(width: 20,),
          Text("Loading",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
        ],
      ),
    );
  }
}


class PrimaryFloat extends StatelessWidget {

  PrimaryFloat({@required this.onPress,this.loading=false,this.icon});

  String text;
  VoidCallback onPress;
  bool loading;

  Widget icon;


  @override
  Widget build(BuildContext context) {
    if(!loading){
      return RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        padding: EdgeInsets.all(0.0),
        elevation: 0.9,
        onPressed: onPress,
        child: InkWell(
          child: Container(
            decoration:BoxDecoration(
                gradient:onPress!=null?LinearGradient(colors: [Color(0xff25CBA6), Color(0xff44EC96)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ):null,
                color: onPress==null?Colors.grey[300]:null,
                borderRadius: BorderRadius.circular(8.0)
            ),
            width: 30,
            child: Text("hello")
          ),
        ),
      );
    }else{
      return loader();
    }

  }


  Widget loader(){
    return Container(
      padding: EdgeInsets.all(20),
      decoration:BoxDecoration(
          gradient:onPress!=null?LinearGradient(colors: [Color(0xff25CBA6), Color(0xff44EC96)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ):null,
          color: onPress==null?Colors.grey[300]:null,
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
          ),
          SizedBox(width: 20,),
          Text("Loading",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
        ],
      ),
    );
  }
}
