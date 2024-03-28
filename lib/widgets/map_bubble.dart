import 'package:flutter/material.dart';

class MapBubble extends StatelessWidget {
  const MapBubble({
    required this.mapValue,
    required this.textOpacity,
    required this.iconOpacity,
    required this.bubbleWidth,
    required this.showWithoutAnyLayer,
    super.key,
  });

  final String mapValue;
  final double textOpacity;
  final double iconOpacity;
  final double bubbleWidth;
  final bool showWithoutAnyLayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      width: bubbleWidth,
      height: 48,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Color(0xffFC9E12),
      ),
      child: showWithoutAnyLayer
          ? Opacity(
              opacity: iconOpacity,
              child: const Icon(
                Icons.apartment_outlined,
                color: Colors.white,
              ),
            )
          : Opacity(
              opacity: textOpacity,
              child: Flexible(
                child: Text(
                  mapValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }
}
