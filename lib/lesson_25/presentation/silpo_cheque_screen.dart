import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rd_first_project/lesson_25/data/dto/silpo_cheque_dto.dart';
import 'package:rd_first_project/lesson_25/data/entity/silpo_cheque_entity.dart';
import 'package:rd_first_project/lesson_25/data/mapper/silpo_cheque_mapper.dart';

class SilpoChequeScreen extends StatefulWidget {
  const SilpoChequeScreen({super.key});

  @override
  State<SilpoChequeScreen> createState() => _SilpoChequeScreenState();
}

class _SilpoChequeScreenState extends State<SilpoChequeScreen> {
  SilpoChequeEntity? _entity;

  @override
  void initState() {
    super.initState();
    _loadCheque();
  }

  Future<void> _loadCheque() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/silpo_cheque_example.json',
    );
    final map = jsonDecode(jsonString) as Map<String, dynamic>;
    final dto = SilpoChequeDto.fromJson(map);
    setState(() => _entity = dto.toEntity());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Чек Сільпо'),
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
      ),
      body: _entity == null
          ? const Center(child: CircularProgressIndicator())
          : _ChequeContent(entity: _entity!),
    );
  }
}

class _ChequeContent extends StatelessWidget {
  const _ChequeContent({required this.entity});

  final SilpoChequeEntity entity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Чек №${entity.chequeId}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            ...entity.items.map((item) => _ItemRow(item: item)),
            const SizedBox(height: 8),
            const Divider(thickness: 2),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'РАЗОМ:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '${entity.totalAmount.toStringAsFixed(2)} грн',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Text(
                    'Передбачення для вас',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFF8F00),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    entity.prediction,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4E342E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item});

  final ChequeItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              item.imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 48,
                height: 48,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image, size: 24),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.price.toStringAsFixed(2)} грн'
                  ' × ${_formatQuantity(item.quantity)}',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            (item.price * item.quantity).toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  String _formatQuantity(double qty) {
    if (qty == qty.roundToDouble()) return qty.toInt().toString();
    return qty.toStringAsFixed(3);
  }
}
