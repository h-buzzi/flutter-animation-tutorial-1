import 'package:flutter/cupertino.dart';

class RotatingImage extends AnimatedWidget {
  const RotatingImage({
    super.key,
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = super.listenable as Animation<double>;
    return Transform.rotate(
      angle: animation.value,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Image.asset('../assets/github.png'),
      ),
    );
  }
}
