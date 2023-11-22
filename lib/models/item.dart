import 'dart:convert';

List<AirJordan> airJordanFromJson(String str) => List<AirJordan>.from(json.decode(str).map((x) => AirJordan.fromJson(x)));

String airJordanToJson(List<AirJordan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AirJordan {
    String model;
    int pk;
    Fields fields;

    AirJordan({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory AirJordan.fromJson(Map<String, dynamic> json) => AirJordan(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    int userID;
    String name;
    int amount;
    String description;
    String category;
    int price;
    String linkImage;
    DateTime dateAdded;

    Fields({
        required this.user,
        required this.userID,
        required this.name,
        required this.amount,
        required this.description,
        required this.category,
        required this.price,
        required this.linkImage,
        required this.dateAdded,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        userID: json["user_id"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
        linkImage: json["link_image"],
        dateAdded: DateTime.parse(json["date_added"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
        "category": category,
        "price": price,
        "link_image": linkImage,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    };
}
