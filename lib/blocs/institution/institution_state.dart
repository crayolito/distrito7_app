part of 'institution_bloc.dart';

enum InstitutionType {
  unidadEducativa,
  centroRecreativo,
  centroSalud,
  centroDeportivo,
  puntoTuristico,
  centroPolicial,
  none,
  oficinaDistrital,
  nrEmergencias
}

// ignore: must_be_immutable
class InstitutionState extends Equatable {
  // READ : COORDENADAS DE LAS INSTITUCIONES DE LA CATEGORIA SELECCIONADA
  // NOTE : INFORMACION BACKEND SEARCH ELEMENTO
  List<InstitutionInfoMarker> institucionesInfoMarker;
  // NOTE : INFORMACION BACKEND SEARCH ELEMENTO
  List<InstitutionInfoMarker> infoClienteSeach;

  // READ : INFORMACION DE LA INSTITUCION COMUNES
  List<InstitutionSpecial> institucionesEspeciales;
  // READ : INFORMACION DE LA INSTITUCION ESPECIALES
  List<InstitucionComun> institucionesComunes;

  // READ : INSTITUCION ESPECIAL SELECCIONADA
  InstitutionSpecial? institucionEspecial;
  // READ : INSTITUCION COMUN SELECCIONADA
  InstitucionComun? institucionComun;

  // Search Institution InfoWindow
  final String titulo;

  // Institution Comun
  final bool isInstComun;
  // Institution Especial
  final bool isInstEspecial;

  // Informacion General de la Institucion
  final List<String> infoGeneral;
  final int checkInitInfo;
  final List<OptionsInfo> optionsInfo;

  // Institucions Administrativa de la Institucion
  final int checkInitAdm;
  final List<OptionsInfo> optionsAdm;

  //
  final List<OptionAditional> opcionesAdicionales;
  //
  final InstitutionType institutionType;

  InstitutionState({
    List<InstitutionInfoMarker>? institucionesInfoMarker,
    List<InstitutionInfoMarker>? infoClienteSeach,
    List<InstitutionSpecial>? institucionesEspeciales,
    List<InstitucionComun>? institucionesComunes,
    this.institucionEspecial,
    this.institucionComun,
    this.isInstComun = false,
    this.isInstEspecial = false,
    this.institutionType = InstitutionType.none,
    this.titulo = '',

    ///
    this.checkInitInfo = 0,
    List<String>? infoGeneral,
    List<OptionsInfo>? optionsInfo,

    ///
    List<OptionAditional>? opcionesAdicionales,

    ///
    this.checkInitAdm = 0,
    List<OptionsInfo>? optionsAdm,
  })  : infoGeneral = infoGeneral ?? [],
        optionsInfo = optionsInfo ?? [],
        optionsAdm = optionsAdm ?? [],
        opcionesAdicionales = opcionesAdicionales ?? [],
        institucionesInfoMarker = institucionesInfoMarker ?? [],
        institucionesEspeciales = institucionesEspeciales ?? [],
        institucionesComunes = institucionesComunes ?? [],
        infoClienteSeach = infoClienteSeach ?? [];

  InstitutionState copyWith({
    List<InstitutionInfoMarker>? institucionesInfoMarker,
    List<InstitutionInfoMarker>? infoClienteSeach,
    List<InstitutionSpecial>? institucionesEspeciales,
    List<InstitucionComun>? institucionesComunes,
    InstitutionSpecial? institucionEspecial,
    InstitucionComun? institucionComun,
    bool? isInstComun,
    bool? isInstEspecial,
    //
    //
    InstitutionType? institutionType,
    String? titulo,
    //
    int? checkInitInfo,
    List<String>? infoGeneral,
    List<OptionsInfo>? optionsInfo,

    ///
    List<OptionAditional>? opcionesAdicionales,
    //
    int? checkInitAdm,
    List<OptionsInfo>? optionsAdm,
  }) =>
      InstitutionState(
        institucionesInfoMarker:
            institucionesInfoMarker ?? this.institucionesInfoMarker,
        infoClienteSeach: infoClienteSeach ?? this.infoClienteSeach,
        institucionesEspeciales:
            institucionesEspeciales ?? this.institucionesEspeciales,
        institucionesComunes: institucionesComunes ?? this.institucionesComunes,
        institucionEspecial: institucionEspecial ?? this.institucionEspecial,
        institucionComun: institucionComun ?? this.institucionComun,
        isInstComun: isInstComun ?? this.isInstComun,
        isInstEspecial: isInstEspecial ?? this.isInstEspecial,
        //
        //
        institutionType: institutionType ?? this.institutionType,
        titulo: titulo ?? this.titulo,
        //
        checkInitInfo: checkInitInfo ?? this.checkInitInfo,
        optionsInfo: optionsInfo ?? this.optionsInfo,
        infoGeneral: infoGeneral ?? this.infoGeneral,

        ///
        opcionesAdicionales: opcionesAdicionales ?? this.opcionesAdicionales,
        //
        checkInitAdm: checkInitAdm ?? this.checkInitAdm,
        optionsAdm: optionsAdm ?? this.optionsAdm,
      );

  @override
  List<Object?> get props => [
        institucionesInfoMarker,
        infoClienteSeach,
        institucionesEspeciales,
        institucionesComunes,
        institucionEspecial,
        institucionComun,
        isInstComun,
        isInstEspecial,
        //
        //
        institutionType,
        titulo,
        //
        checkInitInfo,
        optionsInfo,
        infoGeneral,
        //
        opcionesAdicionales,
        //
        checkInitAdm,
        optionsAdm
      ];
}
