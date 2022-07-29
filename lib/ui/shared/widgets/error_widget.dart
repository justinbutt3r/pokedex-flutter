import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

class PokemonErrorWidget extends StatelessWidget {
  const PokemonErrorWidget({Key? key, this.message = ''}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/open-pokeball.png',
            width: 200,
          ),
          Text(
            message,
            style: largeTextStyle,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'go back',
              style: smallTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
