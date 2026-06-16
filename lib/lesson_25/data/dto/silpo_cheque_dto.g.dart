// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'silpo_cheque_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SilpoChequeDto _$SilpoChequeDtoFromJson(Map<String, dynamic> json) =>
    SilpoChequeDto(
      chequeHeader: ChequeHeaderDto.fromJson(
        json['chequeHeader'] as Map<String, dynamic>,
      ),
      sumDiscount: (json['sumDiscount'] as num).toDouble(),
      chequeLines: (json['chequeLines'] as List<dynamic>)
          .map((e) => ChequeLineDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      chequeActions: (json['chequeActions'] as List<dynamic>)
          .map((e) => ChequeActionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      chPrediction: json['chPrediction'] as String,
      sumCashback: json['sumCashback'] as num,
      chequeMagicName: json['chequeMagicName'] as String,
      feedbackRates: json['feedbackRates'] as List<dynamic>,
    );

Map<String, dynamic> _$SilpoChequeDtoToJson(SilpoChequeDto instance) =>
    <String, dynamic>{
      'chequeHeader': instance.chequeHeader,
      'sumDiscount': instance.sumDiscount,
      'chequeLines': instance.chequeLines,
      'chequeActions': instance.chequeActions,
      'chPrediction': instance.chPrediction,
      'sumCashback': instance.sumCashback,
      'chequeMagicName': instance.chequeMagicName,
      'feedbackRates': instance.feedbackRates,
    };
