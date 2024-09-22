import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EstilosLetras {
  BuildContext context;

  EstilosLetras(this.context);

  Size get size => MediaQuery.of(context).size;

  // VENTANA DE PERMISOS
  TextStyle get tituloVentanaPermisos => GoogleFonts.workSans(
        fontSize: size.width * 0.09,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtituloVentanaPermisos => GoogleFonts.workSans(
        fontSize: size.width * 0.055,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
      );

  // VENTANA DE CATEGORIAS DE INSTITUCIONES
  TextStyle get tituloVentanaCategorias => GoogleFonts.workSans(
        fontSize: size.width * 0.08,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtituloVentanaCategorias => GoogleFonts.workSans(
        fontSize: size.width * 0.05,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
      );

  // VENTANA DEL MAPA

  TextStyle get tituloVentanaMapa => GoogleFonts.workSans(
        fontSize: size.width * 0.08,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  // VENTANA DE NRO DE EMERGENCIA

  TextStyle get tituloVentanaNrEmergencia => GoogleFonts.workSans(
        fontSize: size.width * 0.075,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtituloVentanaNrEmergencia => GoogleFonts.workSans(
        fontSize: size.width * 0.08,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
      );

  // VENTANA DE MAPA
  TextStyle get tituloVentanaMapaSearch => GoogleFonts.workSans(
        fontSize: size.width * 0.065,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
      );

  TextStyle get tituloVentanaInfoMarker => GoogleFonts.workSans(
        fontSize: size.width * 0.065,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtituloVentanaInfoMarker => GoogleFonts.workSans(
        fontSize: size.width * 0.09,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
      );

  TextStyle get subtitulo2VentanaInfoMarker => GoogleFonts.workSans(
        fontSize: size.width * 0.06,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  // TEXTO DE SECCIONES DE INFORMACION

  TextStyle get tituloSeccionInfo => GoogleFonts.workSans(
        fontSize: size.width * 0.046,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get titulo2SeccionInfo => GoogleFonts.workSans(
        fontSize: size.width * 0.047,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get titulo3SeccionInfo => GoogleFonts.workSans(
        fontSize: size.width * 0.047,
        color: kPrimaryColor,
      );

  // VENTANA DE INSTITUCION SCREEN

  TextStyle get tituloInstitucionScreen => GoogleFonts.workSans(
        fontSize: size.width * 0.07,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get titulo2InstitucionScreen => GoogleFonts.workSans(
        fontSize: size.width * 0.05,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtituloInstitucionScreen => GoogleFonts.workSans(
        fontSize: size.width * 0.047,
        color: kPrimaryColor,
      );

  TextStyle get titulo3InstitucionScreen => GoogleFonts.workSans(
        fontSize: size.width * 0.05,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtitulo3InstitucionScreen => GoogleFonts.workSans(
        fontSize: size.width * 0.047,
        color: kPrimaryColor,
      );

  // VENTANA TEMPORALES DE MENSAJE

    TextStyle get titulo1VentanaMensaje => GoogleFonts.workSans(
          fontSize: size.width * 0.07,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        );

  // SCREEN HISTORIA DE INSTITUCION

  TextStyle get tituloHistoriaInstitucion => GoogleFonts.workSans(
        fontSize: size.width * 0.07,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );

  TextStyle get subtituloHistoriaInstitucion => GoogleFonts.workSans(
        fontSize: size.width * 0.05,
        color: kPrimaryColor,
      );
  
    TextStyle get subtitulo2HistoriaInstitucion => GoogleFonts.workSans(
        fontSize: size.width * 0.04,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      );
}
