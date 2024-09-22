import 'package:dio/dio.dart';
import 'package:distrito7_mobile/error/exceptions.error.dart';
import 'package:distrito7_mobile/error/intersectores.error.dart';
import 'package:distrito7_mobile/features/institution/domain/datasources/institution_datasource.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/institucionesComunes.mapper.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/institucionesEspeciales.mapper.dart';
import 'package:distrito7_mobile/main.dart';

class InstitutionDataSourceImpl extends InstitutionDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://distritosietenest-50efc0ad53ae.herokuapp.com/api'))
    ..interceptors.add(IntersectoresError());

  @override
  Future<String> procesarDenuncia(
      String descripcionDenuncia,
      String imagenDenuncia,
      int idUnidadEducativa,
      String codigoAdministrativo) async {
    try {
      var response = await dio.post('/denuncias',
          data: {
            'texto': descripcionDenuncia,
            'imageUrl': imagenDenuncia,
            // 'codigoAdministrativo': codigoAdministrativo,
            'idUnidadEducativa': idUnidadEducativa
          },
          options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Añadido 201 para incluir la creación exitosa
        return "Salio todo correcto";
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      print(e);
      throw Exception('Error al procesar la denuncia');
    }
  }

  @override
  Future<List<InstitutionSpecial>> getInstitutionSpecial() async {
    try {
      var response = await dio.request('/unidadeseducativas',
          options: Options(method: 'GET', responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final structureData =
            InstitutionesSpecialsMapper.fromJsonList(response.data);
        return structureData;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      mensajeCliente!
          .showLoadingMessageErrores("Problemas al cargar los datos");
      throw ErroresDesconocidos();
    }
  }

  @override
  Future<List<InstitucionComun>> getInstitutionComun(String url) async {
    try {
      var response = await dio.request(url,
          options: Options(method: 'GET', responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final structureData =
            InstitutionesComunesMapper.fromJsonList(response.data);
        return structureData;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      mensajeCliente!
          .showLoadingMessageErrores("Problemas al cargar los datos");
      throw ErroresDesconocidos();
    }
  }
}
