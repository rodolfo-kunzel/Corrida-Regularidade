import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/features/car_register_page/view/car_register_view.dart';
import 'package:corrida_de_regulariodade_flutter/features/home_page/controller/home_controller.dart';
import 'package:corrida_de_regulariodade_flutter/features/race_page/view/race_page_view.dart';
import 'package:corrida_de_regulariodade_flutter/features/stop_register_page/view/stop_register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = HomeController();
  @override
  void initState() {
    _controller.getAllCarInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              flex: 8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(child: Icon(Icons.refresh_rounded, color: AppConstantColors.appBlack,), onTap: (){
                                    _controller.getAllCarInformation();
                                  },)
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "POSIÇÃO",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "CARRO",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "PONTOS",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Observer(builder: (_) {
                          return Container(
                            color: Colors.transparent,
                            child: _controller.allCarInformation.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        _controller.allCarInformation.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        leading: Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(_controller
                                                    .allCarInformation[index]
                                                ["Nome"]!),
                                          ],
                                        ),
                                        trailing: Text(
                                            _controller.allCarInformation[index]
                                                ["Score"]!.toString()),
                                      );
                                    },
                                  )
                                : const Center(
                                    child: Text(
                                        "Nenhum Carro Terminou a Corrida")),
                          );
                        })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SafeArea(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StopRegisterView()));
                          },
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RacePageView()));
                          },
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarRegisterView()));
                          },
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
