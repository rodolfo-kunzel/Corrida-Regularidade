import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantColors.appOrange,
        appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(
          title: 'RESULTADO GERAL',
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.amberAccent,
                            child: const Text("hello"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          child: Container(
                            constraints: const BoxConstraints.expand(),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                color: AppConstantColors.appBlack),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'REGISTRAR PONTO',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppConstantColors.appOrange),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          child: Container(
                            constraints: const BoxConstraints.expand(),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                color: AppConstantColors.appBlack),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'CORRIDA',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: AppConstantColors.appOrange),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          child: Container(
                            constraints: const BoxConstraints.expand(),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                color: AppConstantColors.appBlack),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  'REGISTRAR CARRO',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppConstantColors.appOrange),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
