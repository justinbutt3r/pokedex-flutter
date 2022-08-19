part of 'move_list_cubit.dart';

abstract class MoveListState extends Equatable {
  const MoveListState();

  @override
  List<Object> get props => [];
}

class MoveListInitial extends MoveListState {}

class MoveListLoading extends MoveListState {}

class MoveListLoaded extends MoveListState {
  const MoveListLoaded({required this.moveList});

  final List<PokemonMove> moveList;

  @override
  List<Object> get props => [moveList];
}

class MoveListError extends MoveListState {
  const MoveListError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
