import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/containerShading.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/institutionInformation.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/optionsScreen.dart';
import 'package:distrito7_mobile/shared/widgets/imagesSwiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutionScreen extends StatelessWidget {
  const InstitutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    List<String> images =
        infoMarkerBloc.state.infoStand!.fotos.map((e) => e.url).toList();

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // CARRUCEN DE IMAGENES DE LA INSTITUCION
            ImagesSwiper(
              height: size.height * 0.40,
              width: size.width,
              images: images,
            ),
            // SOMBREADO DE LA PARTE SUPERIOR
            const ContainerShading(),
            // ICONOS DE RETORNO Y 3D
            const OptionsScreen(),
            // INFORMACION DE LA INSTITUCION
            const InstitutionInformation(),
          ],
        ),
      ),
    );
  }
}
