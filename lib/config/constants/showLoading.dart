import 'dart:io';

import 'package:distrito7_mobile/blocs/complaintsUE/complaints_ue_bloc.dart';
import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowloadingCustom {
  BuildContext context;
  ShowloadingCustom(this.context);
  Size get size => MediaQuery.of(context).size;

    void showLoadingMessageErrores(String mensaje) {
      if (Platform.isAndroid) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(   
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size.height * 0.02),
                side: const BorderSide(color: kPrimaryColor, width: 3),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.yellow, size: size.height * 0.1),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    mensaje,
                    style: estilosText!.titulo1VentanaMensaje,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            );
          },
        );
      } else if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Column(
                children: [
                  Icon(CupertinoIcons.exclamationmark_triangle,
                      color: CupertinoColors.systemYellow,
                      size: size.height * 0.1),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    mensaje,
                    style: estilosText!.titulo1VentanaMensaje,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            );
          },
        );
      }
    }

  void showLoadingTemporal() {
    // Android
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          // Cerrar el diálogo después de 3 segundos
          Future.delayed(const Duration(seconds: 3)).then((_) {
            Navigator.pop(context);
          });

          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              side:
                  BorderSide(color: kSecondaryColor, width: size.width * 0.003),
            ),
            title: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.01),
                  child: Text(
                    "Espere por favor",
                    textAlign: TextAlign.center,
                    style: estilosText!.titulo1VentanaMensaje,
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: size.height * 0.1,
              width: size.width * 0.1,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF44BEED)),
                ),
              ),
            ),
          );
        },
      );

      return;
    }

    // iOS
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // Cerrar el diálogo después de 3 segundos
        Future.delayed(const Duration(seconds: 3)).then((_) {
          Navigator.pop(context);
        });

        return CupertinoAlertDialog(
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Text(
                  "Espere por favor",
                  textAlign: TextAlign.center,
                  style: estilosText!.titulo1VentanaMensaje,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.1,
            child: const Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            ),
          ),
        );
      },
    );
  }

  void showLoadingMap() {
    final size = MediaQuery.of(context).size;
    // Android
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context);
          });

          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF44BEED), width: 3),
            ),
            title: Column(
              children: [
                Text(
                  "Espere por favor",
                  textAlign: TextAlign.center,
                  style: estilosText!.titulo1VentanaMensaje,
                ),
              ],
            ),
            content: SizedBox(
              height: size.height * 0.07,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF44BEED)),
                ),
              ),
            ),
          );
        },
      );
      return;
    }

    // iOS
    showCupertinoDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.pop(context);
        });

        return CupertinoAlertDialog(
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Text(
                  "Espere por favor",
                  textAlign: TextAlign.center,
                  style: estilosText!.titulo1VentanaMensaje,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: size.height * 0.07,
            child: const Center(
              child: CupertinoActivityIndicator(
                radius: 15,
              ),
            ),
          ),
        );
      },
    );
  }

  void showLoadingImagenDenuncia() {
    // Android
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return BlocListener<ComplaintsUeBloc, ComplaintsUeState>(
            listener: (context, estado) {
              if (estado.statusImage == ProcesoEstadoImagen.terminado) {
                Navigator.pop(context);
              }
            },
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xFF44BEED), width: 3),
              ),
              title: Column(
                children: [
                  Text(
                    "Espere mientras su imagen se procesa.",
                    style: estilosText!.titulo1VentanaMensaje,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              content: SizedBox(
                height: size.height * 0.07,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
                  ),
                ),
              ),
            ),
          );
        },
      );
      return;
    }

    // iOS
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return BlocListener<ComplaintsUeBloc, ComplaintsUeState>(
          listener: (context, estado) {
            if (estado.statusImage == ProcesoEstadoImagen.terminado) {
              Navigator.pop(context);
            }
          },
          child: CupertinoAlertDialog(
            title: Column(
              children: [
                Text(
                  "Espere mientras su imagen se procesa.",
                  style: estilosText!.titulo1VentanaMensaje,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: SizedBox(
              height: size.height * 0.07,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

  void showLoadingProcesoDenuncia() {
    // Android
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final complaintsUeBloc =
              BlocProvider.of<ComplaintsUeBloc>(context, listen: true);

          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Color(0xFF44BEED), width: 3),
            ),
            title: Column(
              children: [
                Text(
                  complaintsUeBloc.state.mensajeProcesoDenuncia,
                  style: estilosText!.titulo1VentanaMensaje,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            content: complaintsUeBloc.state.statusComplaintsUE ==
                    ProcesoEstadoDenuncia.terminado
                ? SizedBox(
                    height: size.height * 0.07,
                    child: Center(
                        child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: complaintsUeBloc.state.mensajeProcesoDenuncia ==
                              "Denuncia Procesada con Exito"
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: size.height * 0.07,
                            )
                          : Icon(
                              Icons.error,
                              color: Colors.red,
                              size: size.height * 0.07,
                            ),
                    )),
                  )
                : SizedBox(
                    height: size.height * 0.07,
                    child: const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kSecondaryColor),
                      ),
                    ),
                  ),
          );
        },
      );
      return;
    }

    // iOS
    showCupertinoDialog(
      context: context,
      builder: (context) {
        final complaintsUeBloc =
            BlocProvider.of<ComplaintsUeBloc>(context, listen: true);

        return CupertinoAlertDialog(
          title: Column(
            children: [
              Text(
                complaintsUeBloc.state.mensajeProcesoDenuncia,
                style: estilosText!.titulo1VentanaMensaje,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: complaintsUeBloc.state.statusComplaintsUE ==
                  ProcesoEstadoDenuncia.terminado
              ? SizedBox(
                  height: size.height * 0.07,
                  child: Center(
                      child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: complaintsUeBloc.state.mensajeProcesoDenuncia ==
                            "Denuncia Procesada con Exito"
                        ? Icon(
                            CupertinoIcons.check_mark_circled,
                            color: CupertinoColors.activeGreen,
                            size: size.height * 0.07,
                          )
                        : Icon(
                            CupertinoIcons.clear_circled,
                            color: CupertinoColors.systemRed,
                            size: size.height * 0.07,
                          ),
                  )),
                )
              : SizedBox(
                  height: size.height * 0.07,
                  child: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                ),
        );
      },
    );
  }
}
