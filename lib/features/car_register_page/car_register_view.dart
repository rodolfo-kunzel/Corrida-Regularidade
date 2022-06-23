import 'package:corrida_de_regulariodade_flutter/constants/app_button.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarRegisterView extends StatelessWidget {
  const CarRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantColors.appOrange,
      appBar: AppBar(
        title: Center(
          child: Text(
            'REGISTRAR CARRO',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: AppConstantColors.appBlack),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Número do Carro',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        AppTextfield(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nome do Competidor',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        AppTextfield(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Número do Legendário',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        AppTextfield(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Lista de Carros',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppConstantColors.appWhite),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
                child: AppButton(
              onTap: () {},
            ))
          ],
        ),
      ),
    );
  }
}
