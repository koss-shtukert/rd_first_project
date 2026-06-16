import 'package:json_annotation/json_annotation.dart';

part 'cheque_action_dto.g.dart';

@JsonSerializable()
class ChequeActionDto {
  ChequeActionDto({
    required this.actionType,
    required this.actionId,
    required this.discpercent,
    required this.discount,
    this.actionTypeCodeName,
    this.varcharData,
  });

  factory ChequeActionDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeActionDtoFromJson(json);

  final int actionType;
  final String? actionTypeCodeName;
  final int actionId;
  final num discpercent;
  final num discount;
  final String? varcharData;

  Map<String, dynamic> toJson() => _$ChequeActionDtoToJson(this);
}
