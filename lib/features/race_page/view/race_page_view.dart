import 'dart:async';
import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_dialog.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_dialog_one_option.dart';
import 'package:corrida_de_regulariodade_flutter/features/race_page/controller/race_page_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_button.dart';

class RacePageView extends StatefulWidget {
  const RacePageView({Key? key}) : super(key: key);

  @override
  State<RacePageView> createState() => _RacePageViewState();
}

class _RacePageViewState extends State<RacePageView> {
  final _controller = RacePageController();
  final String selectedCar = "";

  @override
  void initState() {
    _controller.allStopNames();
    _controller.allCarNames();
    Timer.periodic(
        const Duration(seconds: 1), (Timer t) => _controller.timeUpdated());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(title: 'REGISTRO DA CORRIDA'),
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
                              return DropdownSearch<String>(
                                dropdownSearchDecoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: AppConstantColors.appBlack,
                                  ),
                                ),
                                searchFieldProps: TextFieldProps(
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: AppConstantColors.appBlack)),
                                mode: Mode.MENU,
                                showSearchBox: true,
                                items: _controller.allCars,
                                selectedItem: selectedCar,
                                onChanged: _controller.changeCurrentCar,
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
                        Observer(
                          builder: (_) {
                            return ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                DateFormat(
                                  'HH:mm:ss',
                                ).format(_controller.currentTime),
                                style: TextStyle(
                                    color: AppConstantColors.appOrange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: AppConstantColors.appBlack,
                              ),
                            );
                          },
                        ),
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
                    onTap: () async {
                      await _controller.getStatusCurrentCar();
                      await _controller.getStatusCurrentStop();
                      if (_controller.isCurrentPointStart == false &&
                          _controller.currentCarHasStarted == false) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AppDialogOneOption(
                                text: "O carro ainda não iniciou",
                                buttonTitle: "ok",
                                buttonAction: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              );
                            });
                      } else {
                        _controller.allInputsValid
                            ? showDialog(
                                context: context,
                                builder: (context) {
                                  return AppDialog(
                                    text:
                                        "Você confirma o registro da corrida?",
                                    leftButtonTitle: "Não",
                                    rightButtonTitle: "Sim",
                                    leftButtonAction: () {
                                      Navigator.pop(context);
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
                      }
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
