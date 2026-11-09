

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
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Colors.brown.shade400,
          //     Colors.brown.shade700,
          //     Colors.brown.shade900,
          //   ],
          // ),
          image: const DecorationImage(
            image: AssetImage('assets/images/Wood_Texture.jpeg'),
            fit: BoxFit.cover,
            // ou repeat: ImageRepeat.repeatX, se a textura for pequena
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