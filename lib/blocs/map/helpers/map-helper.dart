import 'dart:ui';

import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionInfoMarker.dart';
import 'package:distrito7_mobile/helper/widgets_to_marker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Map<String, Marker>> entryMarkers(
    {required InfoMarkerBloc infoMarkerBloc,
    required InstitutionBloc institutionBloc,
    required List<InstitutionInfoMarker> instituciones,
    required int zoom,
    required InstitutionType institutionType}) async {
  String urlMarker = "";
  switch (institutionType) {
    case InstitutionType.unidadEducativa:
      urlMarker = 'assets/marcadores/marcadorColegio.png';
      break;
    case InstitutionType.centroSalud:
      urlMarker = 'assets/marcadores/marcadorHospital.png';
      break;
    case InstitutionType.centroDeportivo:
      urlMarker = 'assets/marcadores/marcadorDeportivo.png';
      break;
    case InstitutionType.none:
      urlMarker = 'assets/marcadores/marcadorOtro.png';
      break;
    case InstitutionType.centroRecreativo:
      urlMarker = 'assets/marcadores/marcadorRecreativo.png';
      break;
    case InstitutionType.puntoTuristico:
      urlMarker = 'assets/marcadores/marcadorTurismo.png';
      break;
    case InstitutionType.centroPolicial:
      urlMarker = 'assets/marcadores/marcadorPolicia.png';
      break;
    case InstitutionType.oficinaDistrital:
      urlMarker = 'assets/marcadores/marcadorAlcaldia.png';
    case InstitutionType.nrEmergencias:
      break;
  }

  Map<String, Marker> auxMapMarkers = {};
  String? lado;
  int iLado = 0;
  Offset? offset;

  for (int i = 0; i < instituciones.length; i++) {
    String nombre = instituciones[i].nombre;
    iLado++;
    BitmapDescriptor? iconMarker;
    if (iLado == 1) {
      lado = "a";
      offset = const Offset(0.07, 1);
    } else if (iLado == 2) {
      lado = "b";
      offset = const Offset(0.87, 1);
    } else if (iLado == 3) {
      lado = "c";
      offset = const Offset(0.4, 0.95);
    } else if (iLado == 4) {
      lado = "d";
      offset = const Offset(0.45, 0.5);
    }
    iconMarker = await WidgetMarker().getCustomMarker(
        nombre: nombre, lado: lado!, zoom: zoom, urlMarker: urlMarker);

    if (iLado == 4) {
      iLado = 0;
    }
    final marker = Marker(
        anchor: offset!,
        // READ : MARCADOR INSTITUCIONAL GEOGRAFICO
        markerId: MarkerId("MIG$i"),
        position: LatLng(instituciones[i].latitud, instituciones[i].longitud),
        icon: iconMarker,
        onTap: () {
          infoMarkerBloc.add(OnChangeInfoInstitution(instituciones[i]));
          infoMarkerBloc.add(const OnChangeViewInfo(true));
        });
    auxMapMarkers["MIG$i"] = marker;
  }

  return auxMapMarkers;
}
