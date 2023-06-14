import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class homeTabBar extends StatefulWidget {
  const homeTabBar({super.key});

  @override
  State<homeTabBar> createState() => _homeTabBarState();
}

class _homeTabBarState extends State<homeTabBar> {
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'one',
              ),
              Tab(
                text: 'two',
              ),
              Tab(
                text: 'three',
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: shearchData());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Form(
          key: formKey,
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field Must not be Empty';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content:
                                          Text('This Field Must not be Empty'),
                                    );
                                  });
                            }
                          },
                          obscureText: isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                icon: Icon(isPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    var snackbar = SnackBar(
                                      content: Text('Login Successed',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20)),
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(20),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackbar);
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.red,
                    ),
                    Image.asset(
                      'images/background.jpg',
                      fit: BoxFit.fill,
                      height: 800,
                    ),
                    Container(child: TextFormField())
                  ],
                ),
              ),
              Center(
                child: Text('page three'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class shearchData extends SearchDelegate {
  List data = [
    'ahmed',
    'mona',
    'ezz',
    'maged',
    'nour',
    'ibra',
  ];
  List filterResult = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('${query}'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filterResult = data.where((element) => element.contains(query)).toList();

    return ListView.separated(
        itemCount: query == '' ? data.length : filterResult.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                query = query == '' ? data[index] : filterResult[index];
                showResults(context);
              },
              child: Container(
                child: query == ''
                    ? Text(
                        '${data[index]}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        '${filterResult[index]}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
              ),
            ));
  }
}
