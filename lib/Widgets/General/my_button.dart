import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..animateTo(1);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: InkWell(
          onTap: () {
            Future.delayed(
              const Duration(seconds: 2),
              widget.onTap,
            );
            _controller.animateBack(0).then((_) {
              _controller.animateBack(2);
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("lib/Assets/button_raw.png"),
              Text(
                widget.text,
                style: const TextStyle(
                    fontFamily: 'PennyTheCherryBombChalk', fontSize: 28),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
