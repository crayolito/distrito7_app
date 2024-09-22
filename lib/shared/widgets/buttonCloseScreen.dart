import 'package:flutter/material.dart';

class ButtonCloseScreen extends StatelessWidget {
  const ButtonCloseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.015,
        vertical: size.height * 0.01,
      ),
      height: size.height * 0.073,
      width: size.width * 0.135,
      decoration: BoxDecoration(
        color: Color(0xFF44BEED).withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white.withOpacity(0.85),
        shape: const CircleBorder(),
        child: Icon(
          Icons.arrow_back,
          color: Color(0xFF44BEED),
          size: size.width * 0.09,
        ),
      ),
    );
  }
}
