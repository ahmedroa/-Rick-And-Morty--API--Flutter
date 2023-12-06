import 'package:aname/Models/characters.dart';
import 'package:aname/cubit/characters_cubit.dart';
import 'package:aname/screen/characters_details_screen.dart';
import 'package:aname/witget/characterItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/my_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacterData();
  }

  Future<void> fetchCharacterData() async {
    List<Character> fetchedCharacters =
        await BlocProvider.of<CharactersCubit>(context).fetchCharacters();
    setState(() {
      characters = fetchedCharacters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        centerTitle: true,
        title: const Text('characters'),
      ),
      body: characters.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : DetailsItem(characters: characters, widget: widget),
    );
  }
}
