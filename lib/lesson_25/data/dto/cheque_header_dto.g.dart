// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheque_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChequeHeaderDto _$ChequeHeaderDtoFromJson(Map<String, dynamic> json) =>
    ChequeHeaderDto(
      filId: (json['filId'] as num).toInt(),
      chequeId: (json['chequeId'] as num).toInt(),
      created: json['created'] as String,
      loyaltyFactId: (json['loyaltyFactId'] as num).toInt(),
      businessCardId: (json['businessCardId'] as num).toInt(),
      sumReg: (json['sumReg'] as num).toDouble(),
      sumBalance: (json['sumBalance'] as num).toDouble(),
      filialName: json['filialName'] as String,
      cityName: json['cityName'] as String,
      frId: (json['frId'] as num).toInt(),
      zId: (json['zId'] as num).toInt(),
      frChequeId: (json['frChequeId'] as num).toInt(),
      payType: (json['payType'] as num).toInt(),
      payTypeArray: json['payTypeArray'] as List<dynamic>,
      fiscalNumber: json['fiscalNumber'] as String,
      externalOperationId: json['externalOperationId'] as String?,
    );

Map<String, dynamic> _$ChequeHeaderDtoToJson(ChequeHeaderDto instance) =>
    <String, dynamic>{
      'filId': instance.filId,
      'chequeId': instance.chequeId,
      'created': instance.created,
      'loyaltyFactId': instance.loyaltyFactId,
      'businessCardId': instance.businessCardId,
      'sumReg': instance.sumReg,
      'sumBalance': instance.sumBalance,
      'filialName': instance.filialName,
      'cityName': instance.cityName,
      'frId': instance.frId,
      'zId': instance.zId,
      'frChequeId': instance.frChequeId,
      'payType': instance.payType,
      'payTypeArray': instance.payTypeArray,
      'fiscalNumber': instance.fiscalNumber,
      'externalOperationId': instance.externalOperationId,
    };
