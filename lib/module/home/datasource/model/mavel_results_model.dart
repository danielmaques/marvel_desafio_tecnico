import 'package:character/module/home/datasource/model/marvel_thumbnail_model.dart';

class MarvelResultsModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailModel? thumbnail;
  String? resourceURI;

  MarvelResultsModel({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
  });

  MarvelResultsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? ThumbnailModel.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceURI;
    return data;
  }
}
