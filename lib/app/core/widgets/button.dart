import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? textButton;
  final Function? onPress;

  const ButtonWidget({Key? key, this.textButton, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            elevation: MaterialStateProperty.all(5.0),
            shadowColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(
            textButton!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            onPress!();
          }),
    );
  }
}
