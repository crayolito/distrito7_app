class InstitutionSpecial {
  final int id;
  final String nombre;
  final String coodenada_x;
  final String coodenada_y;
  final String direccion;
  final String uv;
  final String historia;
  final String video;
  final String slug; //
  final List<Foto> fotos;
  final Infraestructura infraestructura;
  final Turno turno;
  final TipoColegio tipoColegio;
  final Gestion gestion;
  final List<ApoyoSocial> apoyosSociales;
  final List<ApoyoGubernamental> apoyosGubernamentales;
  final List<Desayuno> desayunos;
  final List<Mantenimiento> mantenimientos;
  final List<Visita> visita;

  InstitutionSpecial({
    required this.id,
    required this.nombre,
    required this.coodenada_x,
    required this.coodenada_y,
    required this.direccion,
    required this.uv,
    required this.historia,
    required this.video,
    required this.slug,
    required this.fotos,
    required this.infraestructura,
    required this.turno,
    required this.tipoColegio,
    required this.gestion,
    required this.apoyosSociales,
    required this.apoyosGubernamentales,
    required this.desayunos,
    required this.mantenimientos,
    required this.visita,
  });
}

class Foto {
  final int id;
  final String url;

  Foto({required this.id, required this.url});

  factory Foto.fromJson(Map<String, dynamic> json) {
    return Foto(
      id: json['id'] ?? 0,
      url: json['url'] ?? '',
    );
  }

  // Constructor vacio
  factory Foto.vacio() {
    return Foto(
      id: 0,
      url: '',
    );
  }
}

class Infraestructura {
  final int id;
  final String nombre;

  Infraestructura({required this.id, required this.nombre});

  factory Infraestructura.fromJson(Map<String, dynamic> json) {
    return Infraestructura(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }

  // Constructor vacio
  factory Infraestructura.vacio() {
    return Infraestructura(
      id: 0,
      nombre: '',
    );
  }
}

class TipoColegio {
  final int id;
  final String nombre;

  TipoColegio({required this.id, required this.nombre});

  factory TipoColegio.fromJson(Map<String, dynamic> json) {
    return TipoColegio(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }

  // Constructor vacio
  factory TipoColegio.vacio() {
    return TipoColegio(
      id: 0,
      nombre: '',
    );
  }
}

class Turno {
  final int id;
  final String nombre;

  Turno({required this.id, required this.nombre});

  factory Turno.fromJson(Map<String, dynamic> json) {
    return Turno(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }

  // Constructor vacio
  factory Turno.vacio() {
    return Turno(
      id: 0,
      nombre: '',
    );
  }
}

class Gestion {
  final int id;
  final int numero;
  final String horario;
  final String director;
  final String imageJuntaEscolar;

  Gestion(
      {required this.id,
      required this.numero,
      required this.horario,
      required this.director,
      required this.imageJuntaEscolar});

  factory Gestion.fromJson(Map<String, dynamic> json) {
    return Gestion(
      id: json['id'] ?? 0,
      numero: json['numero'] ?? '',
      horario: json['horario'] ?? '',
      director: json['director'] ?? '',
      imageJuntaEscolar: json['juntaescolar'] ??
          'https://res.cloudinary.com/da9xsfose/image/upload/v1724609872/rjgsz1tmf03f0mlu2buu.jpg',
    );
  }

  // Constructor nombrado 'vacio'
  factory Gestion.vacio() {
    return Gestion(
      id: 0,
      numero: 0,
      horario: '',
      director: '',
      imageJuntaEscolar:
          'https://res.cloudinary.com/da9xsfose/image/upload/v1724609872/rjgsz1tmf03f0mlu2buu.jpg',
    );
  }
}

class ApoyoSocial {
  final int id;
  final String nombre;
  final int cantidad;
  final String encargadoEntrega;
  final String fecha;

  ApoyoSocial(
      {required this.id,
      required this.nombre,
      required this.cantidad,
      required this.encargadoEntrega,
      required this.fecha});

  factory ApoyoSocial.fromJson(Map<String, dynamic> json) {
    return ApoyoSocial(
      id: json['idUnidadEducativa'] ?? 0,
      nombre: json['nombre'] ?? '',
      cantidad: json['cantidad'] ?? 0,
      encargadoEntrega: json['nombreEntrega'] ?? '',
      fecha: json['fecha'] ?? '',
    );
  }

  // Constructor vacío
  ApoyoSocial.vacio()
      : id = 0,
        nombre = '',
        cantidad = 0,
        encargadoEntrega = '',
        fecha = '';
}

class ApoyoGubernamental {
  final int id;
  final String nombre;
  final int cantidad;
  final String encargadoEntrega;
  final String fecha;

  ApoyoGubernamental({
    required this.id,
    required this.nombre,
    required this.cantidad,
    required this.encargadoEntrega,
    required this.fecha,
  });

  factory ApoyoGubernamental.fromJson(Map<String, dynamic> json) {
    return ApoyoGubernamental(
      id: json['id'] ?? 0,
      nombre:
          json['categoria'] != null ? json['categoria']['nombre'] ?? '' : '',
      cantidad: json['cantidad'] ?? 0,
      encargadoEntrega: json['nombreEntrega'] ?? '',
      fecha: json['fecha'] ?? '',
    );
  }

  // Constructor vacío
  ApoyoGubernamental.vacio()
      : id = 0,
        nombre = '',
        cantidad = 0,
        encargadoEntrega = '',
        fecha = '';
}

class CategoriaAG {
  final int id;
  final String nombre;

  CategoriaAG({required this.id, required this.nombre});

  factory CategoriaAG.fromJson(Map<String, dynamic> json) {
    return CategoriaAG(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
    );
  }

  // Constructor vacío
  CategoriaAG.vacio()
      : id = 0,
        nombre = '';
}

class Desayuno {
  final int id;
  final String nombre;
  final int cantidad;
  final String encargadoEntrega;
  final String fecha;

  Desayuno(
      {required this.id,
      required this.nombre,
      required this.cantidad,
      required this.encargadoEntrega,
      required this.fecha});

  factory Desayuno.fromJson(Map<String, dynamic> json) {
    return Desayuno(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      cantidad: json['cantidad'] ?? 0,
      encargadoEntrega: json['nombreEntrega'] ?? '',
      fecha: json['fecha'] ?? '',
    );
  }

  // Constructor vacío
  Desayuno.vacio()
      : id = 0,
        nombre = '',
        cantidad = 0,
        encargadoEntrega = '',
        fecha = '';
}

class Mantenimiento {
  final int id;
  final String titulo;
  final String fecha;
  final String encargado;
  final String empresa;

  Mantenimiento({
    required this.id,
    required this.titulo,
    required this.fecha,
    required this.encargado,
    required this.empresa,
  });

  factory Mantenimiento.fromJson(Map<String, dynamic> json) {
    return Mantenimiento(
      id: json['id'] ?? 0,
      titulo: json['titulo'] ?? '',
      fecha: json['fecha'] ?? '',
      encargado: json['encargado'] ?? '',
      empresa: json['empresa'] ?? '',
    );
  }

  // Constructor vacío
  Mantenimiento.vacio()
      : id = 0,
        titulo = '',
        fecha = '',
        encargado = '',
        empresa = '';
}

class Visita {
  final int id;
  final String titulo;
  final String fecha;
  final String motivo;
  final String quienes;

  Visita({
    required this.id,
    required this.titulo,
    required this.fecha,
    required this.motivo,
    required this.quienes,
  });

  factory Visita.fromJson(Map<String, dynamic> json) {
    return Visita(
      id: json['id'] ?? 0,
      titulo: json['titulo'] ?? '',
      fecha: json['fecha'] ?? '',
      motivo: json['motivo'] ?? '',
      quienes: json['quienes'] ?? 'Visitaron Autoridades Gubernamentales',
    );
  }

  // Constructor vacío
  Visita.vacio()
      : id = 0,
        titulo = '',
        fecha = '',
        motivo = '',
        quienes = '';
}
