import 'package:flutter/material.dart';

class SplashImage extends StatefulWidget {
  final String imagePath;

  const SplashImage({super.key, required this.imagePath});

  @override
  _SplashImageState createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 1000),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child,);
        },
          layoutBuilder: (currentChild, previousChildren) => Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ...previousChildren.map((item) => Positioned.fill(child: item)),
              if (currentChild != null)
                Positioned.fill(child: currentChild)],
          ),
        child: Image.asset(
          widget.imagePath,
          key: ValueKey(widget.imagePath),
          fit: BoxFit.fitWidth,

        )
      ),
    );
  }
}

