import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../container_config.dart';

class ConfigSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Width: ${config.width.toStringAsFixed(0)}'),
          Slider(
            value: config.width,
            min: 20,
            max: 100,
            onChanged: (value) => config.setWidth(value),
          ),
          Text('Height: ${config.height.toStringAsFixed(0)}'),
          Slider(
            value: config.height,
            min: 20,
            max: 100,
            onChanged: (value) => config.setHeight(value),
          ),
          Text('Border Radius: ${config.borderRadius.toStringAsFixed(0)}'),
          Slider(
            value: config.borderRadius,
            min: 0,
            max: 100,
            onChanged: (value) => config.setBorderRadius(value),
          ),
        ],
      ),
    );
  }
}