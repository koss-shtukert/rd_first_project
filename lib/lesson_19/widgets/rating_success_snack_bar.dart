import 'package:flutter/material.dart';

class RatingSuccessSnackBar extends SnackBar {
  const RatingSuccessSnackBar({super.key})
      : super(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: const Duration(seconds: 3),
          padding: EdgeInsets.zero,
          content: const _RatingSuccessSnackBarContent(),
        );
}

class _RatingSuccessSnackBarContent extends StatelessWidget {
  const _RatingSuccessSnackBarContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 37),
      decoration: BoxDecoration(
        color: const Color(0xFF41A6F4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40827F7F),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/icons/hw19/star_happy.png', width: 21, height: 20),
          const SizedBox(width: 12),
          const Flexible(
            child: Text(
              'Оцінку надіслано успішно',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 12),
          Image.asset('assets/icons/hw19/star_happy.png', width: 21, height: 20),
        ],
      ),
    );
  }
}
