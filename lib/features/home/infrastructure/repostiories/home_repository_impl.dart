import 'package:distrito7_mobile/features/home/domain/datasources/home_datasource.dart';
import 'package:distrito7_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:distrito7_mobile/features/home/infrastructure/datasources/home_datasource_impl.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl({HomeDataSource? dataSource})
      : dataSource = dataSource ?? HomeDatasourceImpl();

  @override
  Future<void> registroNroEmergencia(String titulo) async {
    return await dataSource.registroNroEmergencia(titulo);
  }
}
