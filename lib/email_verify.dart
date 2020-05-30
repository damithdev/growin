import 'package:flutter/material.dart';
import 'package:growin/core/GrowinApi.dart';
import 'package:growin/dashboard.dart';

import 'core/GWidgets.dart';
import 'core/PColors.dart';
import 'core/User.dart';


class EmailVerify extends StatefulWidget {
  final User user;

  const EmailVerify({Key key, this.user}) : super(key: key);




  @override
  _EmailVerifyState createState() => _EmailVerifyState(user);
}

class _EmailVerifyState extends State<EmailVerify> {

  final User user;

  String _otp = "";
  bool btnLoader = false;
  String _errorOtp = null;
  bool loader = true;

  _EmailVerifyState(this.user);

  otpSender() async{
    setState(() {
      loader=true;
    });

    bool isSend = await GrowinAPI().sendOtp();
    setState(() {
      loader=false;
    });
    if(isSend){

    }else{
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Otp code not send, try again")));
    }

  }

  otpVerify() async{
    setState(() {
      btnLoader=true;
    });

    bool isSend = await GrowinAPI().verifyOtp(_otp);
    setState(() {
      btnLoader=false;
    });
    if(isSend){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Dashboard(user: user,)),
            (Route<dynamic> route) => false,
      );

    }else{
      setState(() {
        _errorOtp="Invalid otp code.";
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(user);
    otpSender();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:loader?Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(PColor.primaryColor),

          ),
        ),
      ): SingleChildScrollView(
        child: Container(
          margin:EdgeInsets.only(top:  MediaQuery.of(context).padding.top+10,left: 10,right: 10),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: new Icon(Icons.arrow_back,size: 27,),
                onPressed: ()=>{
                  Navigator.pop(context)
                },
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Verify your email",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Row(
                        children: <Widget>[
                          Text("Enter 6 digit code. We sent via email\nto continue.",style: TextStyle(fontSize: 16,color: Colors.grey[500]),)
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: ((val){
                          setState(() {
                            _otp = val;
                          });
                        }),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorText: _errorOtp,
                          labelText: "OTP Code",
                          labelStyle: TextStyle(
                            fontSize: 14,

                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: PColor.primaryColor
                              )
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[300]
                              )
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("If mail not in inbox Please check in your spam box.",style: TextStyle(fontSize: 16,color: Colors.grey[500]),),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Text("If you still got no mail ?",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                          InkWell(
                            onTap: ()=>{
                              otpSender()
                            },
                            child: Text("Resend email",style: TextStyle(color: PColor.primaryColor,fontSize: 15,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),



                      SizedBox(
                        height: 70,
                      ),
                      PrimaryButton(
                          loading: btnLoader,
                          text: "CONTINUE",
                          onPress: isNotEmpty(_otp)?()=>{
                           otpVerify()
                          }:null

                      )
                    ],
                  ))

            ],
          ),
        ),
      ),
    );
  }

  bool isNotEmpty(val){
    return val.toString().replaceAll(" ","").length>0;

  }


}
