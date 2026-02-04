import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function onTap;

  const PrimaryButton({super.key, required this.text, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      onTap();// chama a função passada como parâmetro
    }, child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 26),
              decoration: BoxDecoration(
                color: Color(0xFFB370FF),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                  Text(text, // outro parâmetro que muda conforme chamado
                  textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF1D0E44), fontSize: 20,
                   fontWeight: FontWeight.bold),),
                  icon != null ? Icon(icon /*parametro se tiver icon*/, color: Color(0xFF1D0E44),): Container(),
                ],
              )
            ));
  }
}