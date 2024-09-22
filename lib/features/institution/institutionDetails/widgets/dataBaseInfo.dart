import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/blocs/institution/helpers.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/helper/fuctions.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/iconInformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBaseInformation extends StatelessWidget {
  const DataBaseInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    // final institucionEspecial = institutionBloc.state.institucionEspecial;
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);

    return Column(
      children: [
        IconInformation(
          icon: Icons.fiber_manual_record,
          heightGeneral: (size.height * 0.618) * 0.18,
          widthGeneral: size.width,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          iconSize: 20,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              bodyText2: estilosText!.subtituloInstitucionScreen,
              titulo: HelpersInstitution.titleDesignation(
                  institutionBloc.state.institutionType),
              cantLineas: 3,
              data1: infoMarkerBloc.state.infoStand!.nombre),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.fiber_manual_record,
          iconSize: 20,
          heightGeneral: (size.height * 0.618) * 0.15,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              bodyText2: estilosText!.subtituloInstitucionScreen,
              titulo: "Direccion",
              cantLineas: 3,
              data1: infoMarkerBloc.state.infoStand!.direccion),
        ),
        IconInformation(
          widthGeneral: size.width,
          icon: Icons.fiber_manual_record,
          iconSize: 20,
          heightGeneral: (size.height * 0.618) * 0.08,
          widthIcon: size.width * 0.09,
          widthText: size.width * 0.85,
          textoFunction: cantidadText(
              bodyText1: estilosText!.titulo2InstitucionScreen,
              data1: "UV : ${infoMarkerBloc.state.infoStand!.uv}",
              title: 1),
        ),
      ],
    );
  }
}
