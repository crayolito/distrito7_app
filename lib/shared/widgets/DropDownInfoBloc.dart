import 'package:animate_do/animate_do.dart';
import 'package:distrito7_mobile/config/constants/paletaColores.dart';
import 'package:distrito7_mobile/data/categories-data.dart';
import 'package:distrito7_mobile/shared/widgets/imageDescription.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropDownInfoBloc extends StatefulWidget {
  const DropDownInfoBloc({
    super.key,
    required this.onTap,
    required this.checkIS,
    required this.optionsInfo,
  });

  final int checkIS;
  final List<OptionsInfo> optionsInfo;
  final GestureTapCallback onTap;

  @override
  State<DropDownInfoBloc> createState() => _DropDownInfoBlocState();
}

class _DropDownInfoBlocState extends State<DropDownInfoBloc> {
  int checkIS = 0;

  bool view = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: view ? size.height * 0.35 : size.height * 0.13,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.085,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 200),
              curve: Curves.fastLinearToSlowEaseIn,
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  top: size.height * 0.02,
                  bottom: size.height * 0.007,
                  left: size.width * 0.01,
                  right: size.width * 0.01),
              width: double.infinity,
              height: view ? size.height * 0.25 : size.height * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: kSecondaryColor,
                  width: size.width * 0.008,
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: view
                    ? FadeInDown(child: widget.optionsInfo[checkIS].view)
                    : Container(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.01),
            width: double.infinity,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: size.width * 0.05),
                ...widget.optionsInfo.map((element) {
                  return ImageDescription(
                      id: element.idInit,
                      checkIS: checkIS,
                      onTap: () {
                        setState(() {
                          checkIS = element.idInit;
                        });
                      },
                      image: element.iconLink);
                }).toList(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      view = !view;
                    });
                    widget.onTap();
                  },
                  child: ButtonView(view: view),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonView extends StatelessWidget {
  const ButtonView({
    super.key,
    required this.view,
  });

  final bool view;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 5),
      width: size.width * 0.11,
      height: size.height * 0.091,
      child: Container(
          width: size.width * 0.11,
          height: size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: kSecondaryColor,
              width: size.width * 0.008,
            ),
          ),
          child: view
              ? Icon(
                  FontAwesomeIcons.eye,
                  color: kPrimaryColor,
                  size: size.width * 0.065,
                )
              : Icon(
                  FontAwesomeIcons.eyeSlash,
                  color: kPrimaryColor,
                  size: size.width * 0.065,
                )),
    );
  }
}
