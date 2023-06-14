import 'package:bookreco/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(intialState());
  static AppCubit get(context) => BlocProvider.of(context);
}
