import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/repostiories/institution_repository_impl.dart';
import 'package:distrito7_mobile/features/institution/services/camera_gallery_service_impl.dart';
import 'package:equatable/equatable.dart';

part 'complaints_ue_event.dart';
part 'complaints_ue_state.dart';

class ComplaintsUeBloc extends Bloc<ComplaintsUeEvent, ComplaintsUeState> {
  final InfoMarkerBloc infoMarkerBloc;
  final institutionRepositoryImpl = InstitutionRepositoryImpl();

  ComplaintsUeBloc({
    required this.infoMarkerBloc,
  }) : super(const ComplaintsUeState()) {
    on<OnChangedStatusComplaintsUE>((event, emit) {
      emit(state.copyWith(
        statusComplaintsUE: event.statusComplaintsUE,
      ));
    });

    on<OnProcessCargaImage>((event, emit) async {
      var url = await CameraGalleryServiceImpl.uploadImageToCloudinary(
          event.filePath);
      emit(state.copyWith(
        statusImage: ProcesoEstadoImagen.terminado,
        imagenDenuncia: url ?? state.imagenDenuncia,
      ));
    });

    on<OnChagedImagenDenuncia>((event, emit) {
      emit(state.copyWith(
        imagenDenuncia: event.imagenDenuncia,
      ));
    });

    on<OnProcessaDenuncia>((event, emit) async {
      var response = await institutionRepositoryImpl.procesarDenuncia(
          event.descripcionDenuncia,
          state.imagenDenuncia,
          event.idUnidadEducativa,
          event.codigoAdministrativo);
      if (response != "Salio todo correcto") {
        emit(state.copyWith(
          statusComplaintsUE: ProcesoEstadoDenuncia.terminado,
          mensajeProcesoDenuncia: "Revise su codigo de denuncia",
        ));
      } else {
        emit(state.copyWith(
          statusComplaintsUE: ProcesoEstadoDenuncia.terminado,
          mensajeProcesoDenuncia: "Denuncia Procesada con Exito",
        ));
      }
    });

    on<OnChangedStatusImage>((event, emit) {
      emit(state.copyWith(
        statusImage: event.statusImage,
      ));
    });
  }
}
