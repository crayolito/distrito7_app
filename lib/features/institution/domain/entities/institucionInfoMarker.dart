import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';

class InstitutionInfoMarker {
  final int id;
  final String nombre;
  final String direccion;
  final double latitud;
  final double longitud;
  final String uv;
  final String videoURL;
  final Gestion gestionAdm;
  final List<Foto> fotos;
  final Turno turno;

  InstitutionInfoMarker({
    required this.id,
    required this.nombre,
    required this.direccion,
    required this.uv,
    required this.videoURL,
    required this.gestionAdm,
    required this.longitud,
    required this.latitud,
    required this.fotos,
    required this.turno,
  });
}
