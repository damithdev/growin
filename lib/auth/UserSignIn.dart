import 'package:flutter/material.dart';
import 'package:growin/util/CustomWidget.dart';
import 'package:growin/util/DefaultColorScheme.dart';
import 'package:growin/dashboard/UserDashboard.dart';
import 'package:growin/auth/UserMobileNumberVerification.dart';
import 'package:growin/signup/UserSignUp.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../http/GrowinApi.dart';
import '../model/User.dart';

class UserSignIn extends StatefulWidget {
  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {


  String _email = "";
  String _password = "";
  String _errorEmail=null;
  String _errorPassword = null;
  bool btnLoader = false;


  request() async{
    setState(() {
      btnLoader=true;
    });
    User user = User();
    user = await GrowinApi().signIn(User(
        email: _email,
        password: _password,
    ));
    setState(() {
      btnLoader=false;
    });
    if(user.createdIn!=null){
      if(user.isNumberVerified){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserDashBoard(user: user)),
              (Route<dynamic> route) => false,
        );
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext coontext)=>UserMobileNumberVerification(user: user)));
      }

    }else{
      if(user.field==0){
        setState(() {
          _errorEmail = "Invalid Email address";
          _errorPassword = null;
        });
      }else if(user.field==1){
        setState(() {
          _errorEmail = null;
          _errorPassword = "Invalid Password";
        });
      }else{
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Something error. try again")));
      }
    }


  }

  bool validEmail(val){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      Text("Sign in",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Row(
                        children: <Widget>[
                          Text("I don't have an account. ",style: TextStyle(fontSize: 16,color: Colors.grey[500]),),
                          InkWell(
                            onTap: ()=>{
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext coontext)=>UserSignUp()))
                            },
                            child: Text("Create Account",style: TextStyle(color: DefaultColorScheme.primaryColor,fontSize: 16,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: ((val){
                          if(val.length>4){
                            if(validEmail(val)){
                              setState(() {
                                _email=val;
                                _errorEmail=null;
                              });
                            }else{
                              setState(() {
                                _email="";
                                _errorEmail=null;
                              });
                            }
                          }else{
                            setState(() {
                              _email="";
                              _errorEmail=null;
                            });
                          }
                        }),
                        decoration: InputDecoration(
                          errorText: _errorEmail,
                          labelText: "Email *",
                          labelStyle: TextStyle(
                            fontSize: 14,

                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: DefaultColorScheme.primaryColor
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
                        height: 20,
                      ),
                      TextField(
                        onChanged: ((val){
                          if(val.length>6){
                            setState(() {
                              _password=val;
                            });
                          }else{
                            setState(() {
                              _password="";
                            });
                          }
                        }),
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: _errorPassword,
                          labelText: "Password *",
                          labelStyle: TextStyle(
                            fontSize: 14,

                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: DefaultColorScheme.primaryColor
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
                      Row(
                        children: <Widget>[
                          Text("Forgot Password. ? ",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                          InkWell(
                            onTap: ()=>{

                            },
                            child: Text("Reset Password",style: TextStyle(color: DefaultColorScheme.primaryColor,fontSize: 15,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      PrimaryButton(
                        loading: btnLoader,
                        text: "Sign in",
                          onPress: isNotEmpty(_email)&&isNotEmpty(_password)?()=>{
                            request()
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
