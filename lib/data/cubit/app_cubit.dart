import 'package:bloc/bloc.dart';
import 'package:bookreco/data/shared_pref/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  String? Email;

  removeEmailValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    emit(RemoveEmailState());
  }

  SaveEmail({required String email}) {
    SharedPref().saveData(email: email);
    emit(SaveEmailState());
  }

  getEmail() {
    Email = SharedPref().getdata();
    print(Email);
    emit(GetEmailState());
  }
}
