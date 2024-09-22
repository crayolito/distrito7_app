import 'package:distrito7_mobile/features/institution/domain/datasources/institution_datasource.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/features/institution/domain/repositories/institution_repository.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/datasources/institution_datasource_impl.dart';

class InstitutionRepositoryImpl extends InstitutionRepository {
  final InstitutionDataSource dataSource;

  InstitutionRepositoryImpl({InstitutionDataSource? dataSource})
      : dataSource = dataSource ?? InstitutionDataSourceImpl();

  @override
  Future<String> procesarDenuncia(
      String descripcionDenuncia,
      String imagenDenuncia,
      int idUnidadEducativa,
      String codigoAdministrativo) async {
    return await dataSource.procesarDenuncia(descripcionDenuncia,
        imagenDenuncia, idUnidadEducativa, codigoAdministrativo);
  }

  @override
  Future<List<InstitucionComun>> getInstitutionComun(String url) async {
    return await dataSource.getInstitutionComun(url);
  }

  @override
  Future<List<InstitutionSpecial>> getInstitutionSpecial() async {
    return await dataSource.getInstitutionSpecial();
  }
}
