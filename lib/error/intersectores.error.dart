import 'package:dio/dio.dart';
import 'package:distrito7_mobile/error/exceptions.error.dart';

class IntersectoresError extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // READ : ERRORES DE INTERNET
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.sendTimeout) {
      print("Problemas de conexión a internet");
      handler.next(DioException(
          requestOptions: err.requestOptions, error: ErroresInternet()));
      return;
    }

    // READ : ERRORES AL TRAER DATOS DEL BACKEND
    if (err.type == DioExceptionType.badResponse) {
      print("Problemas al obtener los datos del servidor");
      handler.next(DioException(
          requestOptions: err.requestOptions, error: ErroresBackend()));
      return;
    }

    // READ : ERRORES DESCONOCIDOS
    if (err.type == DioExceptionType.unknown) {
      print("Problemas al cargar los datos");
      handler.next(DioException(
          requestOptions: err.requestOptions, error: ErroresDesconocidos()));
      return;
    }

    // Si el error no coincide con ninguno de los anteriores, pasa el error original
    handler.next(err);
  }
}
