import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_button.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_dialog.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_textfield.dart';
import 'package:corrida_de_regulariodade_flutter/features/stop_register_page/controller/stop_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class StopRegisterView extends StatelessWidget {
  final _controller = StopRegisterController();
  StopRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantColors.appOrange,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(title: 'REGISTRO DE PONTO'),
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
                            'Nome do Ponto',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        Observer(builder: (_) {
                          return AppTextfield(
                            onChanged: _controller.changeStopName,
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
                            'Minutos após início',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        Observer(builder: (_) {
                          return AppTextfield(
                            onChanged: _controller.changeMinutesSinceStart,
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
                            'Início',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        Observer(builder: (_) {
                          return Container(
                            height: 54,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: AppConstantColors.appWhite,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: DropdownButton(
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppConstantColors.appBlack),
                                iconEnabledColor: AppConstantColors.appBlack,
                                iconDisabledColor: AppConstantColors.appBlack,
                                isExpanded: true,
                                items: <String>[
                                  "SIM",
                                  "NÃO"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppConstantColors.appBlack)),
                                  );
                                }).toList(),
                                onChanged: _controller.changeDropDownValue,
                                value: _controller.dropDownValue,
                                underline: const SizedBox(),
                              ),
                            ),
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
                    'Pontos',
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
                      _controller.allInputsValid
                          ? showDialog(
                              context: context,
                              builder: (context) {
                                return AppDialog(
                                  text: "Você confirma o registro do ponto?",
                                  leftButtonTitle: "Não",
                                  rightButtonTitle: "Sim",
                                  leftButtonAction: () {
                                    Navigator.pop(context);
                                  },
                                  rightButtonAction: () async {
                                    await _controller.stopRegister();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                );
                              })
                          : null;
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
