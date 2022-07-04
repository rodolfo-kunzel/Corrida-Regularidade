import 'package:corrida_de_regulariodade_flutter/constants/app_bar_constant.dart';
import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:corrida_de_regulariodade_flutter/features/race_page/controller/race_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstantColors.appOrange,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(_controller.allStops[0]),
        // child: Observer(
        //   builder: (_) {
        //     return Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         // DropdownButton(
        //         //   style: GoogleFonts.roboto(
        //         //       fontWeight: FontWeight.bold,
        //         //       fontSize: 16,
        //         //       color: AppConstantColors.appBlack),
        //         //   iconEnabledColor: AppConstantColors.appBlack,
        //         //   iconDisabledColor: AppConstantColors.appBlack,
        //         //   isExpanded: true,
        //         //   items: _controller.allStops
        //         //       .map<DropdownMenuItem<String>>((String value) {
        //         //     return DropdownMenuItem<String>(
        //         //       value: value,
        //         //       child: Text(value,
        //         //           style: GoogleFonts.roboto(
        //         //               fontWeight: FontWeight.bold,
        //         //               fontSize: 16,
        //         //               color: AppConstantColors.appBlack)),
        //         //     );
        //         //   }).toList(),
        //         //   onChanged: _controller.changeCurrentStop,
        //         //   value: _controller.currentStop,
        //         //   underline: const SizedBox(),
        //         // ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
