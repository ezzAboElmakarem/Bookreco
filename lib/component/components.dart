import 'package:flutter/material.dart';
import 'package:bookreco/screens/home_screen.dart';

Widget CustomTextFormField({
  @required TextEditingController? controller,
  required TextInputType? type,
  @required String? hint,
  @required Widget? prefixIcon,
  @required Widget? suffixIcon,
  @required Function(String)? onChange,
  bool ispassword = false,
  required String? Function(String?)? validation,
}) {
  return TextFormField(
    obscureText: ispassword,
    onChanged: onChange,
    controller: controller,
    validator: validation,
    keyboardType: type,
    decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(20)))),
  );
}

void GoTohomePage(BuildContext context, String email) {
  Navigator.pushNamedAndRemoveUntil(
      context, homePage.id, arguments: {email}, (route) => false);
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

Widget defaultComponent({
  required String BookImage,
  required String BookName,
  required String BookType,
  required String BookWriter,
  required String BookRate,
}) =>
    Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(235, 133, 47, 7), width: 2)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0, left: 8.0, right: 12.0, top: 8.0),
              child: Image.asset('${BookImage}'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      '${BookName}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '     ${BookType}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 202, 76, 2)),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                Text('${BookWriter}'),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('${BookRate}',
                        style: TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(115, 30)),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(169, 125, 59, 1))),
                      onPressed: () {},
                      child: Text('Read Now'),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          size: 35,
                          Icons.bookmark_border_outlined,
                        )),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(115, 30)),
                          side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.black)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {},
                      child: Text(
                        'Recommend',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
