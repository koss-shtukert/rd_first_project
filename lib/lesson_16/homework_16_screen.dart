import 'package:flutter/material.dart';
import 'package:rd_first_project/main/widget/section_header.dart';

class Homework16Screen extends StatelessWidget {
  const Homework16Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Заняття 16'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SectionHeader(
              title: 'Найпопулярніші пакети для навігації',
              subtitle: 'Bye-bye Navigator :)',
            ),
          ],
        ),
      ),
    );
  }
}
