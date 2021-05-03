import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  String code;
  bool status;
  String message;
  Data data;

  NewsModel({this.code, this.status, this.message, this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Data {
  int current_page;
  List<Datas> data;
  String first_page_url;
  int from;
  int last_page;
  String last_page_url;
  List<Links> links;
  String next_page_url;
  String path;
  int per_page;
  String prev_page_url;
  int to;
  int total;

  Data(
      {this.current_page,
      this.data,
      this.first_page_url,
      this.from,
      this.last_page,
      this.last_page_url,
      this.links,
      this.next_page_url,
      this.path,
      this.per_page,
      this.prev_page_url,
      this.to,
      this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Datas {
  int id;
  int news_category_id;
  String slug;
  String title;
  String content;
  String image;
  int status;
  String created_at;
  String updated_at;
  Category category;

  Datas(
      {this.id,
      this.news_category_id,
      this.slug,
      this.title,
      this.content,
      this.image,
      this.status,
      this.created_at,
      this.updated_at,
      this.category});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);
}

@JsonSerializable()
class Category {
  int id;
  String name;
  int status;
  String created_at;
  String updated_at;

  Category({this.id, this.name, this.status, this.created_at, this.updated_at});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Links {
  String url;
  String label;
  bool active;

  Links({this.url, this.label, this.active});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
