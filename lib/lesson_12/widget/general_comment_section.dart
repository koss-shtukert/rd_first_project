import 'package:flutter/material.dart';

class GeneralCommentSection extends StatelessWidget {
  const GeneralCommentSection({required this.controller, super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Є що додати?',
            style: TextStyle(
              fontFamily: 'SilpoText',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.3,
              color: Color(0xFF202124),
            ),
          ),
          TextField(
            controller: controller,
            style: TextStyle(color: Color(0xFF202124)),
            decoration: InputDecoration(
              hintText: 'Поділіться загальним враженням',
              hintStyle: TextStyle(
                color: Color.fromRGBO(32, 33, 36, 0.54),
                fontFamily: 'SilpoText',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              filled: true,
              fillColor: Color(0xFFEEF2FC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color.fromRGBO(32, 33, 36, 0.24)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color.fromRGBO(32, 33, 36, 0.24)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
