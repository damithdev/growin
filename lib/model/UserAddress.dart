class UserAddress{
  final String streetA;
  final String streetB;
  final String city;
  final String province;
  final String zipCode;
  final String country;

  UserAddress({this.streetA, this.streetB, this.city, this.province, this.zipCode, this.country});

  factory UserAddress.fetch(Map<String,dynamic> json){
    return UserAddress(
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