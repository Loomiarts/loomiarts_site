import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/services.dart';

/// Implementation for the game repository.
class GameRepositoryImpl implements GameRepository {

  @override
  Future<List<Game>> getGames() async {
    final jsonString = await rootBundle.loadString('assets/games.json');
    final json = jsonDecode(jsonString);
    return Game.manyFromJson(json);
  }

}
