import 'package:bookreco/data/cubit/app_cubit.dart';
import 'package:bookreco/screens/home_screen.dart';
import 'package:bookreco/screens/items.dart';
import 'package:bookreco/screens/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit c = AppCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Are you Sure',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Do You Want To LogOut ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          c.removeEmailValue();

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const loginScreen(),
                          ));
                        },
                        child: const Text('Yes')),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const homePage(),
                          ));
                        },
                        child: const Text('No')),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

   /*  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Are You Sure',
                            textAlign: TextAlign.center,
                          ),
                          content: const Text(
                            ' You Want to Log Out',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            TextButton(
                                child: const Text('نعم'),
                                onPressed: () async {
                                  c.removeEmailValue();

                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const loginScreen(),
                                  ));
                                }),
                            TextButton(
                              child: const Text('لا'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  */
                  