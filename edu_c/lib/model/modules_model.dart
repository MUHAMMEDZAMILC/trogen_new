// To parse this JSON data, do
//
//     final modules = modulesFromJson(jsonString);

import 'dart:convert';

List<Modules> modulesFromJson(String str) => List<Modules>.from(json.decode(str).map((x) => Modules.fromJson(x)));

String modulesToJson(List<Modules> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modules {
    int? id;
    String? title;
    String? description;

    Modules({
        this.id,
        this.title,
        this.description,
    });

    factory Modules.fromJson(Map<String, dynamic> json) => Modules(
        id: json["id"],
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
    };
}
