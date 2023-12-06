import 'package:aname/API/Dio.dart';
import 'package:aname/Models/characters.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());
  Character? character;

  final dio = Dio();

  Future<List<Character>> fetchCharacters() async {
    List<Character> characters = [];

    try {
      // Response response = DioHelper.getData(query: query)
      Response response =
          await Dio().get('https://rickandmortyapi.com/api/character');
      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        characters = results
            .map((characterJson) => Character.fromJson(characterJson))
            .toList();
      }
    } catch (e) {
      print('Error fetching characters: $e');
    }

    return characters;
  }
}
