import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../widgets/generation_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Pokedex',
                  style: bigTextStyle,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0),
                  shrinkWrap: true,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: sizeBetween),
                      child: GenerationCard(
                        generation: index + 1,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
