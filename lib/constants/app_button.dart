import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final void Function() onTap;
  final Color bottonBackgroud;
  final Color bottonTextColor;
  const AppButton({Key? key, required this.onTap, required this.bottonBackgroud, required this.bottonTextColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 80),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppConstantColors.appBlack),
            child: Center(
              child: Text(
                'Confirmar',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: bottonTextColor),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
