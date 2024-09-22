import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemInformationShift extends StatelessWidget {
  const ItemInformationShift({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String tituloJunta = "";
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final Gestion infoGestion =
        institutionBloc.state.institucionEspecial!.gestion;

    // final Gestion infoGestion = Gestion(
    //   id: 1,
    //   numero: '12345',
    //   horario: '08:00 - 16:00',
    //   director: 'Juan Pérez',
    //   imageJuntaEscolar:
    //       'https://i.pinimg.com/564x/4f/4c/0a/4f4c0a43c159b10d854cb93e99341d98.jpg',
    // );

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.unidadEducativa:
        tituloJunta = "JUNTA ESCOLAR";
        break;
      case InstitutionType.centroSalud:
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroPolicial:
      case InstitutionType.centroRecreativo:
      case InstitutionType.puntoTuristico:
        tituloJunta = "JUNTA DIRECTA";
        break;
      default:
    }
    return SizedBox(
        height: size.height * 0.65,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TURNO ${institutionBloc.state.institucionEspecial!.turno.nombre}"
                  .toUpperCase(),
              style: estilosText!.titulo3InstitucionScreen,
            ),
            IconInformation(
              icon: Icons.person,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthGeneral: size.width,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: estilosText!.titulo3InstitucionScreen,
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  titulo: "Director",
                  cantLineas: 2,
                  data1: infoGestion.director),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.timer,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: estilosText!.titulo3InstitucionScreen,
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  titulo: "Horario Atencion",
                  cantLineas: 2,
                  data1: infoGestion.horario),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.phone,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                bodyText1: estilosText!.titulo3InstitucionScreen,
                bodyText2: estilosText!.subtitulo3InstitucionScreen,
                titulo: "Nr Oficina",
                cantLineas: 2,
                data1: infoGestion.numero.toString(),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              tituloJunta.toUpperCase(),
              style: estilosText!.titulo3InstitucionScreen,
            ),
            IconInformation(
              icon: Icons.person,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthGeneral: size.width,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: estilosText!.titulo3InstitucionScreen,
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  titulo: "Presidente",
                  cantLineas: 2,
                  data1: infoGestion.director),
            ),
            infoGestion.imageJuntaEscolar == ""
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: size.width,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(infoGestion.imageJuntaEscolar),
                            fit: BoxFit.cover)),
                  )
          ],
        ));
  }
}
