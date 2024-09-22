import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';

class PresentationContainer extends StatelessWidget {
  const PresentationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    BoxDecoration decoration = BoxDecoration(
        color: kTerciaryColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kPrimaryColor, width: 4));
    return Positioned(
        top: size.height * 0.27,
        left: 0,
        right: 0,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          width: size.width,
          height: size.height * 0.075,
          decoration: decoration,
          child: Text(
            "DISTRITO 7",
            style: estilosText!.tituloVentanaCategorias,
          ),
        ));
  }
}
