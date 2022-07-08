import 'package:corrida_de_regulariodade_flutter/constants/app_constant_colors.dart';
import 'package:flutter/material.dart';

class AppDialogOneOption extends StatelessWidget {
  final String text;
  final String buttonTitle;
  final Function() buttonAction;

  const AppDialogOneOption(
      {Key? key,
      required this.text,
      required this.buttonTitle,
      required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: AppConstantColors.appBlack,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppConstantColors.appWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppConstantColors.appOrange,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      buttonTitle,
                      style: TextStyle(
                        color: AppConstantColors.appWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                onTap: buttonAction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
