import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingCustom extends StatelessWidget {
  const LoadingCustom({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return getLoading();
  }

  Widget getLoading() {
    return Center(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: SizedBox(
              child: CircularProgressIndicator(color: Colors.grey),
              height: 80,
              width: 80,
            ),
          ),
          Text(title, style: TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}
