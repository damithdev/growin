import 'package:flutter/material.dart';
import 'package:growin/model/UserAddress.dart';

class User{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isNumberVerified;
  final String mobileNumber;
  final String nic;
  final String refCode;
  final String createdIn;
  final String lastActive;
  final String password;
  final UserAddress address;
  final String error;
  final int status;
  final int field;

  User({this.id, this.firstName, this.lastName, this.email, this.isNumberVerified, this.mobileNumber, this.nic, this.refCode, this.createdIn, this.lastActive,this.password,this.address,this.error,this.field,this.status});

  factory User.fetch(Map<String,dynamic> json){
    return User(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isNumberVerified: json['mobile_verification']==1,
      mobileNumber: json['phone_number'],
      nic: json['nic'],
      refCode: json['ref_code'],
      createdIn: json['created_in'],
      lastActive: json['last_active'],
      address: UserAddress.fetch(json['address'])

    );
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, isNumberVerified: $isNumberVerified, mobileNumber: $mobileNumber, nic: $nic, refCode: $refCode, createdIn: $createdIn, lastActive: $lastActive, password: $password, address: $address, error: $error, status: $status, field: $field}';
  }


}













