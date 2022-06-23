import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_constant_colors.dart';

class AppTextfield extends StatelessWidget {
  final String? hintText;
   const AppTextfield({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 60),
        filled: true,
        hintText: hintText,
        fillColor: AppConstantColors.appWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppConstantColors.appBlack),
    );
  }
}
