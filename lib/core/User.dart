import 'package:flutter/material.dart';

class User{
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isEmailVerified;
  final String mobileNumber;
  final String nic;
  final String refCode;
  final String createdIn;
  final String lastActive;
  final String password;
  final userAddress address;
  final String error;
  final int status;
  final int field;
  final Withdraw withdraw;

  User({this.id, this.firstName, this.lastName, this.email, this.isEmailVerified, this.mobileNumber, this.nic, this.refCode, this.createdIn, this.lastActive,this.password,this.address,this.error,this.field,this.status,this.withdraw});

  factory User.fetch(Map<String,dynamic> json){
    return User(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isEmailVerified: json['email_verification']==1,
      mobileNumber: json['phone_number'],
      nic: json['nic'],
      refCode: json['ref_code'],
      createdIn: json['created_in'],
      lastActive: json['last_active'],
      address: userAddress.fetch(json['address']),
      withdraw: Withdraw.fetch(json['withdrow'])

    );
  }

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, isEmailVerified: $isEmailVerified, mobileNumber: $mobileNumber, nic: $nic, refCode: $refCode, createdIn: $createdIn, lastActive: $lastActive, password: $password, address: $address, error: $error, status: $status, field: $field, withdraw: $withdraw}';
  }


}


class userAddress{
  final String streetA;
  final String streetB;
  final String city;
  final String province;
  final String zipCode;
  final String country;

  userAddress({this.streetA, this.streetB, this.city, this.province, this.zipCode, this.country});

  factory userAddress.fetch(Map<String,dynamic> json){
    return userAddress(
      streetA: json['street_a'],
      streetB: json['street_b'],
      city: json['city'],
      province: json['province'],
      zipCode: json['zip_code'],
      country: json['country']
    );
  }

  @override
  String toString() {
    return 'userAddress{streetA: $streetA, streetB: $streetB, city: $city, province: $province, zipCode: $zipCode, country: $country}';
  }


}



class Withdraw{
  final String bankName;
  final String accountNumber;
  final int accountName;
  final String bankBranch;
  final String paypalID;

  Withdraw({this.bankName, this.accountNumber, this.accountName, this.bankBranch, this.paypalID});


  factory Withdraw.fetch(Map<String,dynamic> json){
    return Withdraw(
      bankName: json['bank_name'],
      accountName: json['account_name'],
      accountNumber: json['account_number'],
      bankBranch: json['bank_branch'],
      paypalID: json['paypal_id']
    );
  }

  @override
  String toString() {
    return 'Withdraw{bankName: $bankName, accountNumber: $accountNumber, accountName: $accountName, bankBranch: $bankBranch, paypalID: $paypalID}';
  }


}