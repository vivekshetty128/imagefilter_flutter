import 'dart:convert';

ImageListResponseModel imageListResponseFromJson(String str) =>
    ImageListResponseModel.fromJson(json.decode(str));

String imageListResponseToJson(ImageListResponseModel data) =>
    json.encode(data.toJson());

class ImageListResponseModel {
  ImageListResponseModel({
    this.data,
  });

  List<ImageListModel>? data;

  factory ImageListResponseModel.fromJson(Map<String, dynamic> json) =>
      ImageListResponseModel(
        data: json["data"] == null
            ? null
            : List<ImageListModel>.from(json["data"]
                .map((element) => ImageListModel.fromJson(element))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data,
      };
}

class ImageListModel {
  ImageListModel({
    this.imageType,
    this.url,
  });

  String? imageType;
  String? url;

  factory ImageListModel.fromJson(Map<String, dynamic> json) => ImageListModel(
        imageType: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": imageType == null ? null : imageType,
        "url": url == null ? null : url,
      };
}
