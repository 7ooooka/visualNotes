import 'dart:convert';

Manufacture manufactureFromJson(String str) => Manufacture.fromJson(json.decode(str));

String manufactureToJson(Manufacture data) => json.encode(data.toJson());

class Manufacture {
  Manufacture({
     this.id:"",
     this.title:"",
     this.image:"",
     this.description:"",
     this.date:0,
     this.status:false, // it is closed by default
    this.imagePath:""
  });

  String id;
  String title;
  String image;
  String description;
  int date;
  bool status;
  String imagePath;
  factory Manufacture.fromJson(Map<String, dynamic> json) => Manufacture(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    description: json["description"],
    date: json["date"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "description": description,
    "date": date,
    "status": status,
  };
}
