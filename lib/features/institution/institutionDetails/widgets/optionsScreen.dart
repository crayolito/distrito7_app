// ignore_for_file: file_names

import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            height: size.height * 0.05,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionIcon(
                  iconD: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // OptionIcon(
                //     iconD: FontAwesomeIcons.unity,
                //     onPressed: () async {
                //       Navigator.pushNamed(context, '/imageVR360', arguments: {
                //         'url':
                //             "https://res.cloudinary.com/da9xsfose/image/upload/v1710256525/mvgwct3rojmhmh7vslln.jpg"
                //       });
                //     }),
              ],
            ),
          ),
        ));
  }
}

class OptionIcon extends StatelessWidget {
  const OptionIcon({
    super.key,
    required this.iconD,
    this.onPressed,
  });

  final IconData iconD;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.12,
        width: size.width * 0.12,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(iconD,
              color: const Color(0xFF44BEED), size: size.width * 0.06),
        ),
      ),
    );
  }
}
