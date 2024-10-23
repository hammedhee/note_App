import 'package:flutter/material.dart';
import 'package:note_app/functions/functions.dart';
import 'package:note_app/model/data_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titelCondroller = TextEditingController();
  TextEditingController descriptionCondroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getAllData();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 3, 249),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the form key here
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             const    Text(
                  'Create your note..',
                  style: TextStyle(
                      color:  Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 50),

                // Title Input with Validation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: titelCondroller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your title here...',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    // Validator for Title Field
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 40),

                // Description Input with Validation
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: descriptionCondroller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your description here...',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    // Validator for Description Field
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Description is required';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 125),

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    // Check if form is valid before saving data
                    if (_formKey.currentState!.validate()) {
                      dataSaveBtn();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "  .Save.  ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 232, 3, 249),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future dataSaveBtn() async {
    final enterdTitle = titelCondroller.text.trim();
    final enterdDescription = descriptionCondroller.text.trim();

    final saveUserData =
        Note(title: enterdTitle, description: enterdDescription);
    addData(saveUserData);
  }
}
