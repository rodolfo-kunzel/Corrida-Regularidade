import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/features/stop_list_page/controller/stop_list_page_controller.dart';
import 'package:flutter/material.dart';

class StopListPageView extends StatefulWidget {
  const StopListPageView({Key? key}) : super(key: key);

  @override
  State<StopListPageView> createState() => _StopListPageViewState();
}

class _StopListPageViewState extends State<StopListPageView> {
  final _controller = StopListPageController();
  @override
  void initState() {
    _controller.getAllStops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantColors.appOrange,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarConstant(
          title: 'LISTA DE PONTOS',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Icon(
                    Icons.refresh_rounded,
                    color: AppConstantColors.appBlack,
                  ),
                  onTap: () {
                    _controller.getAllStops();
                    setState(() {});
                  },
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "PONTO",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "MIN. INIC.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "DELETAR",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _controller.stopsInformation.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controller.stopsInformation.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          _controller.stopsInformation[index]["Nome do Ponto"]!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _controller.stopsInformation[index]
                                      ["Minutos após início"]!
                                  .toString(),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                            onTap: () {
                              _controller.deleteStop(_controller
                                  .stopsInformation[index]["Nome do Ponto"]!);
                            },
                            child: const Icon(Icons.delete)),
                      );
                    },
                  )
                : const Center(child: Text("Nenhum Ponto Foi Adicionado")),
          ],
        ),
      ),
    );
  }
}
