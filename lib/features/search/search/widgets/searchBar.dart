import 'dart:async';

import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarPersonalized extends StatefulWidget {
  const SearchBarPersonalized({
    super.key,
  });

  @override
  State<SearchBarPersonalized> createState() => _SearchBarPersonalizedState();
}

class _SearchBarPersonalizedState extends State<SearchBarPersonalized> {
  final myController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    myController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const decorationC1 = BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)),
    );

    final decorationC2 = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00A541), width: 3));

    final decorationC3 = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00A541), width: 3));
    TextEditingController controller = TextEditingController();
    final size = MediaQuery.of(context).size;
    final institutionBloc =
        BlocProvider.of<InstitutionBloc>(context, listen: true);

    return Positioned(
      top: size.height * 0.04,
      right: 0,
      left: 0,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          height: size.height * 0.07,
          width: size.width,
          decoration: decorationC1,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  right: size.width * 0.03,
                ),
                width: size.width * 0.8,
                height: size.height * 0.07,
                decoration: decorationC2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: Icon(
                          Icons.search,
                          color: kSecondaryColor,
                          size: size.width * 0.08,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        style: estilosText!.subtitulo3InstitucionScreen,
                        cursorColor: const Color(0xFF00A541),
                        decoration: InputDecoration(
                            hintText: 'Buscar ...',
                            hintStyle: estilosText!.subtitulo3InstitucionScreen,
                            floatingLabelStyle:
                                estilosText!.subtitulo3InstitucionScreen,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusColor: const Color(0xFF00A541)),
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) _debounce!.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
                            institutionBloc.add(OnApplyFilterSearch(value));
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.clear();
                  institutionBloc.add(const OnResetInfoClientSearch());
                },
                child: Container(
                    margin: EdgeInsets.only(left: size.width * 0.04),
                    decoration: decorationC3,
                    width: size.width * 0.12,
                    height: size.height * 0.06,
                    child: Icon(
                      Icons.clear_rounded,
                      color: kSecondaryColor,
                      size: size.width * 0.08,
                    )),
              ),
            ],
          )),
    );
  }
}
