import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_button.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_dialog.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_textfield.dart';
import 'package:corrida_de_regulariodade_flutter/features/car_register_page/controller/car_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class CarRegisterView extends StatelessWidget {
  final _controller = CarRegisterController();
  CarRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantColors.appOrange,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(
          title: 'REGISTRO DE CARRO',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
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
                        Observer(builder: (_) {
                          return AppTextfield(
                            onChanged: _controller.changeCarNumber,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
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
                        Observer(builder: (_) {
                          return AppTextfield(
                            onChanged: _controller.changeCompetitorName,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
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
                        Observer(builder: (_) {
                          return AppTextfield(
                            onChanged: _controller.changeLegendaryNumber,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
            Observer(builder: (_) {
              return Expanded(
                  flex: 8,
                  child: AppButton(
                    onTap: () {
                      _controller.allInputsValid ? showDialog(
                              context: context,
                              builder: (context) {
                                return AppDialog(
                                  text: "Você confirma o registro do carro?",
                                  leftButtonTitle: "Não",
                                  rightButtonTitle: "Sim",
                                  leftButtonAction: () {
                                    Navigator.pop(context);
                                  },
                                  rightButtonAction: () async {
                                    await _controller.registerCar();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                );
                              }) : null;
                    },
                    bottonBackgroud: _controller.allInputsValid
                        ? AppConstantColors.appBlack
                        : AppConstantColors.appFadedBlack,
                    bottonTextColor: _controller.allInputsValid
                        ? AppConstantColors.appOrange
                        : AppConstantColors.appFadedOrange,
                  ));
            })
          ],
        ),
      ),
    );
  }
}
