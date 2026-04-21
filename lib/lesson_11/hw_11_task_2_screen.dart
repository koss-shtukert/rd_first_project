import 'package:flutter/material.dart';

class Hw11Task2Screen extends StatelessWidget {
  const Hw11Task2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Task 2 — Текст та іконки'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.yellow),
              const SizedBox(width: 10),
              Text(
                'Привіт, Flutter!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.star, color: Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}
