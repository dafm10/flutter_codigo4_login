
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_login/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  APIService _apiService = APIService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiService.getUser().then((value) {
      print(value!.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
      ),
      body: Center(),
    );
  }
}
