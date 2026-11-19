import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text(
        'im learning flutter',
         style: TextStyle(fontSize: 64, color: Colors.purple),
         ))),
    );
  }
}
