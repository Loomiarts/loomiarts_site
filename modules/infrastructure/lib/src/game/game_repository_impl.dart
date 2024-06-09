import 'package:domain/domain.dart';

/// Implementation for the game repository.
class GameRepositoryImpl implements GameRepository {

  @override
  List<Game> getGames() {
    final squad51 = Game()
      ..name = "Esquadrão 51 Contra os Discos Voadores"
      ..developedBy = "Loomiarts e Fehorama Filmes";
    return [squad51];
  }
  
}
