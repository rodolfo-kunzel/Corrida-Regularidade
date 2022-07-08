import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/features/car_list_page/controller/car_list_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../constants/app_constant_colors.dart';

class CarListPageView extends StatefulWidget {
  const CarListPageView({Key? key}) : super(key: key);

  @override
  State<CarListPageView> createState() => _CarListPageViewState();
}

class _CarListPageViewState extends State<CarListPageView> {
  final _controller = CarListPageController();

  @override
  void initState() {
    _controller.getAllCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantColors.appOrange,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(
          title: 'LISTA DE CARROS',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.refresh_rounded,
                        color: AppConstantColors.appBlack,
                      ),
                      onTap: () {
                        _controller.getAllCars();
                      },
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Carro",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Legendário",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Deletar",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              _controller.carInformation.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.carInformation.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: Text(
                              _controller.carInformation[index]
                                  ["Número do Carro"]!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _controller.carInformation[index]
                                          ["Número do Legendàrio"]!
                                      .toString(),
                                ),
                              ],
                            ),
                            trailing: InkWell(
                                onTap: () {
                                  _controller.deleteCar(
                                      _controller.carInformation[index]
                                          ["Número do Carro"]!);
                                },
                                child: const Icon(Icons.delete)));
                      },
                    )
                  : const Center(child: Text("Nenhum Carro Foi Adicionado")),
            ],
          ),
        ),
      ),
    );
  }
}
