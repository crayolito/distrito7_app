part of 'complaints_ue_bloc.dart';

class ComplaintsUeEvent extends Equatable {
  const ComplaintsUeEvent();

  @override
  List<Object> get props => [];
}

class OnChangedStatusComplaintsUE extends ComplaintsUeEvent {
  final ProcesoEstadoDenuncia statusComplaintsUE;
  const OnChangedStatusComplaintsUE({required this.statusComplaintsUE});
}

class OnChangedStatusImage extends ComplaintsUeEvent {
  final ProcesoEstadoImagen statusImage;
  const OnChangedStatusImage({required this.statusImage});
}

class OnChagedImagenDenuncia extends ComplaintsUeEvent {
  final String imagenDenuncia;
  const OnChagedImagenDenuncia({required this.imagenDenuncia});
}

class OnProcessCargaImage extends ComplaintsUeEvent {
  final String filePath;
  const OnProcessCargaImage({
    required this.filePath,
  });
}

class OnProcessaDenuncia extends ComplaintsUeEvent {
  final String descripcionDenuncia;
  final int idUnidadEducativa;
  final String codigoAdministrativo;
  const OnProcessaDenuncia(
      {required this.descripcionDenuncia,
      required this.idUnidadEducativa,
      required this.codigoAdministrativo});
}
