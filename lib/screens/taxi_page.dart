import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nle_app/screens/widgets/submit.dart';

class TaxiPage extends StatefulWidget {
  const TaxiPage({super.key});

  @override
  State<TaxiPage> createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  final formKey = GlobalKey<FormState>();
  String name = '';

  final colorItems = ['Red', 'Blue', 'Silver', 'Gold', 'Other'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff453658),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 0.4,
              ),
              const Text(
                'Enter driver',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Information',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Drivers name',
                ),
                validator: ((value) {
                  if (value!.isEmpty ||
                      RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Enter valid name';
                  } else {
                    return null;
                  }
                }),
              ),
              const SizedBox(height: 50),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Plate number',
                ),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return 'Enter plate number';
                  } else {
                    return null;
                  }
                }),
              ),
              const SizedBox(height: 50),
              DropdownButton<String>(
                value: value,
                items: colorItems.map(buildMenuItem).toList(),
                onChanged: (value) => setState(
                  () => (this.value = value),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    child: const Submit(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item),
    );
