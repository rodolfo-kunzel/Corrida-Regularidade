import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_constant_colors.dart';

class AppBarConstant extends StatelessWidget {
  final String title;
  const AppBarConstant({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Center(
          child: Text(
            title,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppConstantColors.appBlack),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
