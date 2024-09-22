import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';

class InstitutionComunMapper {
  static InstitucionComun fromJson(Map<String, dynamic> json) {
    return InstitucionComun(
      id: json['id'] ?? 0,
      encargado: json['encargado'] ?? '',
      nombre: json['nombre'] ?? '',
      horario: json['horario'] ?? '',
      coodenada_x: json['coordenada_x'] ?? '',
      coodenada_y: json['coordenada_y'] ?? '',
      direccion: json['direccion'] ?? '',
      uv: json['uv'] ?? '',
      numeroTelefono: json['numeroTelefono'] ?? 0,
      fotos: (json['fotos'] is List
          ? (json['fotos'] as List<dynamic>)
              .map((foto) => Foto.fromJson(foto))
              .toList()
          : json['fotoUrl'] is String
              ? [Foto(id: 0, url: json['fotoUrl'])]
              : []),
      serviciosPublicos: (json['serviciosPublicos'] as List<dynamic>?)
              ?.map((servicio) => servicio as String)
              .toList() ??
          [],
      especialidades: (json['especialidades'] is List
          ? (json['especialidades'] as List<dynamic>)
              .map((especialidad) => Especialidades.fromJson(especialidad))
              .toList()
          : []),
    );
  }
}
