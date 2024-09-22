import 'package:dio/dio.dart';
import 'package:distrito7_mobile/error/exceptions.error.dart';
import 'package:distrito7_mobile/error/intersectores.error.dart';
import 'package:distrito7_mobile/features/home/domain/datasources/home_datasource.dart';
import 'package:distrito7_mobile/main.dart';

class HomeDatasourceImpl extends HomeDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://distritosietenest-50efc0ad53ae.herokuapp.com/api'))
    ..interceptors.add(IntersectoresError());

  @override
  Future<void> registroNroEmergencia(String titulo) async {
    try {
      var response =
          await dio.post('/numerosemergencias', data: {'nombre': titulo});
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      // Manejo de excepciones genéricas si es necesario
      mensajeCliente!
          .showLoadingMessageErrores("Problemas al cargar los datos");
      throw ErroresDesconocidos();
    }
  }
}
