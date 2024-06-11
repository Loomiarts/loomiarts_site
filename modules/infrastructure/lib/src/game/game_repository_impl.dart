import 'package:domain/domain.dart';

/// Implementation for the game repository.
class GameRepositoryImpl implements GameRepository {

  @override
  List<Game> getGames() {
    final squad51 = Game()
      ..name = 'Esquadrão 51 Contra os Discos Voadores'
      ..developedBy = 'Loomiarts e Fehorama Filmes'
      ..publishedBy = 'WhisperGames e Assemble Entertainment'
      ..genre = 'Shoot\'em up'
      ..shortDescription = 'Esquadrão 51 Contra dos Discos Voadores é um shoot\'em up para PC e consoles com estética de filmes de ficção científica dos anos 50. Desenvolvido por Loomiarts e Fehorama Filmes e publicado por WhisperGames e Assemble Entertainment. Já disponível para PC (Steam), Nintendo Switch, Xbox e PlayStation.'
      ..internationalName = 'Squad 51 vs. the Flying Saucers'
      ..awards = [
        'BIG Festival 2017: Melhor Arte (finalista), Melhor Jogo Brasileiro (finalista)',
        'Festival de Jogos do SBGames 2017: Melhor Visual (vencedor), Melhor Áudio (finalista), Melhor Tecnologia (finalista)',
        'Epic MegaGrants (contemplado)'
      ]
      ..features = [
        GameFeature('Gameplay clássico', 'Esquadrão 51 Contra os Discos Voadores é um SHOOT’EM UP! com quatro aeronaves diferentes para jogar e variadas armas especiais.'),
        GameFeature('Experiência cinemática', 'Gloriosa estética em preto-e-branco, cutscenes em live-action e vozes dubladas contarão a história da batalha entre o Esquadrão 51 e a supremacia alienígena do Diretor Zarog.'),
        GameFeature('11 fases', 'Combata naves inimigas e chefões em diferentes ambientes - montanhas nevadas, florestas, paisagens urbanas, entre outros.'),
        GameFeature('Multijogador', 'Se sentindo sozinho contra alienígenas? Convide um amigo! Um segundo jogador pode entrar em qualquer nível quando quiser. Junte pontos com seu amigo e desbloqueiem juntos nova armas especiais e upgrades.'),
      ]
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
        ExternalLink('Twitter / X', 'http://twitter.com/squad51game')
      ]
      ..additionalLinks = [
        ExternalLink('Fehorama Filmes', 'https://fehoramafilmes.wixsite.com/fehoramafilmes'),
        ExternalLink('WhisperGames', 'http://www.whisperinteractive.com/'),
      ]
      ..posterImage = 'assets/squad51/poster.png'
      ..bannerImage = 'assets/squad51/banner.png';
    return [squad51];
  }
  
}
