import 'package:flutter/material.dart';

class WidgetReusable extends StatelessWidget {
  const WidgetReusable(
      {@required this.colour, this.widgetHijo, this.presionado});
  final Color colour;
  final Widget widgetHijo;
  final Function presionado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: presionado,
      child: Container(
        child: widgetHijo,
        margin: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
