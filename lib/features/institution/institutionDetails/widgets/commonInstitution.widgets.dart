import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/titleBase.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/DropDownInfoBloc.dart';
import 'package:distrito7_mobile/shared/widgets/additionalOptions.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonInstitution extends StatelessWidget {
  const CommonInstitution({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleDateFirst(),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.person,
          iconSize: 30,
          heightGeneral: (size.height * 0.618) * 0.15,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              bodyText2: estilosText!.subtituloInstitucionScreen,
              titulo: tituloInstiSpecial(institutionBloc.state.institutionType),
              cantLineas: 3,
              data1: institutionBloc.state.institucionComun!.encargado),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.house_outlined,
          iconSize: 35,
          heightGeneral: (size.height * 0.618) * 0.2,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              bodyText2: estilosText!.subtituloInstitucionScreen,
              titulo: "DIRECCION",
              cantLineas: 4,
              data1: institutionBloc.state.institucionComun!.direccion),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.timer,
          iconSize: 30,
          heightGeneral: (size.height * 0.618) * 0.15,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              bodyText2: estilosText!.subtituloInstitucionScreen,
              titulo: "HORARIO ATENCION",
              cantLineas: 2,
              data1: institutionBloc.state.institucionComun!.horario),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.phone,
          iconSize: 30,
          heightGeneral: (size.height * 0.618) * 0.1,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              bodyText2: estilosText!.subtituloInstitucionScreen,
              titulo: "NR ATENCION",
              cantLineas: 2,
              data1: institutionBloc.state.institucionComun!.horario),
        ),
        // NOTE : Servicios publicos que ofrece la instituciones
        // READ : Solo los Centros medicos tendran especialidades
        DropDownInfoBloc(
          checkIS: institutionBloc.state.checkInitInfo,
          optionsInfo: institutionBloc.state.optionsInfo,
          onTap: () async {
            Future.delayed(const Duration(seconds: 1)).then((_) {
              if (_scrollController.hasClients) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent + 100,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            });
          },
        ),
        AdditionalOptions(
          scrollController: _scrollController,
        ),
        SizedBox(height: size.height * 0.01),
      ],
    );
  }

  String tituloInstiSpecial(InstitutionType type) {
    switch (type) {
      case InstitutionType.oficinaDistrital:
        return "SUB ALCALDE";
      case InstitutionType.puntoTuristico:
        return "ENCARGADO";
      case InstitutionType.centroPolicial:
        return "ENCARGADO";
      default:
        return "ENCARGADO";
    }
  }
}

class OnlyImage extends StatelessWidget {
  const OnlyImage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.049,
          left: size.width * 0.04,
          right: size.width * 0.04),
      width: size.width,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        image: const DecorationImage(
            image: AssetImage("assets/fondo/OficinaSubAl.png"),
            fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ],
      ),
    );
  }
}
