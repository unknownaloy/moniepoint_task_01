import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    required this.assetPath,
    required this.sliderWidth,
    this.sliderHeight = 40,
    required this.sliderText,
    required this.textOpacity,
    this.sliderTextAlignment = Alignment.centerLeft,
    this.height,
    super.key,
  });

  final String assetPath;
  final double sliderWidth;
  final double sliderHeight;
  final String sliderText;
  final double textOpacity;
  final Alignment sliderTextAlignment;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.only(
        left: 10,
        bottom: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        image: DecorationImage(
          image: AssetImage(
            assetPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 2, bottom: 2, right: 2),
        width: sliderWidth + sliderHeight,
        height: sliderHeight,
        decoration: BoxDecoration(
          color: const Color(0xffA5957E).withAlpha(240),
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: sliderTextAlignment,
              child: Opacity(
                opacity: textOpacity,
                child: Text(
                  sliderText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff232220),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: sliderHeight / 2,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.chevron_right,
                  color: Color(0xffA5957E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
