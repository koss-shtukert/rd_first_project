import 'package:json_annotation/json_annotation.dart';

part 'cheque_line_dto.g.dart';

@JsonSerializable()
class ChequeLineDto {
  ChequeLineDto({
    required this.chequeLineId,
    required this.lagerId,
    required this.lagerNameUA,
    required this.lagerUnit,
    required this.kolvo,
    required this.priceOut,
    required this.unitText,
    required this.fileName,
    required this.sumCashbackLine,
    required this.additionalData,
    required this.like,
  });

  factory ChequeLineDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeLineDtoFromJson(json);

  final int chequeLineId;
  final int lagerId;
  final String lagerNameUA;
  final String lagerUnit;
  final num kolvo;
  final num priceOut;
  final String unitText;
  final String fileName;
  final num sumCashbackLine;
  final Map<String, dynamic> additionalData;
  final Map<String, dynamic> like;

  Map<String, dynamic> toJson() => _$ChequeLineDtoToJson(this);
}
