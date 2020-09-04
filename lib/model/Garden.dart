class Garden{
  final String id;
  final String plantName;
  final String plantImage;
  final String description;
  final String descriptionLink;
  final int price;
  final int interest;
  final String createIn;

  Garden({this.id, this.plantName, this.plantImage, this.description,
    this.descriptionLink, this.price, this.interest, this.createIn});

  factory Garden.fetch(Map<String,dynamic> json){
    return Garden(
        id: json['_id'],
        plantName: json['plant_name'],
        plantImage: json['plant_image'],
        description: json['description'],
        descriptionLink: json['description_link'],
        price: json['price'],
        interest: json['interest'],
        createIn: json['createdIn']
    );
  }

  @override
  String toString() {
    return 'Garden{id: $id, plantName: $plantName, plantImage: $plantImage, description: $description, descriptionLink: $descriptionLink, price: $price, interest: $interest, createIn: $createIn}';
  }


}