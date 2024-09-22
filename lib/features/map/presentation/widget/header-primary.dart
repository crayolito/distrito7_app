import 'package:distrito7_mobile/blocs/infoMarker/info_marker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderPrimary extends StatelessWidget {
  const HeaderPrimary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final infoMarkerBloc = BlocProvider.of<InfoMarkerBloc>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  infoMarkerBloc
                      .add(OnChangeViewInfo(!infoMarkerBloc.state.viewInfo));
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: size.width * 0.07,
                  color: const Color(0xFF44BEED),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: size.width * 0.07,
                  color: const Color(0xFF44BEED),
                ))
          ],
        ),
      ),
    );
  }
}
