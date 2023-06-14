import 'package:bookreco/bloc/cubit.dart';
import 'package:bookreco/bloc/states.dart';
import 'package:bookreco/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Items extends StatelessWidget {
  const Items({super.key});
  static String id = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit c = AppCubit.get(context);

          return Scaffold(
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  color: Color.fromARGB(200, 82, 30, 6),
                  width: double.infinity,
                  height: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage('images/profile.jpg'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 240,
                        height: 40,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(200, 82, 30, 6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'All',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(200, 82, 30, 6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Novel',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(200, 82, 30, 6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Fantasy',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(200, 82, 30, 6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Classics',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(top: 2),
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(200, 82, 30, 6),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Mystery',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => defaultComponent(
                                BookImage: 'images/fantasy.jpg',
                                BookName: 'The Chosen Ones',
                                BookType: 'Fantasy',
                                BookWriter: 'Scarlett Thomas',
                                BookRate: '66 Rating'),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 12)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
