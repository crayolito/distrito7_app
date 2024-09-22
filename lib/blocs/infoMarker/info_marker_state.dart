part of 'info_marker_bloc.dart';

class InfoMarkerState extends Equatable {
  final InstitutionInfoMarker? infoStand;
  final bool viewInfo;
  final int indexInstitutionSelect;

  const InfoMarkerState(
      {this.viewInfo = false, this.infoStand, this.indexInstitutionSelect = 0});

  InfoMarkerState copyWith(
          {bool? viewInfo,
          InstitutionInfoMarker? infoStand,
          int? indexInstitutionSelect}) =>
      InfoMarkerState(
          viewInfo: viewInfo ?? this.viewInfo,
          indexInstitutionSelect:
              indexInstitutionSelect ?? this.indexInstitutionSelect,
          infoStand: infoStand ?? this.infoStand);

  @override
  List<Object?> get props => [viewInfo, infoStand, indexInstitutionSelect];
}
