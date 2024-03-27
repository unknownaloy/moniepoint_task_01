import 'package:flutter/material.dart';
import 'package:moniepoint_task/widgets/map_bubble.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _scaleAnimation;
  late final Animation<double> _bubbleScaleAnimation;
  late final Animation<double> _bubbleTextOpacity;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.40, curve: Curves.easeIn),
      ),
    );

    _bubbleScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.50, 0.80, curve: Curves.easeIn),
      ),
    );

    _bubbleTextOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.80, 1.0, curve: Curves.easeIn),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Stack(
        children: [
          Image.asset(
            'assets/images/google_map.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black
                .withOpacity(0.5), // Adjust opacity to control darkness
            colorBlendMode: BlendMode.darken,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 32,
                right: 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 16,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(32),
                          ),
                        ),
                        height: 56,
                        width: 196,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: Color(0xff757575),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Saint Petersburg",
                              style: TextStyle(
                                color: Color(0xff757575),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Transform.scale(
                    scale: _scaleAnimation.value,
                    alignment: Alignment.center,
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.tune_rounded,
                        color: Color(0xff757575),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    left: 72,
                    child: Transform.scale(
                      scale: _bubbleScaleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "10,3 mn P",
                        textOpacity: _bubbleTextOpacity.value,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 88,
                    top: 58,
                    child: Transform.scale(
                      scale: _bubbleScaleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "11 mn P",
                        textOpacity: _bubbleTextOpacity.value,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 32,
                    top: 80,
                    child: Transform.scale(
                      scale: _bubbleScaleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "7,8 mn P",
                        textOpacity: _bubbleTextOpacity.value,
                      ),
                    ),
                  ),

                  // Bottom 3 map bubbles
                  Positioned(
                    right: 56,
                    bottom: 0,
                    child: Transform.scale(
                      scale: _bubbleScaleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "6,95 mn P",
                        textOpacity: _bubbleTextOpacity.value,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 64,
                    bottom: 80,
                    child: Transform.scale(
                      scale: _bubbleScaleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "7,8 mn P",
                        textOpacity: _bubbleTextOpacity.value,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 32,
                    bottom: 128,
                    child: Transform.scale(
                      scale: _bubbleScaleAnimation.value,
                      alignment: Alignment.bottomLeft,
                      child: MapBubble(
                        mapValue: "7,8 mn P",
                        textOpacity: _bubbleTextOpacity.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 96,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color(0xff737373).withAlpha(128),
                          child: const Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Transform.scale(
                        scale: _scaleAnimation.value,
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color(0xff737373).withAlpha(128),
                          child: const Icon(
                            Icons.near_me_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.scale(
                    scale: _scaleAnimation.value,
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff737373).withAlpha(128),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32),
                        ),
                      ),
                      height: 56,
                      width: 168,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.sort_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "List of variants",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
