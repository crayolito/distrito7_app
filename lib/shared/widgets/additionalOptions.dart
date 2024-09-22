import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/optionsAditional.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AdditionalOptions extends StatefulWidget {
  const AdditionalOptions({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  State<AdditionalOptions> createState() => _AdditionalOptionsState();
}

class _AdditionalOptionsState extends State<AdditionalOptions> {
  @override
  Widget build(BuildContext context) {
    List<OptionAditional> opcionesAdicionales = [];
    final mapBloc = BlocProvider.of<MapBloc>(context, listen: true);
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final size = MediaQuery.of(context).size;
    final permissionsBloc = BlocProvider.of<PermissionsBloc>(context);

    opcionesAdicionales = [
      OptionAditional(
          titulo: "VR 360°",
          onTap: () async {
            String url = infoMarkerBloc.state.infoStand!.videoURL;
            if (url.isEmpty) {
              return;
            }

            if (!permissionsBloc.state.isInternetEnabled) {
              return;
            }

            try {
              await launchUrl(Uri.parse(url));
            } catch (e) {
              mensajeCliente!
                  .showLoadingMessageErrores("Problemas al subir los datos");
            }
          },
          icono: FontAwesomeIcons.youtube),
      OptionAditional(
          titulo: "Google Maps",
          onTap: () async {
            if (!permissionsBloc.state.isInternetEnabled) {
              return;
            }
            try {
              await launchUrl(Uri.parse(
                  "https://www.google.com/maps/search/?api=1&query=${infoMarkerBloc.state.infoStand!.latitud},${infoMarkerBloc.state.infoStand!.longitud}"));
            } catch (e) {
              mensajeCliente!
                  .showLoadingMessageErrores("Problemas al subir los datos");
            }
          },
          icono: FontAwesomeIcons.google),
      OptionAditional(
          titulo: "Ver Ubicacion en Mapa",
          onTap: () async {
            if (institutionBloc.state.institutionType ==
                InstitutionType.oficinaDistrital) {
              Navigator.pushNamed(context, '/mapa');
              return;
            }
            Navigator.pop(context);
            mensajeCliente!.showLoadingTemporal();
            infoMarkerBloc
                .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
            mapBloc.add(const OnChangedStatusFollowUser(false));
            mapBloc.moveCameraMyLocation(LatLng(
                infoMarkerBloc.state.infoStand!.latitud,
                infoMarkerBloc.state.infoStand!.longitud));
          },
          icono: FontAwesomeIcons.mapLocationDot),
      OptionAditional(
          titulo: "Historia",
          onTap: () {
            Navigator.pushNamed(context, '/historiaInsti');
          },
          icono: FontAwesomeIcons.book),
    ];

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.centroDeportivo:
      case InstitutionType.centroSalud:
      case InstitutionType.centroPolicial:
      case InstitutionType.oficinaDistrital:
      case InstitutionType.centroRecreativo:
        opcionesAdicionales.removeAt(opcionesAdicionales.length - 1);
        break;
      case InstitutionType.unidadEducativa:
      case InstitutionType.puntoTuristico:
        break;
      default:
        break;
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (isExpanded) {
          if (isExpanded) {
            Future.delayed(const Duration(seconds: 1)).then((_) {
              if (widget._scrollController.hasClients) {
                widget._scrollController.animateTo(
                  widget._scrollController.position.maxScrollExtent + 100,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            });
          }
        },
        title: Text(
          "Opciones Adicionales",
          style: estilosText!.titulo3InstitucionScreen,
        ),
        leading: Icon(
          Icons.settings,
          size: size.width * 0.1,
        ),
        collapsedIconColor: const Color(0xFF44BEED),
        iconColor: const Color(0xFF44BEED),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: size.width,
            child: Column(
              children: [
                ...opcionesAdicionales.map((e) {
                  return GestureDetector(
                      onTap: e.onTap,
                      child: Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: const Color(0xFF44BEED), width: 3),
                          ),
                          child: IconInformation(
                            icon: e.icono,
                            widthGeneral: size.width,
                            heightGeneral: (size.height * 0.61) * 0.08,
                            widthIcon: size.width * 0.09,
                            widthText: size.width * 0.6,
                            iconSize: size.width * 0.05,
                            textoFunction: cantidadText(
                              bodyText1: estilosText!.titulo3InstitucionScreen,
                              title: 1,
                              data1: e.titulo,
                            ),
                          )));
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
