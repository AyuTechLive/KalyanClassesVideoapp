import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final TextEditingController _pin1Controller = TextEditingController();
  final TextEditingController _pin2Controller = TextEditingController();
  final TextEditingController _pin3Controller = TextEditingController();
  final TextEditingController _pin4Controller = TextEditingController();

  String fullPin = '';

  @override
  void dispose() {
    _pin1Controller.dispose();
    _pin2Controller.dispose();
    _pin3Controller.dispose();
    _pin4Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                controller: _pin1Controller,
                onChanged: (value) => _handlePinChange(value, _pin1Controller),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                controller: _pin2Controller,
                onChanged: (value) => _handlePinChange(value, _pin2Controller),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                controller: _pin3Controller,
                onChanged: (value) => _handlePinChange(value, _pin3Controller),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                controller: _pin4Controller,
                onChanged: (value) => _handlePinChange(value, _pin4Controller),
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _saveFullPin,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePinChange(String value, TextEditingController controller) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
    if (value.isNotEmpty) {
      if (controller == _pin1Controller) {
        _pin1Controller.text = value;
      } else if (controller == _pin2Controller) {
        _pin2Controller.text = value;
      } else if (controller == _pin3Controller) {
        _pin3Controller.text = value;
      } else if (controller == _pin4Controller) {
        _pin4Controller.text = value;
      }
    }
  }

  void _saveFullPin() {
    setState(() {
      fullPin =
          '${_pin1Controller.text}${_pin2Controller.text}${_pin3Controller.text}${_pin4Controller.text}';
      // Use the fullPin variable where you need it
      print('Full Pin: $fullPin');
    });
  }
}
