import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';

class SearchResultElement extends StatelessWidget {
  const SearchResultElement({
    super.key,
    required this.color,
    required this.nombre,
    required this.direccion,
  });

  final Color color;
  final String nombre;
  final String direccion;

  @override
  Widget build(BuildContext context) {
    final decorationC1 = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(color: color, width: 8),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ]);
    final decorationC2 = BoxDecoration(
      color: const Color(0xFF00A541).withOpacity(0.8),
      borderRadius: BorderRadius.circular(5),
    );
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      margin: EdgeInsets.only(
          bottom: size.height * 0.015,
          right: size.height * 0.01,
          left: size.height * 0.01),
      decoration: decorationC1,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: size.width * 0.01),
            width: size.width * 0.1,
            child: Icon(
              Icons.location_on_outlined,
              size: size.width * 0.1,
              color: kSecondaryColor,
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.01, right: size.width * 0.01),
              width: size.width * 0.68,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      nombre,
                      style: estilosText!.titulo2InstitucionScreen,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      direccion,
                      style: estilosText!.subtitulo3InstitucionScreen,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                      width: size.width * 0.68,
                      height: size.height * 0.003,
                      margin: EdgeInsets.only(bottom: size.height * 0.002),
                      decoration: decorationC2)
                ],
              )),
          Container(
            alignment: Alignment.center,
            width: size.width * 0.1,
            child: Icon(
              Icons.follow_the_signs,
              size: size.width * 0.1,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
