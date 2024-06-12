import 'package:domain/domain.dart';

/// Implementation for the about repository.
class AboutRepositoryImpl implements AboutRepository {

  @override
  About getAbout() {
    return About()
      ..text = '''
Olá. Meu nome é Márcio Rosa e eu sou um desenvolvedor de jogos. Loomiarts é a versão estúdio de mim mesmo, digamos assim. Não é uma empresa com uma estrutura de fato: não tem pessoal, estrutura física ou coisas do tipo e nunca terá - não tenho “mindset” (como dizem) para negócios ou sobre como gerenciar uma companhia.

Tampouco me considero, no entanto, um desenvolvedor “solo”: embora tenha começado sozinho a concepção do jogo Esquadrão 51 Contra os Discos Voadores, lá nos idos de 2016, sempre foi a intenção evoluir para um projeto colaborativo. E foi assim que, com o passar dos anos, colaboradores como a KF Studios, a FornoFX e a Fehorama Filmes foram se unindo ao projeto para dar forma àquilo que viria a ser lançado em 2022. E é dessa forma que pretendo que futuras produções venham também a acontecer.'''
      ..email = 'contato@loomiarts.com'
      ..socialMediaLinks = [
        ExternalLink('Twitter / X', 'https://twitter.com/loomiarts'),
        ExternalLink('YouTube', 'https://www.youtube.com/channel/UCSTsJXCSFYo009D0YAtkqSQ'),
        ExternalLink('GitHub', 'https://github.com/Loomiarts'),
      ];
  }
}
