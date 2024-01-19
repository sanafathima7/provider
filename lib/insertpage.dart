import 'package:api/insert_data_class.dart';
import 'package:api/main.dart';
import 'package:api/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({Key? key}) : super(key: key);

  @override
  _InsertPageState createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter userId',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a user ID';
                  }
                  // You can add more validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _insertButton();
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertButton() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        int userId = int.parse(textController.text);
        Tests tests = Tests(
          userId: userId,
        );

        var provider = Provider.of<DataClass>(context, listen: false);
        await provider.postData(tests);

        if (provider.isBack) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      } catch (error) {
        // Handle the error (e.g., invalid input)
        print('Error inserting data: $error');
      }
    }
  }
}
