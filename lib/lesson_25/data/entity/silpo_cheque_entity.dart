class SilpoChequeEntity {
  SilpoChequeEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  final int chequeId;
  final double totalAmount;
  final List<ChequeItemEntity> items;
  final String prediction;
}

class ChequeItemEntity {
  ChequeItemEntity({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  final String name;
  final String imageUrl;
  final double price;
  final double quantity;
}
