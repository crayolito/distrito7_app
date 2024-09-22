import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/data/categories-data.dart';
import 'package:distrito7_mobile/shared/components/components.dart';
import 'package:distrito7_mobile/shared/components/institutionServiceEspecialidades.dart';
import 'package:distrito7_mobile/shared/components/institutionServicePublics.dart';

class HelpersInstitution {
  static String titleDesignation(InstitutionType type) {
    switch (type) {
      case InstitutionType.unidadEducativa:
        return 'Unidad Educativa';
      case InstitutionType.centroSalud:
        return 'Centro de Salud';
      case InstitutionType.centroDeportivo:
        return 'Centro Deportivo';
      case InstitutionType.centroRecreativo:
        return 'Centro Recreativo';
      case InstitutionType.centroPolicial:
        return 'Centro Policial';
      case InstitutionType.puntoTuristico:
        return 'Punto Turistico';
      default:
        return 'Institucion Publica';
    }
  }

  static List<OptionsInfo> selectOptionsInfo(InstitutionType type) {
    List<OptionsInfo> opcionesInfo = [];
    switch (type) {
      case InstitutionType.unidadEducativa:
        opcionesInfo = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/renovacion.png",
              view: const AreaCareList()),
          OptionsInfo(
              idInit: 1,
              iconLink: "assets/infoScreen/tecnologia.png",
              view: const TechnologyList()),
          OptionsInfo(
              idInit: 2,
              iconLink: "assets/infoScreen/visitas.png",
              view: const VisitasInstitucionales())
        ];
        break;
      case InstitutionType.centroSalud:
        opcionesInfo = [
          // READ : Servicios de especialidades que ofrece el centro medico
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/servicioPublico.png",
              view: const ServiciosEspecialidades()),
        ];
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroRecreativo:
      case InstitutionType.centroPolicial:
      case InstitutionType.puntoTuristico:
      case InstitutionType.oficinaDistrital:
        opcionesInfo = [
          OptionsInfo(
              idInit: 0,
              iconLink: "assets/infoScreen/servicioPublico.png",
              view: const ServiciosPublicos()),
        ];
        break;
      case InstitutionType.none:
      case InstitutionType.nrEmergencias:
        break;
      default:
        break;
    }
    return opcionesInfo;
  }

  static String selectTurnoImagen(String type) {
    if (type.toLowerCase().contains("mañana")) {
      return "assets/infoScreen/turnoMañana.png";
    }

    if (type.toLowerCase().contains("tarde")) {
      return "assets/infoScreen/turnoTarde.png";
    }

    return "assets/infoScreen/turnoNoche.png";
  }

  static List<OptionsInfo> selectOptionsAdm(
      {required InstitutionType type,
      required String  turno }) {
    List<OptionsInfo> opcionesAdm = [];

    switch (type) {
      case InstitutionType.unidadEducativa:
        opcionesAdm = [
          OptionsInfo(
              idInit: 0,
              iconLink: selectTurnoImagen(turno),
              view: const ItemInformationShift()),
        ];
        break;
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroRecreativo:
      case InstitutionType.oficinaDistrital:
      case InstitutionType.puntoTuristico:
      case InstitutionType.centroPolicial:
      case InstitutionType.none:
      case InstitutionType.nrEmergencias:
        opcionesAdm = [];
        break;
      default:
        opcionesAdm = [];
        break;
    }
    return opcionesAdm;
  }
}
