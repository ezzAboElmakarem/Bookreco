import 'package:bloc/bloc.dart';
import 'package:bookreco/data/shared_pref/shared_pref.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  String? Email;

  SaveEmail({required String email}) {
    email = Email!;
    SharedPref().saveData(email: Email!);
    emit(GetEmail());
  }

  getEmail() {
    Email = SharedPref().getdata();
    print(Email);
    emit(GetEmail());
  }
}
