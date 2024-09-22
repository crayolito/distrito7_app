part of 'institution_bloc.dart';

class InstitutionEvent extends Equatable {
  const InstitutionEvent();

  @override
  List<Object> get props => [];
}

class OnChangedInstitutionType extends InstitutionEvent {
  final InstitutionType institutionType;
  const OnChangedInstitutionType(this.institutionType);
}

// ignore: must_be_immutable
class OnRecognizeInstitution extends InstitutionEvent {
  bool? isInstComun;
  bool? isInstEspecial;
  OnRecognizeInstitution({this.isInstComun, this.isInstEspecial});
}

class OnChangedCoordenadasCategoriaSelect extends InstitutionEvent {
  final Map<String, LatLng> coordenadasInstitucionesCS;
  const OnChangedCoordenadasCategoriaSelect(this.coordenadasInstitucionesCS);
}

// ignore: must_be_immutable
class OnChangedInfoInstitutions extends InstitutionEvent {
  List<InstitutionInfoMarker>? institucionesInfoMarker;
  List<InstitutionInfoMarker>? infoClienteSeach;

  List<InstitutionSpecial>? institucionesEspeciales;
  List<InstitucionComun>? institucionesComunes;

  OnChangedInfoInstitutions({
    this.institucionesInfoMarker,
    this.infoClienteSeach,
    this.institucionesEspeciales,
    this.institucionesComunes,
  });
}

// ignore: must_be_immutable
class OnChangedInfoInstitution extends InstitutionEvent {
  InstitutionSpecial? institucionEspecial;
  InstitucionComun? institucionComun;

  OnChangedInfoInstitution({
    this.institucionEspecial,
    this.institucionComun,
  });
}

class OnInitInfoComponents extends InstitutionEvent {
  const OnInitInfoComponents();
}

class OnRegistroNroDenuncia extends InstitutionEvent {
  final String nroDenuncia;
  const OnRegistroNroDenuncia(this.nroDenuncia);
}

class OnResetInfoClientSearch extends InstitutionEvent {
  const OnResetInfoClientSearch();
}

class OnApplyFilterSearch extends InstitutionEvent {
  final String filter;
  const OnApplyFilterSearch(this.filter);
}
