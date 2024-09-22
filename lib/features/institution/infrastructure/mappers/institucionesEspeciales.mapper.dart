import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/institucionEspecial.mapper.dart';

class InstitutionesSpecialsMapper {
  static List<InstitutionSpecial> fromJsonList(List<dynamic> jsonList) {
    List<InstitutionSpecial> institucionesEspeciales = [];
    for (var item in jsonList) {
      institucionesEspeciales.add(InstitutionEspecialMapper.fromJson(item));
    }
    return institucionesEspeciales;
  }
}
