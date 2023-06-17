part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class SaveEmailState extends AppStates {}

class GetEmailState extends AppStates {}

class RemoveEmailState extends AppStates {}
