import 'package:flutter/material.dart';

import '../../../core/data/models/pokemon_form_details.dart';
import '../../../utils/theme.dart';
import '../../shared/widgets/pokemon_image.dart';

class OtherForms extends StatelessWidget {
  const OtherForms(
      {Key? key,
      this.padding = const EdgeInsets.all(16.0),
      required this.forms})
      : super(key: key);
  final EdgeInsets padding;
  final List<PokemonFormDetails> forms;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Other Forms',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0),
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: forms.length,
              itemBuilder: (context, index) {
                final PokemonFormDetails form = forms[index];
                return Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(
                    right: sizeBetween,
                  ),
                  child: Column(
                    children: [
                      PokemonImage(
                        image: form.image,
                      ),
                      Text(
                        form.name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
