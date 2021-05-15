import 'package:flutter/material.dart';

import 'package:atividade_imc/core/app_images.dart';

class TypeCardWidget extends StatefulWidget {
  bool manIsSelected = false;
  bool womanIsSelected = false;

  String getSelected() {
    if (manIsSelected) {
      return 'homem';
    } else if (womanIsSelected) {
      return 'mulher';
    }
    return 'null';
  }

  @override
  _TypeCardWidgetState createState() => _TypeCardWidgetState();
}

class _TypeCardWidgetState extends State<TypeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.manIsSelected = true;
              widget.womanIsSelected = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: widget.manIsSelected ? Colors.green : Colors.black,
                width: 2,
              ),
            ),
            height: 100,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(AppImages.man),
                  height: 60,
                ),
                Text(
                  'Homem',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.womanIsSelected = true;
              widget.manIsSelected = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: widget.womanIsSelected ? Colors.green : Colors.black,
                width: 2,
              ),
            ),
            height: 100,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(AppImages.woman),
                  height: 60,
                ),
                Text(
                  'Mulher',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
