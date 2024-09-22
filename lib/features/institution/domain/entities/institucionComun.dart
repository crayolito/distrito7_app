import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';

class InstitucionComun {
  final int id;
  final String encargado;
  final String nombre;
  final String horario;
  final String coodenada_x;
  final String coodenada_y;
  final String direccion;
  final String uv;
  final List<Foto> fotos;
  final int numeroTelefono;
  final List<String> serviciosPublicos;
  // READ : ESTO SOLO ES PARA LOS CENTROS DE SALUD
  final List<Especialidades> especialidades;

  InstitucionComun({
    required this.id,
    required this.encargado,
    required this.nombre,
    required this.horario,
    required this.coodenada_x,
    required this.coodenada_y,
    required this.direccion,
    required this.uv,
    required this.fotos,
    required this.numeroTelefono,
    required this.serviciosPublicos,
    required this.especialidades,
  });
}

// class Foto {
//   final int id;
//   final String url;

//   Foto({required this.id, required this.url});

//   factory Foto.fromJson(Map<String, dynamic> json) {
//     return Foto(
//       id: json['id'] ?? 0,
//       url: json['url'] ?? '',
//     );
//   }

//   // Constructor vacio
//   factory Foto.vacio() {
//     return Foto(
//       id: 0,
//       url: '',
//     );
//   }
// }

class Especialidades {
  final int id;
  final String encargado;
  final String especialidad;

  Especialidades(
      {required this.id, required this.encargado, required this.especialidad});

  factory Especialidades.fromJson(Map<String, dynamic> json) {
    return Especialidades(
      id: json['id'] ?? 0,
      encargado: json['encargado'] ?? '',
      especialidad: json['especialidad'] ?? '',
    );
  }

  // Constructor vacio

  factory Especialidades.vacio() {
    return Especialidades(
      id: 0,
      encargado: '',
      especialidad: '',
    );
  }
}
