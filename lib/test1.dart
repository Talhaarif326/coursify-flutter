import 'package:flutter/material.dart';
import 'package:project_on_clean_architecture/app/app.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  void updateInstance(){
    print(MyApp.instance.appState);
    MyApp.instance.appState = 10;
  }

  void get  updatedInstance {
print(MyApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
