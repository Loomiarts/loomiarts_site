import 'package:domain/domain.dart';

/// Implementation for the game repository.
class GameRepositoryImpl implements GameRepository {

  @override
  List<Game> getGames() {
    final squad51 = Game()
      ..name = 'Esquadrão 51 Contra os Discos Voadores'
      ..developedBy = 'Loomiarts e Fehorama Filmes'
      ..stores = [
        ExternalLink('Steam', 'https://store.steampowered.com/app/1378800/'),
        ExternalLink('Nintendo eShop', 'https://www.nintendo.com/us/store/products/squad-51-vs-the-flying-saucers-switch/'),
        ExternalLink('Microsoft Store (Xbox)', 'https://www.xbox.com/en-us/games/store/squad-51-vs-the-flying-saucers/9p33g235jfbt'),
        ExternalLink('PlayStation Store', 'https://store.playstation.com/pt-br/product/UP5997-CUSA31360_00-0502192421273084'),
      ]
      ..videos = [
        ExternalLink('Trailer', 'https://www.youtube.com/watch?v=sK1WevYwhpI')
      ]
      ..socialMediaLinks = [
        ExternalLink('Discord', 'https://discord.gg/Zw4rbUT'),
        ExternalLink('Twitter / X', 'http://twitter.com/51_squadron')
      ]
      ..posterImage = 'assets/squad51/poster.png'
      ..bannerImage = 'assets/squad51/banner.png';
    return [squad51];
  }
  
}
