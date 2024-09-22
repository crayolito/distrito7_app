import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/location/location_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/permissions/helpers.dart';
import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:distrito7_mobile/config/constants/estilosLetras.dart';
import 'package:distrito7_mobile/config/constants/showLoading.dart';
import 'package:distrito7_mobile/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Definición de variables globales
final internetChecker = CheckInternetConnection();
EstilosLetras? estilosText;
ShowloadingCustom? mensajeCliente;

void main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => PermissionsBloc()),
    BlocProvider(create: (context) => LocationBloc()),
    BlocProvider(create: (context) => InstitutionBloc()),
    BlocProvider(
        create: (context) => InfoMarkerBloc(
              institutionBloc: BlocProvider.of<InstitutionBloc>(context),
            )),
    BlocProvider(
        create: (context) => MapBloc(
              institutionBloc: BlocProvider.of<InstitutionBloc>(context),
              locationBloc: BlocProvider.of<LocationBloc>(context),
              infoMarkerBloc: BlocProvider.of<InfoMarkerBloc>(context),
            )),
    BlocProvider(
        create: (context) => ComplaintsUeBloc(
            infoMarkerBloc: BlocProvider.of<InfoMarkerBloc>(context)))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicialización de variables globales
    estilosText = EstilosLetras(context);

    return MaterialApp(
      theme: ThemeData(
        primaryColor:
            const Color(0xFF00A541), // Color principal de la aplicación
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color(0xFF00A541),
            ),
            foregroundColor: WidgetStateProperty.all(
              const Color(0xFF00A541),
            ),
          ),
        ),
      ),
      routes: appRoutes,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
