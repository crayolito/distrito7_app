import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AreaCareList extends StatelessWidget {
  const AreaCareList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    final List<Mantenimiento> mantenimientos = [
      ...institutionBloc.state.institucionEspecial!.mantenimientos
    ];

    return mantenimientos.isEmpty
        ? Center(
            child: Text("No hay información disponible",
                style: estilosText!.titulo3InstitucionScreen),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...mantenimientos.map((elemento) {
                return ItemCareInfo(
                    titulo: elemento.titulo,
                    fecha: elemento.fecha,
                    encargado: elemento.encargado,
                    empresa: elemento.empresa);
              }).toList()
            ],
          );
  }
}

class ItemCareInfo extends StatelessWidget {
  const ItemCareInfo({
    required this.titulo,
    required this.fecha,
    required this.encargado,
    required this.empresa,
    super.key,
  });

  final String titulo;
  final String fecha;
  final String encargado;
  final String empresa;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.17,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titulo,
              style: estilosText!.titulo3InstitucionScreen,
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.date_range_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.04,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  data1: fecha),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.account_box_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.04,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  data1: encargado),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: FontAwesomeIcons.buildingShield,
              iconSize: 25,
              heightGeneral: size.height * 0.04,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                bodyText2: estilosText!.subtitulo3InstitucionScreen,
                data1: empresa,
              ),
            ),
          ],
        ));
  }
}
