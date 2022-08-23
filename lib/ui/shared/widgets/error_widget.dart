import 'package:flutter/material.dart';

class PokemonErrorWidget extends StatelessWidget {
  const PokemonErrorWidget(
      {Key? key, this.message = '', this.showBackButton = true})
      : super(key: key);
  final String message;
  final bool showBackButton;

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
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          if (showBackButton == true)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Text('go back', style: Theme.of(context).textTheme.bodySmall),
            )
        ],
      ),
    );
  }
}
