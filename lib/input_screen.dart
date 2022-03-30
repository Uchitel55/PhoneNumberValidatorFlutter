import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import './dialog_widget.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####', filter: {"#": RegExp(r'[0-9]')});
  var _length = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() => _length = _controller.text.length);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height:
                    (mediaQuery.size.height * 0.3) - mediaQuery.padding.top),
            SizedBox(
              height: (mediaQuery.size.height * 0.2) - mediaQuery.padding.top,
              width: double.infinity,
              child: Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24 * curScaleFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: _controller,
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0.8,
                    ),
                  ),
                  hintText: '(201) 555-0123',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(.75),
                  ),
                  suffixIcon: _length > 0
                      ? IconButton(
                          onPressed: () => _controller.clear(),
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ))
                      : null,
                  helperText: 'Enter your phone number',
                  helperStyle: TextStyle(
                    color: Colors.grey.withOpacity(.75),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: (_length == 14)
            ? FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => DialogWidget(
                      value: _controller.text.toString(),
                    ),
                  );
                })
            : FloatingActionButton(
                backgroundColor: Colors.grey,
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                onPressed: () {},
              ),
      ),
    );
  }
}
