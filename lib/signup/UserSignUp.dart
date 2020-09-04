import 'package:flutter/material.dart';
import 'package:growin/http/GrowinApi.dart';
import 'package:growin/model/UserAddress.dart';
import 'package:growin/signup/CountrySelector.dart';
import 'package:growin/auth/UserSignIn.dart';
import 'package:http/http.dart';
import '../util/CustomWidget.dart';
import '../util/DefaultColorScheme.dart';
import '../model/User.dart';
import '../dashboard/UserDashboard.dart';
import '../auth/UserMobileNumberVerification.dart';


class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {


  String country = "";
  String mobileNumber = "";
  String countryCode = "";
  String country_no = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String nic = "";
  String password = "";

  String errorEmail = null;
  String errorNIC = null;
  String errorPassword = null;
  String errorMobile = null;

  bool loader = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      country = "Sri Lanka";
      country_no = "+94";
      countryCode = "LK";
    });
  }



  request() async{
    setState(() {
      loader=true;
    });
    User user = User();
    user = await GrowinApi().signUp(User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      address: UserAddress(country: countryCode),
      mobileNumber: '$country_no$mobileNumber'
    ));
    setState(() {
      loader=false;
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
      print(user.toString());
      if(user.status==409){
        if(user.field==1){
          setState(() {
            errorEmail = "This email already registerd";
            errorMobile = null;
          });
        }else{
          setState(() {
            errorMobile = "This mobile already registerd";
            errorEmail=null;
          });
        }

      }else{
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Something error. try again")));
      }
    }

  }





  bool validEmail(val){
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val);
  }

  bool validNIC(val){
    return RegExp(r"^([0-9]{9}[x|X|v|V]|[0-9]{12})$").hasMatch(val);
  }

  bool validPassword(val){
    return RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(val);
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
                      Text("Create Account",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Row(
                        children: <Widget>[
                          Text("I already have an account. ",style: TextStyle(fontSize: 16,color: Colors.grey[500]),),
                          InkWell(
                            onTap: ()=>{
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext coontext)=>UserSignIn()))

                            },
                            child: Text("Sign in",style: TextStyle(color: DefaultColorScheme.primaryColor,fontSize: 16,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        onChanged: ((str){
                          setState(() {
                            firstName= str;
                          });
                        }),
                        decoration: InputDecoration(
                          labelText: "First Name *",
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
                        height: 8,
                      ),
                      TextField(
                        onChanged: ((str){
                          setState(() {
                            lastName= str;
                          });
                        }),
                        decoration: InputDecoration(
                          labelText: "Last Name *",
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
                        height: 8,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: ((val){
                          if(val.length>4){
                            if(validEmail(val)){
                              setState(() {
                                email=val;
                                errorEmail = null;
                              });
                            }else{
                              setState(() {
                                email="";
                                errorEmail = "Invalid Email";
                              });
                            }
                          }else{
                            setState(() {
                              errorEmail = null;
                              email="";
                            });
                          }
                        }),
                        decoration: InputDecoration(
                          errorText: errorEmail,
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
                        height: 8,
                      ),
                      TextField(
                        readOnly: true,
                        controller: TextEditingController(text: country),
                        onTap: ()=>goToSecondScreen(),
                        decoration: InputDecoration(
                          labelText: "Country *",
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
                        height: 8,
                      ),
                      TextField(
                        onChanged: ((val){
                          setState(() {
                            mobileNumber = val;
                          });
                        }),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          errorText: errorMobile,
                          prefixText: country_no,
                          labelText: "Mobile Number *",
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
                        height: 8,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: ((val){
                          if(val.length>6){
                            setState(() {
                              password=val;
                              errorPassword = null;
                            });
                          }else{
                            setState(() {
                              errorPassword = "Password must be 6 characters or more.";
                              password="";
                            });
                          }
                        }),
                        decoration: InputDecoration(
                          errorText: errorPassword,
                          labelText: "Password *",
                          helperText: "6 or more characters",
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
                      Row(
                        children: <Widget>[
                          Text("I accept the ",style: TextStyle(fontSize: 15,color: Colors.grey[500]),),
                          InkWell(
                            onTap: ()=>{

                            },
                            child: Text("Terms and condtions",style: TextStyle(color: DefaultColorScheme.primaryColor,fontSize: 15,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      PrimaryButton(
                        text: "CREATE ACCOUNT",
                        loading: loader,
                        onPress: isNotEmpty(firstName)&&isNotEmpty(lastName)&&isNotEmpty(email)&&isNotEmpty(mobileNumber)&&isNotEmpty(password)?()=>{
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



  void goToSecondScreen()async {
    var result = await Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context) => new CountrySelector())
    );
    if(result!=null){
      setState(() {
        country_no = result['dial_code'];
        countryCode = result['code'];
        country = result['name'];
      });

    }
  }
}
