import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';

class TitleDateFirst extends StatelessWidget {
  const TitleDateFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      alignment: AlignmentDirectional.bottomStart,
      height: (size.height * 0.618) * 0.08,
      width: size.width,
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            "Datos Principales",
            style: estilosText!.tituloInstitucionScreen,
          ),
          Container(
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            height: size.height * 0.001,
            width: size.width * 0.6,
          )
        ],
      ),
    );
  }
}
