import 'package:flutter/material.dart';

class BallControlsWidget extends StatelessWidget {
  const BallControlsWidget({
    required this.useScale,
    required this.power,
    required this.onModeChanged,
    super.key,
    this.onPowerChanged,
  });

  final bool useScale;
  final double power;
  final ValueChanged<bool> onModeChanged;
  final ValueChanged<double>? onPowerChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          useScale ? 'Натисни на мʼяч' : 'Свайпни по мʼячу',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            shadows: [Shadow(color: Colors.black54, blurRadius: 6)],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Свайп',
              style: TextStyle(
                color: !useScale ? Colors.white : Colors.white38,
                fontSize: 16,
                fontWeight: !useScale ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Switch(
              value: useScale,
              activeThumbColor: Colors.white,
              activeTrackColor: Colors.white30,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.white30,
              onChanged: onModeChanged,
            ),
            Text(
              'Шкала',
              style: TextStyle(
                color: useScale ? Colors.white : Colors.white38,
                fontSize: 16,
                fontWeight: useScale ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        Opacity(
          opacity: useScale ? 1.0 : 0.4,
          child: Row(
            children: [
              const Icon(Icons.speed, color: Colors.white70, size: 24),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: Color.lerp(
                      Colors.yellow,
                      Colors.deepOrange,
                      power,
                    ),
                    thumbColor: Colors.white,
                    inactiveTrackColor: Colors.white24,
                    trackHeight: 6,
                  ),
                  child: Slider(value: power, onChanged: onPowerChanged),
                ),
              ),
              const Icon(
                Icons.local_fire_department,
                color: Colors.deepOrange,
                size: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
