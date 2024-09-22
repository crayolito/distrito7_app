import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/location/location_bloc.dart';
import 'package:distrito7_mobile/blocs/map/helpers/map-helper.dart';
import 'package:distrito7_mobile/data/markers-data.dart';
import 'package:distrito7_mobile/data/polygones-data.dart';
import 'package:distrito7_mobile/error/exceptions.error.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionInfoMarker.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/repostiories/institution_repository_impl.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/selection-marker-view.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  StreamSubscription<LocationState>? locationStateSubscription;
  final institutionRepositoryImpl = InstitutionRepositoryImpl();
  GoogleMapController? mapController;
  CameraPosition? cameraPosition;
  final LocationBloc locationBloc;
  final InfoMarkerBloc infoMarkerBloc;
  final InstitutionBloc institutionBloc;

  MapBloc({
    required this.locationBloc,
    required this.infoMarkerBloc,
    required this.institutionBloc,
  }) : super(MapState()) {
    on<OnMapInitialControllerMap>(_onInitialControllerMap);
    on<OnInsertContentMap>(_onInsertContentMap);
    on<OnRankingMarkerByZoom>(_onRankingMarkerByZoom);
    on<OnChangeStatusDetailMap>(_onChangeStatusDetailMap);
    on<OnMapControllerCamera>(_onMapControllerCamera);
    on<OnChangedStatusFollowUser>((event, emit) {
      emit(state.copyWith(followUser: event.statusFollow));
    });
    on<OnChangedStatusMap>((event, emit) {
      emit(state.copyWith(isMapInitialized: !state.isMapInitialized));
    });

    on<OnChangeProcessMap>((event, emit) async {
      emit(state.copyWith(processMap: event.status));
    });

    locationStateSubscription = locationBloc.stream.listen((locationState) {
      if (!state.isMapInitialized) return;
      if (!state.followUser) return;
      if (locationState.lastKnownLocation == null) return;
      moveCameraMyLocation(locationState.lastKnownLocation!);
    });
  }

  Future<void> _onChangeStatusDetailMap(
      OnChangeStatusDetailMap event, emit) async {
    emit(state.copyWith(statusDetailMap: event.statusDetailMap));
    final Map<String, Polygon> currentPolygons =
        Map<String, Polygon>.from(state.polygons);
    currentPolygons.removeWhere((key, value) => key.contains("PGZV"));
    String baseInit = coordenadasDePruebaZV.keys.first;
    List<LatLng> coordenadas = [];
    Map<String, LatLng> vectorTrabajo = {};
    if (state.statusDetailMap == StatusDetailMap.zonaBarrios) {
      vectorTrabajo = Map<String, LatLng>.from(coordenadasDePruebaZV);
    } else {
      vectorTrabajo = Map<String, LatLng>.from(coordenadasDePruebaUV);
    }
    for (var coordenada in vectorTrabajo.entries) {
      String a = baseInit[baseInit.length - 1];
      String baseAux = coordenada.key;
      String b = baseAux[baseAux.length - 1];
      if (a.contains(b)) {
        coordenadas.add(coordenada.value);
      } else {
        final polygon = Polygon(
          polygonId: PolygonId("PGZV$a"),
          points: coordenadas,
          fillColor: const Color(0xFF231F20).withOpacity(0.2),
          strokeColor: const Color(0xFF44BEED),
          strokeWidth: 2,
        );
        currentPolygons["PGZV$a"] = polygon;
        baseInit = baseAux;
        coordenadas = [];
        coordenadas.add(coordenada.value);
      }
    }
    emit(state.copyWith(polygons: currentPolygons));
  }

  Future<void> _onMapControllerCamera(event, emit) async {
    cameraPosition = event.cameraPosition;
    //RANGO MENORES DE 12
    if ((cameraPosition!.zoom < 12) &&
        (state.statusZoom != 11) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(11));
    }

    //RANGO ENTRE = 12 HASTA 13
    if ((cameraPosition!.zoom >= 12 && cameraPosition!.zoom < 13) &&
        (state.statusZoom != 12) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(12));
    }

    //RANGO ENTRE = 13 HASTA 14
    if ((cameraPosition!.zoom >= 13 && cameraPosition!.zoom < 14) &&
        (state.statusZoom != 13) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(13));
    }

    //RANGO ENTRE = 14 HASTA 15
    if ((cameraPosition!.zoom >= 14 && cameraPosition!.zoom < 15) &&
        (state.statusZoom != 14) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(14));
    }

    //RANGO ENTRE = 15 HASTA 16
    if ((cameraPosition!.zoom >= 15 && cameraPosition!.zoom < 16) &&
        (state.statusZoom != 15) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(15));
    }

    //RANGO ENTRE = 16 HASTA 17
    if ((cameraPosition!.zoom >= 16 && cameraPosition!.zoom < 17) &&
        (state.statusZoom != 16) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(16));
    }

    // MAYOR A 16 PARA ADELANTE
    if ((cameraPosition!.zoom >= 17) &&
        (state.statusZoom != 17) &&
        state.processMap) {
      add(const OnRankingMarkerByZoom(17));
    }
  }

  Future<void> _onRankingMarkerByZoom(OnRankingMarkerByZoom event, emit) async {
    emit(state.copyWith(statusZoom: event.ranking.toDouble()));
    List<InstitutionInfoMarker> currentInstitucionsSelect = [
      ...institutionBloc.state.institucionesInfoMarker
    ];
    Map<String, Marker> currentMarkers = {};

    final modificado = await SelectMarkerView.selectMarker(
        currentInstitucionsSelect, event.ranking);
    currentMarkers.addAll(await entryMarkers(
      institutionBloc: institutionBloc,
      institutionType: institutionBloc.state.institutionType,
      infoMarkerBloc: infoMarkerBloc,
      instituciones: modificado,
      zoom: event.ranking,
    ));

    emit(state.copyWith(markers: currentMarkers));
  }

  Future<void> _onInsertContentMap(OnInsertContentMap event, emit) async {
    Map<String, Polygon> currentPolygons = {};
    List<InstitutionSpecial> institutionSpecial = [];
    List<InstitucionComun> institucionesComunes = [];

    List<InstitutionInfoMarker> institutionInfoMarker = [];

    // NOTE : INSERTAR POLIGONO D7
    final polygon = Polygon(
      polygonId: const PolygonId("PBLD7"),
      points: coordenadasLimitD7,
      fillColor: const Color(0xFF231F20).withOpacity(0.2),
      strokeColor: const Color(0xFF1B8206),
      strokeWidth: 4,
    );
    currentPolygons["PBLD7"] = polygon;

    try {
      switch (institutionBloc.state.institutionType) {
        case InstitutionType.unidadEducativa:
          institutionSpecial =
              await institutionRepositoryImpl.getInstitutionSpecial();
          for (var institution in institutionSpecial) {
            institutionInfoMarker.add(InstitutionInfoMarker(
                id: institution.id,
                nombre: institution.nombre,
                direccion: institution.direccion,
                uv: institution.uv,
                videoURL: institution.video,
                gestionAdm: institution.gestion,
                latitud: double.parse(institution.coodenada_y),
                longitud: double.parse(institution.coodenada_x),
                fotos: institution.fotos,
                turno: institution.turno));
          }
          institutionBloc.add(OnChangedInfoInstitutions(
            institucionesEspeciales: institutionSpecial,
            institucionesInfoMarker: institutionInfoMarker,
            infoClienteSeach: institutionInfoMarker,
          ));
          break;
        case InstitutionType.oficinaDistrital:
        case InstitutionType.centroDeportivo:
        case InstitutionType.centroPolicial:
        case InstitutionType.centroRecreativo:
        case InstitutionType.centroSalud:
        case InstitutionType.puntoTuristico:
          String url = selectURL(institutionBloc.state.institutionType);
          institucionesComunes =
              await institutionRepositoryImpl.getInstitutionComun(url);

          for (var institution in institucionesComunes) {
            institutionInfoMarker.add(InstitutionInfoMarker(
                id: institution.id,
                nombre: institution.encargado,
                direccion: institution.direccion,
                uv: institution.uv,
                videoURL: "",
                latitud: institution.coodenada_y.isNotEmpty
                    ? double.parse(institution.coodenada_y)
                    : 0.0,
                longitud: institution.coodenada_x.isNotEmpty
                    ? double.parse(institution.coodenada_x)
                    : 0.0,
                fotos: institution.fotos,
                gestionAdm: Gestion(
                    id: 1,
                    numero: institution.numeroTelefono,
                    horario: institution.horario,
                    director: "",
                    imageJuntaEscolar: ""),
                turno: Turno(id: 0, nombre: "")));
          }
          institutionBloc.add(
            OnChangedInfoInstitutions(
              institucionesComunes: institucionesComunes,
              institucionesInfoMarker: institutionInfoMarker,
              infoClienteSeach: institutionInfoMarker,
            ),
          );
          break;
        case InstitutionType.none:
        case InstitutionType.nrEmergencias:
          break;
        default:
          break;
      }

      emit(state.copyWith(polygons: currentPolygons));
      // NOTE : PONE LOS MARCADORES FILTRADOS DEACUERDO AL ZOOM
      add(const OnRankingMarkerByZoom(17));
    } on ErroresInternet catch (e) {
      mensajeCliente!.showLoadingMessageErrores(e.mensaje);
    } on ErroresBackend catch (e) {
      mensajeCliente!.showLoadingMessageErrores(e.mensaje);
    } on ErroresDesconocidos catch (e) {
      mensajeCliente!.showLoadingMessageErrores(e.mensaje);
    }
  }

  Future<void> _onInitialControllerMap(
      OnMapInitialControllerMap event, Emitter<MapState> emit) async {
    final currentMarkers = Map<String, Marker>.from(state.markers);
    final currentPolygons = Map<String, Polygon>.from(state.polygons);
    final currentPolyines = Map<String, Polyline>.from(state.polylines);
    mapController = event.controllerGoogleMap;
    emit(state.reset());
    emit(state.copyWith(
        isMapInitialized: true,
        markers: currentMarkers,
        polygons: currentPolygons,
        polylines: currentPolyines));
  }

  void moveCameraMyLocation(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLngZoom(newLocation, 17.5);
    mapController!.animateCamera(cameraUpdate);
    add(const OnChangeProcessMap(true));
  }

  void reorientMap() {
    if (mapController != null && cameraPosition != null) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: cameraPosition!.target,
              zoom: cameraPosition!.zoom,
              bearing: 0)));
    }
  }

  // READ : REORIENTA LA CAMARA PARA CENTRAR EL DISTRITO 7
  Future<void> setBoundsD7() async {
    double minLat = puntoPrincipalesD7[0].latitude;
    double maxLat = puntoPrincipalesD7[0].latitude;
    double minLng = puntoPrincipalesD7[0].longitude;
    double maxLng = puntoPrincipalesD7[0].longitude;

    for (LatLng puntoCoord in puntoPrincipalesD7) {
      minLat = min(minLat, puntoCoord.latitude);
      maxLat = max(maxLat, puntoCoord.latitude);
      minLng = min(minLng, puntoCoord.longitude);
      maxLng = max(maxLng, puntoCoord.longitude);
    }

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );

    CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    mapController!.animateCamera(cameraUpdate);
  }

  // READ : ORIENTA Y AJUSTA LA CAMARA DESDE LA POSICION ACTUAL DEL USUARIO
  Future<void> orientarYajustarCamara() async {
    Position posicion = await locationBloc.getActualLocation();
    final cameraPositionOrientar = CameraPosition(
        target: LatLng(posicion.latitude, posicion.longitude),
        zoom: 18.5,
        bearing: -35,
        tilt: 90);
    await mapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPositionOrientar));
  }

  String selectURL(InstitutionType institutionType) {
    // Mapa que asocia cada tipo de institución con una URL específica
    final Map<InstitutionType, String> urlMap = {
      InstitutionType.oficinaDistrital: '/oficinadistrital',
      InstitutionType.centroDeportivo: '/centrosdeportivos',
      InstitutionType.centroPolicial: '/centrospoliciales',
      InstitutionType.centroRecreativo: '/centroRecreativo',
      InstitutionType.centroSalud: '/centrossaluds',
      InstitutionType.puntoTuristico: '/centrosturisticos',
    };

    // Devuelve la URL correspondiente al tipo de institución, o una URL por defecto si no se encuentra
    return urlMap[institutionType] ?? 'https://example.com/default';
  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    add(const OnChangedStatusMap());
    state.reset();
    return super.close();
  }
}
