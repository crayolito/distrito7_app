import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisitasInstitucionales extends StatelessWidget {
  const VisitasInstitucionales({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    List<Visita> visitas = [
      ...institutionBloc.state.institucionEspecial!.visita
    ];

    // visitas.add(Visita(
    //     id: 1,
    //     titulo: 'Visita del Gobernador',
    //     fecha: '2023-10-01',
    //     motivo: 'Inspección de obras',
    //     quienes: 'Gobernador, Secretario de Obras Públicas'));

    // visitas.add(Visita(
    //     id: 2,
    //     titulo: 'Visita de la Ministra de Salud',
    //     fecha: '2023-10-02',
    //     motivo: 'Inauguración de hospital',
    //     quienes: 'Ministra de Salud, Director del Hospital'));

    return visitas.isEmpty
        ? Center(
            child: Text("No hay información disponible",
                style: estilosText!.titulo3InstitucionScreen),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...visitas.map((elemento) {
                return ItemVisitInfo(
                    titulo: elemento.titulo,
                    fecha: elemento.fecha,
                    motivo: elemento.motivo,
                    quienesVisitaron: elemento.quienes);
              }).toList()
            ],
          );
  }
}

class ItemVisitInfo extends StatelessWidget {
  const ItemVisitInfo({
    required this.titulo,
    required this.fecha,
    required this.motivo,
    required this.quienesVisitaron,
    super.key,
  });

  final String titulo;
  final String fecha;
  final String motivo;
  final String quienesVisitaron;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.33,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: size.height * 0.05,
              width: double.infinity,
              child: Text(titulo,
                  style: estilosText!.titulo3InstitucionScreen,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.date_range_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.06,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: estilosText!.titulo3InstitucionScreen,
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  titulo: "Fecha",
                  cantLineas: 2,
                  data1: fecha),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.account_box_outlined,
              iconSize: 25,
              heightGeneral: size.height * 0.1,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: estilosText!.titulo3InstitucionScreen,
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  titulo: "Motivo",
                  cantLineas: 3,
                  data1: motivo),
            ),
            IconInformation(
              widthGeneral: size.width,
              icon: Icons.people_alt_rounded,
              iconSize: 25,
              heightGeneral: size.height * 0.1,
              widthIcon: size.width * 0.09,
              widthText: size.width * 0.815,
              textoFunction: cantidadText(
                  bodyText1: estilosText!.titulo3InstitucionScreen,
                  bodyText2: estilosText!.subtitulo3InstitucionScreen,
                  titulo: "Quienes Visitaron",
                  cantLineas: 3,
                  data1: quienesVisitaron),
            ),
          ],
        ));
  }
}
