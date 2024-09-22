import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';

class InstitutionEspecialMapper {
  static InstitutionSpecial fromJson(Map<String, dynamic> json) {
    return InstitutionSpecial(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      coodenada_x: json['coordenada_x'] ?? '',
      coodenada_y: json['coordenada_y'] ?? '',
      direccion: json['direccion'] ?? '',
      uv: json['uv'] ?? '',
      historia: json['historia'] ?? '',
      video: json['video'] ?? '',
      slug: json['slug'] ?? '',
      fotos: (json['fotos'] as List<dynamic>?)
              ?.map((foto) => Foto.fromJson(foto))
              .toList() ??
          [],
      infraestructura: json['idInfraestructura'] != null
          ? Infraestructura.fromJson(json['idInfraestructura'])
          : Infraestructura.vacio(),
      tipoColegio: json['idTipoColegio'] != null
          ? TipoColegio.fromJson(json['idTipoColegio'])
          : TipoColegio.vacio(),
      turno: json['idTurno'] != null
          ? Turno.fromJson(json['idTurno'])
          : Turno.vacio(),
      gestion: json['gestion'] != null
          ? Gestion.fromJson(json['gestion'])
          : Gestion.vacio(),
      apoyosSociales: (json['apoyosSociales'] as List<dynamic>?)
              ?.map((apoyo) => ApoyoSocial.fromJson(apoyo))
              .toList() ??
          [],
      apoyosGubernamentales: (json['apoyosGubernamentales'] as List<dynamic>?)
              ?.map((apoyo) => ApoyoGubernamental.fromJson(apoyo))
              .toList() ??
          [],
      desayunos: (json['desayunos'] as List<dynamic>?)
              ?.map((desayuno) => Desayuno.fromJson(desayuno))
              .toList() ??
          [],
      mantenimientos: (json['mantenimientos'] as List<dynamic>?)
              ?.map((mantenimiento) => Mantenimiento.fromJson(mantenimiento))
              .toList() ??
          [],
      visita: (json['visitas'] as List<dynamic>?)
              ?.map((visita) => Visita.fromJson(visita))
              .toList() ??
          [],
    );
  }
}
