import 'package:flutter/material.dart';

class MapBubble extends StatelessWidget {
  const MapBubble({
    required this.mapValue,
    required this.textOpacity,
    super.key,
  });

  final String mapValue;
  final double textOpacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      width: 96,
      height: 48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Color(0xffFC9E12),
      ),
      child: Opacity(
        opacity: textOpacity,
        child: Text(
          mapValue,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
