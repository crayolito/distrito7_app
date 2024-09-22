import 'package:bloc/bloc.dart';
import 'package:distrito7_mobile/blocs/institution/helpers.dart';
import 'package:distrito7_mobile/data/categories-data.dart';
import 'package:distrito7_mobile/features/home/infrastructure/repostiories/home_repository_impl.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionComun.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionEspecial.dart';
import 'package:distrito7_mobile/features/institution/domain/entities/institucionInfoMarker.dart';
import 'package:distrito7_mobile/features/institution/infrastructure/mappers/optionsAditional.dart';
import 'package:distrito7_mobile/main.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'institution_event.dart';
part 'institution_state.dart';

class InstitutionBloc extends Bloc<InstitutionEvent, InstitutionState> {
  final homeRepositoryImp = HomeRepositoryImpl();

  InstitutionBloc() : super(InstitutionState()) {
    on<OnChangedInstitutionType>((event, emit) {
      emit(state.copyWith(
          titulo: HelpersInstitution.titleDesignation(event.institutionType),
          institutionType: event.institutionType));
    });

    on<OnRecognizeInstitution>((event, emit) {
      emit(state.copyWith(
        isInstEspecial: event.isInstEspecial ?? state.isInstEspecial,
        isInstComun: event.isInstComun ?? state.isInstComun,
      ));
    });

    on<OnChangedInfoInstitution>((event, emit) {
      emit(state.copyWith(
        institucionEspecial:
            event.institucionEspecial ?? state.institucionEspecial,
        institucionComun: event.institucionComun ?? state.institucionComun,
      ));
    });

    on<OnChangedInfoInstitutions>((event, emit) {
      emit(state.copyWith(
        institucionesInfoMarker:
            event.institucionesInfoMarker ?? state.institucionesInfoMarker,
        infoClienteSeach: event.infoClienteSeach ?? state.infoClienteSeach,
        institucionesEspeciales:
            event.institucionesEspeciales ?? state.institucionesEspeciales,
        institucionesComunes:
            event.institucionesComunes ?? state.institucionesComunes,
      ));
    });

    on<OnInitInfoComponents>((event, emit) {
      List<OptionsInfo> opcionesInfo = [];
      List<OptionsInfo> opcionesAdm = [];
      opcionesAdm = HelpersInstitution.selectOptionsAdm(
        type: state.institutionType,
        turno: state.institucionEspecial?.turno.nombre ??
            "assets/infoScreen/turnoMañana.png",
      );
      opcionesInfo =
          HelpersInstitution.selectOptionsInfo(state.institutionType);
      emit(state.copyWith(
        checkInitInfo: 0,
        checkInitAdm: 0,
        optionsInfo: opcionesInfo,
        optionsAdm: opcionesAdm,
      ));
    });

    on<OnResetInfoClientSearch>((event, emit) {
      emit(state.copyWith(infoClienteSeach: state.institucionesInfoMarker));
    });

    on<OnApplyFilterSearch>((event, emit) {
      if (event.filter.isEmpty) {
        emit(state.copyWith(infoClienteSeach: state.institucionesInfoMarker));
        return;
      }

      List<InstitutionInfoMarker> aux = state.infoClienteSeach
          .where((element) =>
              element.nombre.toLowerCase().contains(event.filter.toLowerCase()))
          .toList();
      emit(state.copyWith(infoClienteSeach: aux));
    });

    on<OnRegistroNroDenuncia>((event, emit) async {
      try {
        await homeRepositoryImp.registroNroEmergencia(event.nroDenuncia);
      } catch (e) {
        mensajeCliente!
            .showLoadingMessageErrores("Problemas al subir los datos");
      }
    });
  }
}
