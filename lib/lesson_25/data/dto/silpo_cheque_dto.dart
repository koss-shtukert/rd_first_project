import 'package:json_annotation/json_annotation.dart';
import 'package:rd_first_project/lesson_25/data/dto/cheque_action_dto.dart';
import 'package:rd_first_project/lesson_25/data/dto/cheque_header_dto.dart';
import 'package:rd_first_project/lesson_25/data/dto/cheque_line_dto.dart';

part 'silpo_cheque_dto.g.dart';

@JsonSerializable()
class SilpoChequeDto {
  SilpoChequeDto({
    required this.chequeHeader,
    required this.sumDiscount,
    required this.chequeLines,
    required this.chequeActions,
    required this.chPrediction,
    required this.sumCashback,
    required this.chequeMagicName,
    required this.feedbackRates,
  });

  factory SilpoChequeDto.fromJson(Map<String, dynamic> json) =>
      _$SilpoChequeDtoFromJson(json);

  final ChequeHeaderDto chequeHeader;
  final double sumDiscount;
  final List<ChequeLineDto> chequeLines;
  final List<ChequeActionDto> chequeActions;
  final String chPrediction;
  final num sumCashback;
  final String chequeMagicName;
  final List<dynamic> feedbackRates;

  Map<String, dynamic> toJson() => _$SilpoChequeDtoToJson(this);
}
