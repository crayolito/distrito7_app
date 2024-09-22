import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:distrito7_mobile/shared/widgets/buttonCloseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class HistoryInstitution extends StatelessWidget {
  const HistoryInstitution({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);

    return Scaffold(
      floatingActionButton: const ButtonCloseScreen(),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          SafeArea(
            child: Text(
              textAlign: TextAlign.center,
              "HISTORIA",
              style: estilosText!.tituloHistoriaInstitucion,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF44BEED),
              borderRadius: BorderRadius.circular(15),
            ),
            height: size.height * 0.003,
            width: size.width * 0.4,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
            width: size.width,
            height: size.height * 0.6,
            child: SingleChildScrollView(
              child: ReadMoreText(
                institutionBloc.state.institucionEspecial!.historia,
                trimLines: 17,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Ver más',
                trimExpandedText: 'Ver menos',
                isExpandable: true,
                style: estilosText!.subtituloHistoriaInstitucion,
                moreStyle: estilosText!.subtitulo2HistoriaInstitucion,
                lessStyle: estilosText!.subtitulo2HistoriaInstitucion,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
              width: size.width,
              height: size.height * 0.29,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                    institutionBloc.state.institucionEspecial!.fotos[0].url,
                    fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                        Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 7, right: 7),
                      width: size.width,
                      height: size.height * 0.29,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/gifLoading/navegador.gif'),
                              fit: BoxFit.cover)),
                    ),
                  );
                }),
              )),
        ]),
      ),
    );
  }
}
