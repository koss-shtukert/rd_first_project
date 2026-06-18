// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_line_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeLineDto _$ChequeLineDtoFromJson(Map<String, dynamic> json) =>
    ChequeLineDto(
      chequeLineId: (json['chequeLineId'] as num).toInt(),
      lagerId: (json['lagerId'] as num).toInt(),
      lagerNameUA: json['lagerNameUA'] as String,
      lagerUnit: json['lagerUnit'] as String,
      kolvo: json['kolvo'] as num,
      priceOut: json['priceOut'] as num,
      unitText: json['unitText'] as String,
      fileName: json['fileName'] as String,
      sumCashbackLine: json['sumCashbackLine'] as num,
      additionalData: json['additionalData'] as Map<String, dynamic>,
      like: json['like'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ChequeLineDtoToJson(ChequeLineDto instance) =>
    <String, dynamic>{
      'chequeLineId': instance.chequeLineId,
      'lagerId': instance.lagerId,
      'lagerNameUA': instance.lagerNameUA,
      'lagerUnit': instance.lagerUnit,
      'kolvo': instance.kolvo,
      'priceOut': instance.priceOut,
      'unitText': instance.unitText,
      'fileName': instance.fileName,
      'sumCashbackLine': instance.sumCashbackLine,
      'additionalData': instance.additionalData,
      'like': instance.like,
    };
