import 'package:flutter/material.dart';
import '../controller/passcode_controller.dart';
import 'language_button_widget.dart';
import 'passcode_pad_widget.dart';

class PasscodeView extends StatefulWidget {
  @override
  _PasscodeViewState createState() => _PasscodeViewState();
}

class _PasscodeViewState extends State<PasscodeView> {
  final PasscodeController _controller = PasscodeController();

  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _textControllers = List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var textController in _textControllers) {
      textController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 80,
              ),
            ),
            SizedBox(height: 10),

            ///DYNAMIC TEXT OUTPUT//
            Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 80),

            LanguageButtonWidget(),

            SizedBox(height: 10),

            ///DYNAMIC TEXT OUTPUT//
            Text(
              'Enter Passcode to Continue ',
              style: TextStyle(
                fontSize: 13,
              ),
            ),

            SizedBox(height: 20),



            PasscodePadWidget(
              controller: _controller,
              focusNodes: _focusNodes,
              textControllers: _textControllers,
            ),
          ],
        ),
      ),
    );
  }
}
