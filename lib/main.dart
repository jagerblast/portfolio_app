import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class ChangingButton extends StatefulWidget {
  const ChangingButton({super.key});

  @override  
  State<ChangingButton> createState() => _ChangingButtonState();
}

class _ChangingButtonState extends State<ChangingButton> {
  static const String defaultText = 'Click me NOW or dont';
  // above must be static & const 
  // making it static means it belongs to the class rather than an individual state object
  String buttonText = defaultText;

  @override  
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        setState(() {
          buttonText = 'You clicked me!!!';
        });

        // Wait a second before continuing
        await Future.delayed(const Duration(seconds: 1));

        // Check to see if the button was removed during the wait
        if (!mounted) return; 

        setState(() {
          buttonText = defaultText; 
        });
      },

      child: Text(buttonText),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column( 
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'im learning flutter',
                style: TextStyle( 
                  fontSize: 64,
                  color: Colors.purple,
                ),
              ),
              ChangingButton(),
            ]

          )
          
        )
      ),
    );
  }
}
