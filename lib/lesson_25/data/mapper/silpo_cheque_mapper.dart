import 'package:rd_first_project/lesson_25/data/dto/silpo_cheque_dto.dart';
import 'package:rd_first_project/lesson_25/data/entity/silpo_cheque_entity.dart';

extension SilpoChequeDtoMapper on SilpoChequeDto {
  static const _imageBase =
      'https://images.silpo.ua/v2/products/200x200/webp/';

  SilpoChequeEntity toEntity() {
    return SilpoChequeEntity(
      chequeId: chequeHeader.chequeId,
      totalAmount: chequeHeader.sumReg,
      items: chequeLines.map((line) {
        final icon = line.additionalData['icon'] as String? ?? '';
        return ChequeItemEntity(
          name: line.lagerNameUA,
          imageUrl: '$_imageBase$icon',
          price: line.priceOut.toDouble(),
          quantity: line.kolvo.toDouble(),
        );
      }).toList(),
      prediction: chPrediction,
    );
  }
}
