import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:growin/core/User.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GrowinAPI{
  final String _host = "https://growin.api.foxrilla.com";

  Future<User> signUp(User user) async{
    Map<String,String> header = {
      'Content-type': 'application/json'
    };
    Map<String,String> body = {
      "first_name":user.firstName,
      "last_name":user.lastName,
      "email":user.email,
      "phone_number":user.mobileNumber,
      "nic":user.nic,
      "password":user.password,
      "country":user.address.country
    };
    var response = await http.post('$_host/user',headers: header,body:json.encode(body));
    int statusCode = response.statusCode;
    if(statusCode==201){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", json.decode(response.body)['token']);
      return User.fetch(json.decode(response.body));
    }else{
      return User(status: statusCode,error: json.decode(response.body)['error']);
    }
  }

  Future<User> signIn(User user) async{
    Map<String,String> header = {
      'Content-type': 'application/json'
    };
    Map<String,String> body = {
      "email":user.email,
      "password":user.password
    };
    var response = await http.post('$_host/auth',headers: header,body:json.encode(body));
    int statusCode = response.statusCode;
    if(statusCode==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user", json.decode(response.body)['token']);
      return User.fetch(json.decode(response.body));
    }else{
      return User(status: statusCode,error: json.decode(response.body)['error'],field: jsonDecode(response.body)['field']);
    }
  }
  Future<User> user() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user")!=null){
      Map<String,String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString("user")}'
      };
      var response = await http.get('$_host/user',headers: header);
      int statusCode = response.statusCode;
      if(statusCode==200){
        return User.fetch(json.decode(response.body));
      }else{
        return User(status: statusCode,error: json.decode(response.body)['error'],field: jsonDecode(response.body)['field']);
      }
    }else{
      return User(status: 404,error: "token not found");
    }

  }

  Future<bool> sendOtp() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user")!=null){
      Map<String,String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString("user")}'
      };
      Map<String,String> body = {
        "otp_token":prefs.getString("otp_token")!=null?prefs.getString("otp_token"):"2iuefgiu2ohefh3iuhfucihef"
      };
      var response = await http.post('$_host/otp',headers: header,body:json.encode(body));
      int statusCode = response.statusCode;
      if(statusCode==201){
        prefs.setString("otp_token", json.decode(response.body)["otp_token"]);
        return true;
      }else{
        return false;
      }

    }else{
      return false;
    }

  }

  Future<bool> verifyOtp(String otpCode) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user")!=null){
      Map<String,String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString("user")}'
      };
      Map<String,String> body = {
        "otp_token":prefs.getString("otp_token")!=null?prefs.getString("otp_token"):"2iuefgiu2ohefh3iuhfucihef",
        "otp_code":otpCode
      };
      var response = await http.put('$_host/otp',headers: header,body:json.encode(body));
      int statusCode = response.statusCode;
      if(statusCode==200){
        return true;
      }else{
        return false;
      }
    }else{
      return false;
    }
  }

  Future<List<Garden>> getGarden() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("user")!=null){
      Map<String,String> header = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString("user")}'
      };
      var response = await http.get('$_host/garden',headers: header);
      int statusCode = response.statusCode;
      if(statusCode==200){
        var body = jsonDecode(response.body);
        return (body as List)
            .map((p) => Garden.fetch(p))
            .toList();
      }else{
        return null;
      }
    }else{
      return null;
    }


  }

  @override
  String toString() {
    return 'GrowinAPI{_host: $_host}';
  }


}