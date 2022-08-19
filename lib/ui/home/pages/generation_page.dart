import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import '../../shared/widgets/page_heading.dart';
import '../widgets/generation_card.dart';

class GenerationPage extends StatelessWidget {
  const GenerationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            const PageHeading(title: 'By Generation'),
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
    );
  }
}
