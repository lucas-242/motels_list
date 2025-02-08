// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      json['sucesso'] as bool,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      pagina: (json['pagina'] as num).toInt(),
      qtdPorPagina: (json['qtdPorPagina'] as num).toInt(),
      totalSuites: (json['totalSuites'] as num).toInt(),
      totalMoteis: (json['totalMoteis'] as num).toInt(),
      raio: (json['raio'] as num).toInt(),
      maxPaginas: (json['maxPaginas'] as num).toInt(),
      moteis: (json['moteis'] as List<dynamic>)
          .map((e) => MotelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
