import 'package:flutter/material.dart';

class FilterPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              TextField(),
              TextField(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          width: double.infinity,
          child: FlatButton(
            onPressed: () {},
            child: Text('Apply'),
          ),
        ),
      ),
    );
  }
}
