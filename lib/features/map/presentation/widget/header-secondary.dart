import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderSecondary extends StatelessWidget {
  const HeaderSecondary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String tituloInstitution = "";
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final decoration = BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 4,
        offset: const Offset(
          0,
          4,
        ),
      )
    ]);

    final decoration2 = BoxDecoration(
      color: const Color(0xFF44BEED),
      borderRadius: BorderRadius.circular(15),
    );

    switch (institutionBloc.state.institutionType) {
      case InstitutionType.unidadEducativa:
        tituloInstitution = "UNIDAD EDUCATIVA";
        break;
      case InstitutionType.centroSalud:
        tituloInstitution = "CENTRO DE SALUD";
        break;
      case InstitutionType.centroDeportivo:
        tituloInstitution = "CENTRO DEPORTIVO";
        break;
      case InstitutionType.centroPolicial:
        tituloInstitution = "CENTRO POLICIAL";
        break;
      case InstitutionType.centroRecreativo:
        tituloInstitution = "CENTRO RECREATIVO";
        break;
      case InstitutionType.puntoTuristico:
        tituloInstitution = "PUNTO TURISTICO";
        break;
      case InstitutionType.oficinaDistrital:
        tituloInstitution = "OFICINA DISTRITAL";
        break;
      default:
        break;
    }

    return Container(
        margin: const EdgeInsets.only(bottom: 6),
        height: size.height * 0.125,
        width: size.width,
        decoration: decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              alignment: Alignment.topLeft,
              child: Text(
                tituloInstitution,
                maxLines: 1,
                style: estilosText!.subtituloVentanaInfoMarker,
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  bottom: size.height * 0.01,
                ),
                alignment: Alignment.topLeft,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Informacion',
                        style: estilosText!.tituloVentanaInfoMarker),
                    Container(
                      decoration: decoration2,
                      height: size.height * 0.005,
                      width: size.width * 0.42,
                    )
                  ],
                ))
          ],
        ));
  }
}
