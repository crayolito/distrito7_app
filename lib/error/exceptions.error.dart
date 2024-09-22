class ErroresInternet implements Exception {
  final String mensaje;
  ErroresInternet([this.mensaje = 'Por favor, revisa tu conexión']);

  @override
  String toString() => 'Errores Internet: $mensaje';
}

class ErroresBackend implements Exception {
  final String mensaje;
  ErroresBackend([this.mensaje = 'Problemas al obtener los datos']);

  @override
  String toString() => 'Errores Servidor : $mensaje';
}

class ErroresDesconocidos implements Exception {
  final String mensaje;
  ErroresDesconocidos([this.mensaje = 'Problemas al cargar los datos']);

  @override
  String toString() => 'Errores Desconocidos: $mensaje';
}
