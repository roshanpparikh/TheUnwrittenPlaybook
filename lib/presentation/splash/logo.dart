import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  _LogoState createState() => _LogoState();
}

const double LOGO_WIDTH = 200;
const double LOGO_HEIGHT = 200;

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: LOGO_WIDTH,
      height: LOGO_HEIGHT,
      color: Colors.transparent,
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          "assets/images/im_logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
