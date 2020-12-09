import 'package:flutter/material.dart';

class BuildRow extends StatefulWidget {
  String chave;
  String valor;
  BuildRow(this.chave, this.valor);
  @override
  _BuildRowState createState() => _BuildRowState();
}

class _BuildRowState extends State<BuildRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          child: Text(
            widget.chave,
            style: TextStyle(
              fontFamily: "Baloo",
              fontSize: 15,
              color: Color(0xff141736),
            ),
          ),
        ),
        Text(
          widget.valor,
          style: TextStyle(
            fontFamily: "Baloo",
            fontSize: 15,
            color: Color(0xffA9B6CA),
          ),
        ),
      ],
    );
  }
}
