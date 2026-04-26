import 'package:flutter/material.dart';

class ColumnContainer extends StatelessWidget {
  const ColumnContainer({
    required this.containers,
    required this.itemBuilder,
    super.key,
  });

  final List<Map<String, dynamic>> containers;
  final Widget Function(int index, Map<String, dynamic> item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (i, item) in containers.indexed) ...[
          if (i == 0)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(child: itemBuilder(i, item)),
              ),
            )
          else ...[
            const SizedBox(height: 8),
            Center(child: itemBuilder(i, item)),
          ],
        ],
        const SizedBox(height: 8),
      ],
    );
  }
}
