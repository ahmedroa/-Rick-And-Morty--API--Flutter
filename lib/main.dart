import 'package:aname/constants/my_colors.dart';
import 'package:aname/screen/Home.dart';
import 'package:aname/cubit/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.myGrey),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CharactersCubit()..fetchCharacters(),
        child: BlocListener<CharactersCubit, CharactersState>(
          listener: (context, state) {},
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
