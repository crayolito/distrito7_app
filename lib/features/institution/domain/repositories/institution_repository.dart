import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';

abstract class InstitutionRepository {
  Future<String> procesarDenuncia(
      String descripcionDenuncia,
      String imagenDenuncia,
      int idUnidadEducativa,
      String codigoAdministrativo);
  Future<List<InstitucionComun>> getInstitutionComun(String url);
  Future<List<InstitutionSpecial>> getInstitutionSpecial();
}
