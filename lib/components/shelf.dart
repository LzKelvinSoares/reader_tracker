

import 'package:flutter/material.dart';

class Shelf extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 10,
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/Wood_Texture.jpeg'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(0, 3),
              blurRadius: 3,
            ),
          ],
        ),
      ),
    );
  }
}