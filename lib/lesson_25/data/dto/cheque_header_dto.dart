import 'package:json_annotation/json_annotation.dart';

part 'cheque_header_dto.g.dart';

@JsonSerializable()
class ChequeHeaderDto {
  ChequeHeaderDto({
    required this.filId,
    required this.chequeId,
    required this.created,
    required this.loyaltyFactId,
    required this.businessCardId,
    required this.sumReg,
    required this.sumBalance,
    required this.filialName,
    required this.cityName,
    required this.frId,
    required this.zId,
    required this.frChequeId,
    required this.payType,
    required this.payTypeArray,
    required this.fiscalNumber,
    this.externalOperationId,
  });

  factory ChequeHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$ChequeHeaderDtoFromJson(json);

  final int filId;
  final int chequeId;
  final String created;
  final int loyaltyFactId;
  final int businessCardId;
  final double sumReg;
  final double sumBalance;
  final String filialName;
  final String cityName;
  final int frId;
  final int zId;
  final int frChequeId;
  final int payType;
  final List<dynamic> payTypeArray;
  final String fiscalNumber;
  final String? externalOperationId;

  Map<String, dynamic> toJson() => _$ChequeHeaderDtoToJson(this);
}
