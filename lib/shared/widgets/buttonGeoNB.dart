import 'package:flutter/material.dart';

class ButtonGeoNB extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconP;
  const ButtonGeoNB({super.key, required this.onPressed, required this.iconP});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.01,
        right: size.width * 0.01,
        top: size.height * 0.01,
      ),
      child: FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: Colors.white.withOpacity(.90),
        onPressed: onPressed,
        child: Icon(
          iconP,
          size: size.width * 0.07,
          color: const Color(0xFF00A541),
        ),
      ),
    );
  }
}
