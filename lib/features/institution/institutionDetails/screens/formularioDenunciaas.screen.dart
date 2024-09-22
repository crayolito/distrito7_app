import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/config/constants/shadow.constant.dart';
import 'package:distrito7_mobile/features/institution/services/camera_gallery_service_impl.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FormularioDenuncia extends StatefulWidget {
  const FormularioDenuncia({super.key});

  @override
  State<FormularioDenuncia> createState() => _FormularioDenunciaState();
}

class _FormularioDenunciaState extends State<FormularioDenuncia> {
  ComplaintsUeBloc? complaintsUeBloc;
  String contextoDenuncia = "";
  String codigoDirector = "";

  @override
  void initState() {
    super.initState();
    complaintsUeBloc =
        BlocProvider.of<ComplaintsUeBloc>(context, listen: false);
  }

  @override
  void dispose() {
    complaintsUeBloc!.add(const OnChagedImagenDenuncia(
        imagenDenuncia: "assets/gifLoading/insertarImagen.png"));
    complaintsUeBloc!.add(const OnChangedStatusComplaintsUE(
        statusComplaintsUE: ProcesoEstadoDenuncia.empezando));
    complaintsUeBloc!.add(
        const OnChangedStatusImage(statusImage: ProcesoEstadoImagen.empezando));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final complaintsUeBloc =
        BlocProvider.of<ComplaintsUeBloc>(context, listen: true);

    final infoMarkerBloc =
        BlocProvider.of<InfoMarkerBloc>(context, listen: true);
    final unidadEducativa = infoMarkerBloc.state.infoStand!;
    final size = MediaQuery.of(context).size;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  left: size.width * 0.05,
                  right: size.width * 0.05),
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/fondo/santaCruz.jpg"),
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  // READ : NOMBRE DE LA UNIDAD EDUCATIVA
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.025,
                      ),
                      alignment: Alignment.centerLeft,
                      // width: size.width * 0.9,
                      height: size.height * 0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kTerciaryColor.withOpacity(0.8),
                        border: Border.all(color: kSecondaryColor, width: 3),
                      ),
                      child: Text(
                        unidadEducativa.nombre,
                        style: estilosText!.titulo2InstitucionScreen,
                      )),
                  SizedBox(height: size.height * 0.02),
                  // READ : DESCRIPCION DE LA DENUNCIA A REALIZAR
                  CustomTextArea(
                    onChanged: (String value) {
                      setState(() {
                        codigoDirector = value;
                      });
                    },
                    height: size.height * 0.11,
                    width: size.width * 0.9,
                    titulo: "Ingrese codigo",
                    icon: Icon(
                      Icons.password,
                      size: size.width * 0.065,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  // READ : DESCRIPCION DE LA DENUNCIA A REALIZAR
                  CustomTextArea(
                    onChanged: (String value) {
                      setState(() {
                        contextoDenuncia = value;
                      });
                    },
                    height: size.height * 0.23,
                    width: size.width * 0.9,
                    titulo: "¿De que trata su denuncia?",
                    icon: Icon(
                      FontAwesomeIcons.penToSquare,
                      size: size.width * 0.065,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  // READ : FOTO DE LA DENUNCIA A REALIZAR
                  GestureDetector(
                    onTap: () async {
                      final photoPath =
                          await CameraGalleryServiceImpl().takePhoto();
                      if (photoPath == null) return;
                      mensajeCliente!.showLoadingImagenDenuncia();
                      complaintsUeBloc
                          .add(OnProcessCargaImage(filePath: photoPath));
                    },
                    child: Container(
                      width: size.width * 0.7,
                      height: size.height * 0.4,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                          vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kSecondaryColor, width: 3),
                      ),
                      child: complaintsUeBloc.state.imagenDenuncia ==
                              "assets/gifLoading/insertarImagen.png"
                          ? Image.asset(
                              'assets/gifLoading/insertarImagen.png',
                              fit: BoxFit.contain,
                            ) // Usa Image.asset para AssetImage
                          : Image.network(complaintsUeBloc.state.imagenDenuncia,
                              fit: BoxFit
                                  .cover), // Usa Image.network para NetworkImage
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: size.height * 0.91,
                left: size.width * 0.28,
                child: SizedBox(
                  width: size.width * 0.40,
                  height: size.height * 0.1,
                  // color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () async {
                            mensajeCliente!.showLoadingProcesoDenuncia();
                            complaintsUeBloc.add(OnProcessaDenuncia(
                                codigoAdministrativo: codigoDirector,
                                descripcionDenuncia: contextoDenuncia,
                                idUnidadEducativa: unidadEducativa.id));
                          },
                          icon: Icon(
                            FontAwesomeIcons.fileArrowUp,
                            size: size.width * 0.1,
                            color: Colors.black,
                            shadows: shadowKSN2,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,
                            size: size.width * 0.1,
                            color: Colors.black,
                            shadows: shadowKSN2,
                          ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({
    super.key,
    required this.width,
    required this.height,
    required this.titulo,
    required this.onChanged,
    required this.icon,
  });

  final double width;
  final double height;
  final String titulo;
  final ValueChanged<String> onChanged;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: kTerciaryColor.withOpacity(0.8),
      border: Border.all(color: kSecondaryColor, width: 3),
    );
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.height * 0.01,
            ),
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  titulo,
                  style: estilosText!.titulo2InstitucionScreen,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
            ),
            child: TextFormField(
              onChanged: onChanged,
              maxLines: 1,
              cursorColor: kSecondaryColor,
              style: estilosText!.subtitulo3InstitucionScreen,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: GoogleFonts.anta(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  focusColor: Colors.white,
                  isDense: true),
            ),
          )
        ],
      ),
    );
  }
}

class Custom1TextFormField extends StatelessWidget {
  const Custom1TextFormField({
    super.key,
    required this.placeholder,
    required this.icon,
    required this.color,
    required this.keyboardType,
    this.maxLines,
    required this.onChanged,
  });

  final String placeholder;
  final IconData icon;
  final Color color;
  final TextInputType keyboardType;
  final int? maxLines;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = InputDecoration(
        labelText: placeholder,
        labelStyle: GoogleFonts.anta(
          fontSize: 20,
          color: color,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kSecondaryColor, width: 3),
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: const Color(0xff424530),
        prefixIcon: Icon(
          icon,
          size: size.width * 0.065,
          // shadows: shadowPPN3,
        ),
        isDense: true);

    return TextFormField(
        maxLines: maxLines,
        cursorColor: kSecondaryColor,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: GoogleFonts.anta(
            fontSize: 20, color: color, fontWeight: FontWeight.bold),
        decoration: decoration);
  }
}
