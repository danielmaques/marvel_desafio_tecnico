import 'mavel_results_model.dart';

class MarvelModel {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<MarvelResultsModel>? results;

  MarvelModel({this.offset, this.limit, this.total, this.count, this.results});

  MarvelModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <MarvelResultsModel>[];
      json['results'].forEach((v) {
        results!.add(MarvelResultsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['total'] = total;
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
