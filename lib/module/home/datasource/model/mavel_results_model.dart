
import 'marvel_thumbnail_model.dart';

class MarvelResultsModel {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  String? resourceURI;
  ThumbnailModel? thumbnail;

  MarvelResultsModel({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.resourceURI,
    this.thumbnail,
  });

  factory MarvelResultsModel.fromJson(Map<String, dynamic> json) {
    return MarvelResultsModel(
        id: json['id'] ?? 0,
        digitalId: json['digitalId'] ?? 0,
        title: json['title'] ?? "",
        issueNumber: json['issueNumber'] ?? 0,
        variantDescription: json['variantDescription'] ?? "",
        description: json['description'] ?? "",
        modified: json['modified'] ?? "",
        isbn: json['isbn'] ?? "",
        upc: json['upc'] ?? "",
        diamondCode: json['diamondCode'] ?? "",
        ean: json['ean'] ?? "",
        issn: json['issn'] ?? "",
        format: json['format'] ?? "",
        pageCount: json['pageCount'] ?? 0,
        resourceURI: json['resourceURI'] ?? "",
        thumbnail: ThumbnailModel.fromJson(json['thumbnail']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'digitalId': digitalId,
      'title': title,
      'issueNumber': issueNumber,
      'variantDescription': variantDescription,
      'description': description,
      'modified': modified,
      'isbn': isbn,
      'upc': upc,
      'diamondCode': diamondCode,
      'ean': ean,
      'issn': issn,
      'format': format,
      'pageCount': pageCount,
      'resourceURI': resourceURI,
      'thumbnail': thumbnail!.toJson(),
    };
  }
}
