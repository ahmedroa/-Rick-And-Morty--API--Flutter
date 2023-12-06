part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class Done extends CharactersState {}
