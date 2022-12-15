import 'package:flutter/cupertino.dart';

class GithubImage extends StatelessWidget {
  const GithubImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(30),
      child: Image.asset('../assets/github.png'),
    );
  }
}

class RotatingTransition extends StatelessWidget {
  const RotatingTransition(
      {super.key, required this.child, required this.angle});

  final Widget child;
  final Animation<double> angle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}
