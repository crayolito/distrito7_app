import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/commonInstitution.widgets.dart';
import 'package:distrito7_mobile/features/institution/institutionDetails/widgets/specialInstitution.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstitutionInformation extends StatefulWidget {
  const InstitutionInformation({super.key});

  @override
  State<InstitutionInformation> createState() => _InstitutionInformationState();
}

class _InstitutionInformationState extends State<InstitutionInformation> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);

    const decoration = BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        image: DecorationImage(
            image: AssetImage("assets/fondo/bg.png"), fit: BoxFit.cover));
    return Positioned(
      top: size.height * 0.34,
      left: 0,
      right: 0,
      child: Container(
        decoration: decoration,
        height: size.height * 0.66,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.02,
          right: size.width * 0.02,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: institutionBloc.state.isInstEspecial
              ?SpecialInstitution(
                  scrollController: _scrollController,
                )
              : CommonInstitution(
                  scrollController: _scrollController,
                )
        ),
      ),
    );
  }
}
