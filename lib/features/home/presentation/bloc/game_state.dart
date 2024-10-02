import '../../domain/entities/game.dart';

abstract class GameState {}

class GameInitial extends GameState {}

class GameLoading extends GameState {}

class GameLoaded extends GameState {
  final List<Game> games;
  GameLoaded(this.games);
}

class GameError extends GameState {
  final String message;
  GameError(this.message);
}