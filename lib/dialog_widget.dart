import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String value;

  const DialogWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: mediaQuery.size.width / 1.4,
        height: mediaQuery.size.height / 4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: const Offset(12, 36),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset('assets/images/1359136244969680896.jpeg'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Your phone number is:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18 * curScaleFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 3.5,
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15 * curScaleFactor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
