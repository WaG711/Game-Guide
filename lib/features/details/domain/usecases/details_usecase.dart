import '../../data/repositories/details_repository.dart';
import '../entities/game_details.dart';

class DetailsUseCase {
  final DetailsRepository repository;

  DetailsUseCase(this.repository);

  Future<GameDetails> execute(String userId, String gameId) async {
    return await repository.getGame(userId, gameId);
  }
}
