import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/features/search/search/widgets/searchBar.dart';
import 'package:distrito7_mobile/features/search/search/widgets/searchResultElement.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/buttonCloseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  // final BuildContext contextMap
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int color = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButton: const ButtonCloseScreen(),
        body: SingleChildScrollView(
          child: Container(
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Stack(
                children: [
                  SearchBarPersonalized(),
                  ResultSearch(),
                ],
              )),
        ));
  }
}

class ResultSearch extends StatefulWidget {
  const ResultSearch({super.key});

  @override
  State<ResultSearch> createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    final List<Color> colors = [
      const Color(0xFF00A541),
      const Color(0xFFFFE904),
      const Color(0xFFFF2126),
      const Color.fromARGB(255, 0, 0, 0),
      const Color(0xFF44BEED),
    ];

    onTap() async {
      Navigator.pop(context);
      infoMarkerBloc.add(const OnChangeViewInfo(false));
      mapBloc.add(const OnChangeProcessMap(false));
      mapBloc.add(const OnChangedStatusFollowUser(false));
      mensajeCliente!.showLoadingMap();
      mapBloc.moveCameraMyLocation(
        const LatLng(-17.795055687176283, -63.13163979699569),
      );
      mapBloc.add(const OnRankingMarkerByZoom(17));
      mapBloc.add(const OnChangeProcessMap(true));
    }

    return Positioned(
      top: size.height * 0.11,
      left: 0,
      right: 0,
      child: SizedBox(
        height: size.height * 0.893,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            institutionBloc.state.infoClienteSeach.isEmpty
                ? Center(
                    child: Text("No hay información disponible",
                        style: estilosText!.titulo3InstitucionScreen),
                  )
                : Flexible(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: institutionBloc.state.infoClienteSeach.length,
                      itemBuilder: (context, index) {
                        final institucion =
                            institutionBloc.state.infoClienteSeach[index];
                        Color color = colors[colorIndex];
                        colorIndex++;
                        if (colorIndex == colors.length) {
                          colorIndex = 0;
                        }
                        return GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            infoMarkerBloc.add(const OnChangeViewInfo(false));
                            mapBloc.add(const OnChangeProcessMap(false));
                            mapBloc.add(const OnChangedStatusFollowUser(false));
                            mensajeCliente!.showLoadingMap();
                            mapBloc.moveCameraMyLocation(
                              LatLng(institucion.latitud, institucion.longitud),
                            );
                            mapBloc.add(const OnRankingMarkerByZoom(17));
                            mapBloc.add(const OnChangeProcessMap(true));
                          },
                          child: SearchResultElement(
                            color: color,
                            nombre: institucion.nombre,
                            direccion: institucion.direccion,
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
