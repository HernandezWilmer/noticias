import 'package:flutter/material.dart';

const estiloDeEtiqueta = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconosContenido extends StatelessWidget {
  const IconosContenido({@required this.icono, @required this.etiqueta});

  final IconData icono;
  final String etiqueta;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icono,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$etiqueta',
          style: estiloDeEtiqueta,
        )
      ],
    );
  }
}
