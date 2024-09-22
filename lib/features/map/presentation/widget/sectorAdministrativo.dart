import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectorAdministrativo extends StatelessWidget {
  const SectorAdministrativo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // List<GestionPrueba> gestion = [];
    String titulo1 = "";
    String titulo2 = "";
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.unidadEducativa:
        // gestion = List.from(gestionDataUD);
        titulo1 = "Turno Administrativo";
        titulo2 = "Turno ${infoMarkerBloc.state.infoStand!.turno.nombre}";
        break;
      case InstitutionType.oficinaDistrital:
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroPolicial:
      case InstitutionType.centroRecreativo:
      case InstitutionType.puntoTuristico:
        titulo1 = "Info. Administrativa";
        titulo2 = "Turno Continuo";
        // gestion = List.from(gestionDataCM);
        break;
      default:
        titulo1 = "Info. Administrativa";
      // gestion = List.from(gestionDataCM);
    }

    return SizedBox(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: size.width * 0.04, top: size.height * 0.015),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                titulo1,
                style: estilosText!.subtitulo2VentanaInfoMarker,
              ),
            ),
          ),
          TurnoExpansionContainerInfo(
            titleBase: titulo2,
            titleInfo1: "Director",
            textoBody1: infoMarkerBloc.state.infoStand!.gestionAdm.director,
            titleInfo2: "Horario de Atencion",
            textoBody2: infoMarkerBloc.state.infoStand!.gestionAdm.horario,
            titleInfo3: "Nr Atencion",
            textoBody3:
                infoMarkerBloc.state.infoStand!.gestionAdm.numero.toString(),
          )
        ],
      ),
    );
  }
}

class TurnoExpansionContainerInfo extends StatelessWidget {
  const TurnoExpansionContainerInfo({
    super.key,
    required this.titleBase,
    // Titulo Principal 1
    required this.titleInfo1,
    // Titulo Body 1
    required this.textoBody1,
    // Contenido Body 1
    required this.titleInfo2,
    required this.textoBody2,
    required this.titleInfo3,
    required this.textoBody3,
  });

  final String titleBase;

  final String titleInfo1;
  final String textoBody1;

  final String titleInfo2;
  final String textoBody2;

  final String titleInfo3;
  final String textoBody3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final TextStyle headlineLarge = Theme.of(context).textTheme.headlineLarge!;
    // final TextStyle headlineMedium = Theme.of(context).textTheme.labelLarge!;

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: const Color(0xFF00A541)),
      child: ExpansionTile(
        title: Text(
          titleBase,
          style: estilosText!.titulo2SeccionInfo,
        ),
        leading: const Icon(Icons.pending_actions_outlined),
        collapsedIconColor: const Color(0xFF44BEED),
        iconColor: const Color(0xFF44BEED),
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                IconInformation(
                    icon: Icons.person,
                    iconSize: 25,
                    heightGeneral: size.height * 0.06,
                    widthGeneral: size.width,
                    widthIcon: size.width * 0.13,
                    widthText: size.width * 0.85,
                    textoFunction: cantidadText(
                        bodyText1: estilosText!.titulo2SeccionInfo,
                        bodyText2: estilosText!.titulo3SeccionInfo,
                        cantLineas: 2,
                        titulo: "Director",
                        data1: textoBody1)),
                IconInformation(
                    icon: Icons.timer,
                    iconSize: 25,
                    heightGeneral: size.height * 0.07,
                    widthGeneral: size.width,
                    widthIcon: size.width * 0.13,
                    widthText: size.width * 0.85,
                    textoFunction: cantidadText(
                        bodyText1: estilosText!.titulo2SeccionInfo,
                        bodyText2: estilosText!.titulo3SeccionInfo,
                        cantLineas: 2,
                        titulo: "Horario Atencion",
                        data1: textoBody2)),
                IconInformation(
                    icon: Icons.phone,
                    iconSize: 25,
                    heightGeneral: size.height * 0.06,
                    widthGeneral: size.width,
                    widthIcon: size.width * 0.13,
                    widthText: size.width * 0.85,
                    textoFunction: cantidadText(
                        bodyText1: estilosText!.titulo2SeccionInfo,
                        bodyText2: estilosText!.titulo3SeccionInfo,
                        cantLineas: 2,
                        titulo: "Nr Oficina",
                        data1: textoBody3)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
