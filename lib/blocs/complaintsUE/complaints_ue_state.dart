part of 'complaints_ue_bloc.dart';

enum ProcesoEstadoDenuncia { empezando, terminado }

enum ProcesoEstadoImagen { empezando, terminado }

class ComplaintsUeState extends Equatable {
  final ProcesoEstadoDenuncia statusComplaintsUE;
  final ProcesoEstadoImagen statusImage;
  final String imagenDenuncia;
  final String mensajeProcesoDenuncia;

  const ComplaintsUeState({
    this.statusComplaintsUE = ProcesoEstadoDenuncia.empezando,
    this.statusImage = ProcesoEstadoImagen.empezando,
    this.imagenDenuncia = "assets/gifLoading/insertarImagen.png",
    this.mensajeProcesoDenuncia = "Espere, estamos procesando su denuncia",
  });

  ComplaintsUeState copyWith({
    ProcesoEstadoDenuncia? statusComplaintsUE,
    ProcesoEstadoImagen? statusImage,
    String? imagenDenuncia,
    String? mensajeProcesoDenuncia,
  }) {
    return ComplaintsUeState(
      statusComplaintsUE: statusComplaintsUE ?? this.statusComplaintsUE,
      statusImage: statusImage ?? this.statusImage,
      imagenDenuncia: imagenDenuncia ?? this.imagenDenuncia,
      mensajeProcesoDenuncia: mensajeProcesoDenuncia ?? this.mensajeProcesoDenuncia,
    );
  }

  @override
  List<Object> get props => [
        statusComplaintsUE,
        statusImage,
        imagenDenuncia,
        mensajeProcesoDenuncia,
      ];
}
