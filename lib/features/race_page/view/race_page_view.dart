import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_dialog.dart';
import 'package:corrida_de_regulariodade_flutter/features/race_page/controller/race_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_button.dart';

class RacePageView extends StatefulWidget {
  const RacePageView({Key? key}) : super(key: key);

  @override
  State<RacePageView> createState() => _RacePageViewState();
}

class _RacePageViewState extends State<RacePageView> {
  final _controller = RacePageController();

  @override
  void initState() {
    _controller.allStopNames();
    _controller.allCarNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(title: 'REGISTRO DE PONTO'),
      ),
      backgroundColor: AppConstantColors.appOrange,
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
                        Container(
                          height: 54,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: AppConstantColors.appWhite,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Observer(builder: (_) {
                              return DropdownButton(
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppConstantColors.appBlack),
                                iconEnabledColor: AppConstantColors.appBlack,
                                iconDisabledColor: AppConstantColors.appBlack,
                                isExpanded: true,
                                items: _controller.allStops
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppConstantColors.appBlack)),
                                  );
                                }).toList(),
                                onChanged: _controller.changeCurrentStop,
                                underline: const SizedBox(),
                                hint: const Text("Selecione um Ponto"),
                                value: _controller.currentStop == ""
                                    ? null
                                    : _controller.currentStop,
                              );
                            }),
                          ),
                        ),
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
                            'Número do Carro',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        Container(
                          height: 54,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: AppConstantColors.appWhite,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Observer(builder: (_) {
                              return DropdownButton(
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppConstantColors.appBlack),
                                iconEnabledColor: AppConstantColors.appBlack,
                                iconDisabledColor: AppConstantColors.appBlack,
                                isExpanded: true,
                                items: _controller.allCars
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppConstantColors.appBlack)),
                                  );
                                }).toList(),
                                onChanged: _controller.changeCurrentCar,
                                underline: const SizedBox(),
                                hint: const Text("Selecione um Carro"),
                                value: _controller.currentCar == ""
                                    ? null
                                    : _controller.currentCar,
                              );
                            }),
                          ),
                        ),
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
                            'Horário',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppConstantColors.appBlack),
                          ),
                        ),
                        Observer(builder: (_) {
                          return ElevatedButton(
                              onPressed: () => _controller.displayTimeDialog(
                                    context,
                                  ),
                              child: Text(
                                _controller.time
                                    .toString()
                                    .replaceAll("TimeOfDay(", "")
                                    .replaceAll(")", ""),
                              ));
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Observer(
                builder: (_) {
                  return AppButton(
                    onTap: () {
                      _controller.allInputsValid
                          ? showDialog(
                              context: context,
                              builder: (context) {
                                return AppDialog(
                                  text: "Você confirma o registro da corrida?",
                                  leftButtonTitle: "Não",
                                  rightButtonTitle: "Sim",
                                  leftButtonAction: () {
                                    Navigator.pop(context);
                                  },
                                  rightButtonAction: () async {
                                    await _controller.stopCarTimeRegister();
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
