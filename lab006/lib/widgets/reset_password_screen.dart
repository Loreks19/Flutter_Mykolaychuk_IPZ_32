import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Autorization page"),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                    width: 200,
                  ),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Reset",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () => {
                            showDialog(
                              context:context,
                              builder: (BuildContext ctx){
                                return const AlertDialog(
                                  title: Text("Message"),
                                  content: Text("Successful reset"),
                                );
                              },
                            ),
                          }, child: const Text("Reset")),
                    ),
                    ),
                    const SizedBox(width: 16.0),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                          height: 48,
                          child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () => {
                                Navigator.pop(context),
                              }, child: const Text("Back"))
                      ),
                    ),
                    const SizedBox(width: 16.0),
                  ],
                ),
              ],
            )
        )
    );
  }
}