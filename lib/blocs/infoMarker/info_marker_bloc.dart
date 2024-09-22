import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/institution/institution_bloc.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionInfoMarker.dart';
import 'package:equatable/equatable.dart';

part 'info_marker_event.dart';
part 'info_marker_state.dart';

class InfoMarkerBloc extends Bloc<InfoMarkerEvent, InfoMarkerState> {
  final InstitutionBloc institutionBloc;
  InfoMarkerBloc({
    required this.institutionBloc,
  }) : super(const InfoMarkerState()) {
    on<OnChangeViewInfo>((event, emit) {
      emit(state.copyWith(viewInfo: event.viewInfo));
      institutionBloc.add(const OnInitInfoComponents());
    });

    on<OnChangeInfoInstitution>((event, emit) {
      if (institutionBloc.state.institutionType ==
          InstitutionType.unidadEducativa) {
        institutionBloc.add(OnChangedInfoInstitution(
          institucionEspecial: institutionBloc.state.institucionesEspeciales
              .firstWhere((element) => element.id == event.infoStand.id),
        ));
      } else {
        institutionBloc.add(OnChangedInfoInstitution(
          institucionComun: institutionBloc.state.institucionesComunes
              .firstWhere((element) => element.id == event.infoStand.id),
        ));
      }
      emit(state.copyWith(infoStand: event.infoStand));
    });
  }
}
