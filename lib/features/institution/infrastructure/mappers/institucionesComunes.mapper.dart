import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/institucionComun.mapper.dart';

class InstitutionesComunesMapper {
  static List<InstitucionComun> fromJsonList(jsonResponse) {
    List<InstitucionComun> institucionesComunes = [
      // InstitucionComun(
      //   id: 1,
      //   encargado: 'Juan Perez',
      //   nombre: 'Centro de Salud 1',
      //   horario: '08:00 - 17:00',
      //   coodenada_x: '-63.13914783763187 ',
      //   coodenada_y: '-17.79457523673954',
      //   direccion: 'Calle Falsa 123',
      //   uv: '123456',
      //   fotos: [
      //     Foto(
      //       id: 1,
      //       url:
      //           'https://i.pinimg.com/564x/01/fc/32/01fc3273ca05557bc81bc8e074d59cf4.jpg',
      //     )
      //   ],
      //   numeroTelefono: 123456789,
      //   serviciosPublicos: ['Agua', 'Electricidad'],
      //   especialidades: [
      //     Especialidades(
      //       id: 1,
      //       encargado: 'Juan Perez',
      //       especialidad: 'Medicina General',
      //     ),
      //     Especialidades(
      //       id: 2,
      //       encargado: 'Juan Perez',
      //       especialidad: 'Odontología',
      //     )
      //   ],
      // ),
      // InstitucionComun(
      //   id: 2,
      //   encargado: 'Juan Perez',
      //   nombre: 'Centro de Salud 2',
      //   horario: '08:00 - 17:00',
      //   coodenada_x: '-63.106359893768484',
      //   coodenada_y: '-17.791057510668942',
      //   direccion: 'Calle Falsa 123',
      //   uv: '123456',
      //   fotos: [
      //     Foto(
      //       id: 1,
      //       url:
      //           'https://i.pinimg.com/564x/01/fc/32/01fc3273ca05557bc81bc8e074d59cf4.jpg',
      //     )
      //   ],
      //   numeroTelefono: 123456789,
      //   serviciosPublicos: ['Agua', 'Electricidad'],
      //   especialidades: [
      //     Especialidades(
      //       id: 1,
      //       encargado: 'Juan Perez',
      //       especialidad: 'Medicina General',
      //     ),
      //     Especialidades(
      //       id: 2,
      //       encargado: 'Juan Perez',
      //       especialidad: 'Odontología',
      //     )
      //   ],
      // ),
    ];
    // Verificar si jsonResponse es una lista o un objeto
    // Verificar si jsonResponse es una lista o un objeto
    if (jsonResponse is List) {
      for (var item in jsonResponse) {
        institucionesComunes.add(InstitutionComunMapper.fromJson(item));
      }
    } else if (jsonResponse is Map<String, dynamic>) {
      institucionesComunes.add(InstitutionComunMapper.fromJson(jsonResponse));
    }

    return institucionesComunes;
  }
}
