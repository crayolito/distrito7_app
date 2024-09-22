import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TechnologyList extends StatelessWidget {
  const TechnologyList({super.key});

  @override
  Widget build(BuildContext context) {
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    List<ApoyoGubernamental> apoyosGubernamentales = [
      ...institutionBloc.state.institucionEspecial!.apoyosGubernamentales
    ];

    // apoyosGubernamentales.add(ApoyoGubernamental(
    //   id: 1,
    //   nombre: "Apoyo Gubernamental 1",
    //   fecha: "2021-10-10",
    //   encargadoEntrega: "Encargado 1",
    //   cantidad: 10,
    // ));

    // apoyosGubernamentales.add(ApoyoGubernamental(
    //   id: 2,
    //   nombre: "Apoyo Gubernamental 1",
    //   fecha: "2021-10-10",
    //   encargadoEntrega: "Encargado 1",
    //   cantidad: 10,
    // ));

    List<ApoyoSocial> apoyoSociales = [
      ...institutionBloc.state.institucionEspecial!.apoyosSociales
    ];

    // apoyoSociales.add(
    //   ApoyoSocial(
    //     id: 1,
    //     nombre: "Apoyo Social 1",
    //     fecha: "2021-10-10",
    //     encargadoEntrega: "Encargado 1",
    //     cantidad: 10,
    //   ),
    // );

    // apoyoSociales.add(
    //   ApoyoSocial(
    //     id: 2,
    //     nombre: "Apoyo Social 1",
    //     fecha: "2021-10-10",
    //     encargadoEntrega: "Encargado 1",
    //     cantidad: 10,
    //   ),
    // );

    List<Desayuno> desayunos = [
      ...institutionBloc.state.institucionEspecial!.desayunos
    ];

    // desayunos.add(Desayuno(
    //     id: 1,
    //     nombre: 'Café',
    //     cantidad: 2,
    //     encargadoEntrega: 'Juan Pérez',
    //     fecha: '2023-10-01'));

    // desayunos.add(Desayuno(
    //     id: 2,
    //     nombre: 'Pan',
    //     cantidad: 5,
    //     encargadoEntrega: 'María López',
    //     fecha: '2023-10-02'));

    if (apoyoSociales.isEmpty &&
        apoyosGubernamentales.isEmpty &&
        desayunos.isEmpty) {
      return Center(
        child: Text("No hay información disponible",
            style: estilosText!.titulo3InstitucionScreen),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          apoyoSociales.isNotEmpty
              ? ItemsApoyosSociales(
                  titulo: "Apoyos Sociales", apoyosSociales: apoyoSociales)
              : Container(),
          apoyosGubernamentales.isNotEmpty
              ? ItemsApoyosGubernamentales(
                  titulo: "Apoyos Gubernamentales",
                  apoyosGubernamentales: apoyosGubernamentales)
              : Container(),
          desayunos.isNotEmpty
              ? ItemsDesayunos(
                  titulo: "Desayunos Escolares", desayunos: desayunos)
              : Container()
        ],
      );
    }
  }
}

String formatFecha(String fechaIso) {
  DateTime fecha = DateTime.parse(fechaIso);
  return DateFormat('dd/MM/yyyy').format(fecha);
}

class ItemsApoyosSociales extends StatelessWidget {
  const ItemsApoyosSociales(
      {super.key, required this.titulo, required this.apoyosSociales});

  final String titulo;
  final List<ApoyoSocial> apoyosSociales;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo.toUpperCase(),
          style: estilosText!.titulo3InstitucionScreen,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        ...apoyosSociales.map((elemento) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                elemento.nombre,
                style: estilosText!.titulo3InstitucionScreen,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.date_range,
                iconSize: 25,
                heightGeneral: size.height * 0.06,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Fecha",
                    cantLineas: 2,
                    data1: formatFecha(elemento.fecha)),
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.account_box_outlined,
                iconSize: 25,
                heightGeneral: size.height * 0.06,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Encargado",
                    cantLineas: 2,
                    data1: elemento.encargadoEntrega),
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.fiber_manual_record,
                iconSize: 20,
                heightGeneral: size.height * 0.1,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Cantidad",
                    cantLineas: 3,
                    data1: elemento.cantidad.toString()),
              ),
            ],
          );
        })
      ],
    );
  }
}

class ItemsApoyosGubernamentales extends StatelessWidget {
  const ItemsApoyosGubernamentales(
      {super.key, required this.titulo, required this.apoyosGubernamentales});

  final String titulo;
  final List<ApoyoGubernamental> apoyosGubernamentales;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          titulo.toUpperCase(),
          style: estilosText!.titulo3InstitucionScreen,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        ...apoyosGubernamentales.map((elemento) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                elemento.nombre,
                style: estilosText!.titulo3InstitucionScreen,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.date_range,
                iconSize: 25,
                heightGeneral: size.height * 0.06,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Fecha : ",
                    cantLineas: 2,
                    data1: formatFecha(elemento.fecha)),
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.account_box_outlined,
                iconSize: 25,
                heightGeneral: size.height * 0.06,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Encargado",
                    cantLineas: 2,
                    data1: elemento.encargadoEntrega),
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.fiber_manual_record,
                iconSize: 20,
                heightGeneral: size.height * 0.1,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Cantidad",
                    cantLineas: 3,
                    data1: elemento.cantidad.toString()),
              ),
            ],
          );
        })
      ],
    );
  }
}

class ItemsDesayunos extends StatelessWidget {
  const ItemsDesayunos(
      {super.key, required this.titulo, required this.desayunos});

  final String titulo;
  final List<Desayuno> desayunos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo.toUpperCase(),
          style: estilosText!.titulo3InstitucionScreen,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        ...desayunos.map((elemento) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                elemento.nombre,
                style: estilosText!.titulo3InstitucionScreen,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.date_range,
                iconSize: 25,
                heightGeneral: size.height * 0.06,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Fecha : ",
                    cantLineas: 2,
                    data1: formatFecha(elemento.fecha)),
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.account_box_outlined,
                iconSize: 25,
                heightGeneral: size.height * 0.06,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Encargado",
                    cantLineas: 2,
                    data1: elemento.encargadoEntrega),
              ),
              IconInformation(
                widthGeneral: size.width,
                icon: Icons.fiber_manual_record,
                iconSize: 20,
                heightGeneral: size.height * 0.1,
                widthIcon: size.width * 0.09,
                widthText: size.width * 0.815,
                textoFunction: cantidadText(
                    bodyText1: estilosText!.titulo3InstitucionScreen,
                    bodyText2: estilosText!.subtitulo3InstitucionScreen,
                    titulo: "Cantidad",
                    cantLineas: 3,
                    data1: elemento.cantidad.toString()),
              ),
            ],
          );
        })
      ],
    );
  }
}
