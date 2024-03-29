import 'package:flutter/material.dart';

class CustomNavItem extends StatefulWidget {
  const CustomNavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<CustomNavItem> createState() => _CustomNavItemState();
}

class _CustomNavItemState extends State<CustomNavItem>
    with TickerProviderStateMixin {
  late final AnimationController _innerController;

  late final Animation<double> _initialContainerSize;
  late final Animation<double> _initialBorderSize;

  late final Animation<double> _secondContainerSize;
  late final Animation<double> _secondBorderSize;

  bool _showColor = false;
  bool _showOuterCircle = false;

  @override
  void initState() {
    super.initState();

    _innerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          setState(() {
            _showColor = true;

            Future.delayed(const Duration(milliseconds: 375), () {
              _showOuterCircle = true;
            });

            Future.delayed(const Duration(milliseconds: 900), () {
              _showOuterCircle = false;
            });

            Future.delayed(const Duration(milliseconds: 1125), () {
              _showColor = false;
            });
          });
        }
      });

    _initialContainerSize = Tween<double>(begin: 58, end: 40).animate(
      CurvedAnimation(
        parent: _innerController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.easeIn,
        ),
      ),
    );

    _initialBorderSize = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 8),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 8, end: 1),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _innerController,
        curve: const Interval(0.0, 0.75, curve: Curves.easeIn),
      ),
    );

    _secondContainerSize = Tween<double>(begin: 40, end: 58).animate(
      CurvedAnimation(
        parent: _innerController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );

    _secondBorderSize = Tween<double>(begin: 8, end: 0).animate(
      CurvedAnimation(
        parent: _innerController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _innerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        widget.onTap();
        _innerController
          ..reset()
          ..forward();
      },
      child: AnimatedBuilder(
        animation: _innerController,
        builder: (context, child) => Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              curve: Curves.decelerate,
              alignment: Alignment.center,
              height: _showColor
                  ? 40
                  : widget.isActive
                      ? 52
                      : 40,
              width: _showColor
                  ? 40
                  : widget.isActive
                      ? 52
                      : 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _showColor
                    ? Colors.transparent
                    : widget.isActive
                        ? const Color(0xffFC9E12)
                        : const Color(0xff232220),
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
            widget.isActive
                ? Container(
                    padding: const EdgeInsets.all(2),
                    height: _initialContainerSize.value,
                    width: _initialContainerSize.value,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _showColor ? Colors.white : Colors.transparent,
                        width: _initialBorderSize.value,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.isActive
                ? Container(
                    padding: const EdgeInsets.all(2),
                    height: _secondContainerSize.value,
                    width: _secondContainerSize.value,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _showOuterCircle
                            ? Colors.white
                            : Colors.transparent,
                        width: _secondBorderSize.value,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
