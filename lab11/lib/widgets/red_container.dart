import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../container_config.dart';

class RedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ContainerConfig>(context);
    return Container(
      width: config.width,
      height: config.height,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(config.borderRadius),
        ),
      ),
    );
  }
}