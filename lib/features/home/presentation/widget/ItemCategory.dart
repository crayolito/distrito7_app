import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/blocs/map/map_bloc.dart';
import 'package:distrito7_mobile/blocs/permissions/permissions_bloc.dart';
import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/data/categories.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final institutionBloc = BlocProvider.of<InstitutionBloc>(context);
    final permissionsBloc =
        BlocProvider.of<PermissionsBloc>(context, listen: true);
    final size = MediaQuery.of(context).size;
    BoxDecoration decoration = BoxDecoration(
      color: kTerciaryColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kPrimaryColor, width: 4),
    );

    void desingTypeInsti(
        InstitutionType type, InstitutionBloc institutionBloc) {
      switch (type) {
        case InstitutionType.unidadEducativa:
          institutionBloc.add(
              OnRecognizeInstitution(isInstEspecial: true, isInstComun: false));
          break;
        case InstitutionType.centroSalud:
        case InstitutionType.centroRecreativo:
        case InstitutionType.centroDeportivo:
        case InstitutionType.oficinaDistrital:
        case InstitutionType.centroPolicial:
        case InstitutionType.puntoTuristico:
          institutionBloc.add(
              OnRecognizeInstitution(isInstEspecial: false, isInstComun: true));
        default:
      }
    }

    void onTap() {
      switch (category.typeContent) {
        case InstitutionType.nrEmergencias:
          institutionBloc.add(OnChangedInstitutionType(category.typeContent));
          Navigator.pushNamed(context, '/${category.rutaDireccion}');
          break;
        case InstitutionType.oficinaDistrital:
        case InstitutionType.unidadEducativa:
        case InstitutionType.centroRecreativo:
        case InstitutionType.centroSalud:
        case InstitutionType.centroDeportivo:
        case InstitutionType.puntoTuristico:
        case InstitutionType.centroPolicial:
          print(permissionsBloc.state.isInternetEnabled);
          if (!permissionsBloc.state.isInternetEnabled) {
            return;
          }
          institutionBloc.add(OnChangedInstitutionType(category.typeContent));
          mapBloc.add(const OnInsertContentMap());
          desingTypeInsti(category.typeContent, institutionBloc);
          Navigator.pushNamed(context, '/mapa');
          break;
        default:
          break;
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.height * 0.02),
        padding: const EdgeInsets.all(10),
        decoration: decoration,
        child: Column(
          children: [
            Container(
              width: size.width * 0.2,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(category.iconLink)),
              ),
            ),
            SizedBox(
              height: size.height * 0.008,
            ),
            Text(
              textAlign: TextAlign.center,
              category.categoryTitle,
              style: estilosText!.subtituloVentanaCategorias,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
