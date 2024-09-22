import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerSearch extends StatelessWidget {
  const ContainerSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);
    final decoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );

    return Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.045,
            left: size.width * 0.03,
            right: size.width * 0.03),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/searchIntitution",
                arguments: {'contextMap': context});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            width: size.width,
            height: size.height * 0.056,
            decoration: decoration,
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: size.width * 0.09,
                    color: const Color(0xFF00A541).withOpacity(0.8),
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Expanded(
                      child: Text(
                    institutionBloc.state.titulo.toUpperCase(),
                    style: estilosText!.tituloVentanaMapaSearch,
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
