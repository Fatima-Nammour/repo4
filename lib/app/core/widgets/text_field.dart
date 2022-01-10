import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData? icon;
  final InputDecoration? decoration;
  final String? labelString;
  final TextEditingController? textController;
  final Function? onChange;
  final String? validator;

  const TextFieldWidget({
    Key? key,
    this.icon,
    this.decoration,
    this.labelString,
    this.textController,
    this.onChange,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Opacity(
        opacity: 0.6,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 6,
                offset: Offset(5, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(
              4.0,
            ),
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              controller: textController,
              validator: (String? value) {
                return (value!.trim().isEmpty) ? validator : null;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: labelString,
                labelStyle:
                    const TextStyle(color: Colors.white, fontSize: 15.0),
                prefixIcon: Icon(
                  icon,
                  color: Colors.white,
                  size: 25.0,
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    )),
                fillColor: Colors.blue,
                filled: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
