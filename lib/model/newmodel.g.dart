// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      author: json['author'] as String? ?? 'no author',
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      urlToImage: json['urlToImage'] as String? ??
          "https://static01.nyt.com/images/2020/01/01/business/01Techfix-print/01Techfix-print-articleLarge.gif?quality=75&auto=webp&disable=upscale",
      publishedAt: json['publishedAt'] as String? ?? "",
      content: json['content'] as String? ?? "",
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
