import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/blocs/abilityList/ability_list_cubit.dart';
import '../../shared/widgets/error_widget.dart';
import '../../shared/widgets/loader.dart';
import '../../shared/widgets/page_heading.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../widgets/ability_grid.dart';
import '../widgets/ability_list.dart';

class AbilityListLayout extends StatelessWidget {
  const AbilityListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbilityListCubit, AbilityListState>(
      builder: (BuildContext context, state) {
        if (state is AbilityListLoading) {
          return const Center(
            child: Loader(),
          );
        } else if (state is AbilityListError) {
          return Center(
            child: PokemonErrorWidget(
              message: state.message,
            ),
          );
        } else if (state is AbilityListLoaded && state.abilityList.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                const PageHeading(title: 'Abilities'),
                Expanded(
                  child: ResponsiveLayout(
                    smallWidget: AbilityList(
                      abilityList: state.abilityList,
                    ),
                    mediumWidget: AbilityGrid(
                      abilityList: state.abilityList,
                      crossAxisCount: 2,
                    ),
                    largeWidget: AbilityGrid(
                      abilityList: state.abilityList,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(
          child: PokemonErrorWidget(
            message: 'No Abilities found',
          ),
        );
      },
    );
  }
}
