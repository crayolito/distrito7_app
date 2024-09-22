import 'package:distrito7_mobile/features/institution/domain/entities/institucionInfoMarker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMarkerView {
  static Future<List<InstitutionInfoMarker>> selectMarker(
      List<InstitutionInfoMarker> markers, int zoom) async {
    bool entrada = true;
    int contador = 0;
    List<InstitutionInfoMarker> markersAux = markers;
    // Map<String, LatLng> markersAux = markers;
    int aux = markersAux.length;
    bool mandaloFinal = true;
    int distanciaPromedio = 0;
    if (zoom == 11) {
      distanciaPromedio = 1900;
    } else if (zoom == 12) {
      distanciaPromedio = 1600;
    } else if (zoom == 13) {
      distanciaPromedio = 1400;
    } else if (zoom == 14) {
      distanciaPromedio = 1100;
    } else if (zoom == 15) {
      distanciaPromedio = 800;
    } else if (zoom == 16) {
      distanciaPromedio = 500;
    } else if (zoom == 17) {
      distanciaPromedio = 0;
    }

    while (entrada) {
      contador++;
      InstitutionInfoMarker a = markersAux[0];
      for (var i = 1; i < markersAux.length; i++) {
        InstitutionInfoMarker b = markersAux[i];
        double distancia = calcularDistancia(
            LatLng(a.latitud, a.longitud), LatLng(b.latitud, b.longitud));
        if (distancia < distanciaPromedio) {
          mandaloFinal = false;
          markersAux.removeAt(0);
          break;
        }
      }

      if (mandaloFinal) {
        markersAux.removeAt(0);
        markersAux.add(a);
      }
      mandaloFinal = true;
      if (contador == aux) {
        entrada = false;
      }
    }
    return markersAux;

    // while (entrada) {
    //   contador++;
    //   List<String> keys = markersAux.keys.toList();
    //   String key = keys[0];
    //   LatLng aValue = markersAux[key]!;

    //   for (var i = 1; i < keys.length; i++) {
    //     String key2 = keys[i];
    //     LatLng bValue = markersAux[key2]!;
    //     double distancia = calcularDistancia(aValue, bValue);
    //     if ((distancia < distanciaPromedio!)) {
    //       mandaloFinal = false;
    //       markersAux.remove(key);
    //       break;
    //     }
    //   }
    //   if (mandaloFinal) {
    //     markersAux.remove(key);
    //     markersAux[key] = aValue;
    //   }
    //   mandaloFinal = true;
    //   if (contador == aux) {
    //     entrada = false;
    //   }
    // }
    // return markersAux;
  }

  static calcularDistancia(LatLng start, LatLng end) {
    double distanceInMeters = Geolocator.distanceBetween(
        start.latitude, start.longitude, end.latitude, end.longitude);
    return distanceInMeters;
  }
}
