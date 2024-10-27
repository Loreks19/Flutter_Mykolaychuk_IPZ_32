import 'package:flutter/material.dart';

class V0 extends StatefulWidget {
  @override
  State<V0> createState() => _V0State();
}

class _V0State extends State<V0> {
  double _size = 150.0;
  double _topLeftRadius = 0.0;
  double _topRightRadius = 0.0;
  double _bottomLeftRadius = 0.0;
  double _bottomRightRadius = 0.0;

  _onChangeTopLeftRadius(double value) {
    setState(() {
      _topLeftRadius = value;
    });
  }
  _onChangeTopRightRadius(double value) {
    setState(() {
      _topRightRadius = value;
    });
  }
  _onChangeBottomLeftRadius(double value) {
    setState(() {
      _bottomLeftRadius = value;
    });
  }
  _onChangeBottomRightRadius(double value) {
    setState(() {
      _bottomRightRadius = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const Text("Top Left Radius: "),
        Slider(value: _topLeftRadius, min: 0, max: 150, onChanged: _onChangeTopLeftRadius),

        const Text("Top Right Radius: "),
        Slider(value: _topRightRadius, min: 0, max: 150, onChanged: _onChangeTopRightRadius),

        const Text("Bottom Left Radius: "),
        Slider(value: _bottomLeftRadius, min: 0, max: 150, onChanged: _onChangeBottomLeftRadius),

        const Text("Bottom Right Radius: "),
        Slider(value: _bottomRightRadius, min: 0, max: 150, onChanged: _onChangeBottomRightRadius),


        Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_topLeftRadius),
                topRight: Radius.circular(_topRightRadius),
                bottomLeft: Radius.circular(_bottomLeftRadius),
                bottomRight: Radius.circular(_bottomRightRadius),
              ),
          ),
        )
      ],
    );
  }
}