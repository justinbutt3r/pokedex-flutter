part of 'ability_list_cubit.dart';

abstract class AbilityListState extends Equatable {
  const AbilityListState();

  @override
  List<Object> get props => [];
}

class AbilityListInitial extends AbilityListState {}

class AbilityListLoading extends AbilityListState {}

class AbilityListLoaded extends AbilityListState {
  const AbilityListLoaded({required this.abilityList});

  final List<PokemonAbility> abilityList;

  @override
  List<Object> get props => [abilityList];
}

class AbilityListError extends AbilityListState {
  const AbilityListError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
