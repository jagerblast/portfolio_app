import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class Portfolio {
  String name;
  String currency;
  int cash; // in pennies
  // Pennies, because double doesn't represent decimal fractions exactly
  // e.g print(0.1+0.2) = 0.300000000000000004

  Portfolio({
    required this.name,
    required this.currency,
    this.cash = 0,
  });
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
  int clickCount = 0;

  final Portfolio portfolio = Portfolio( 
      name: 'Cash Portfolio',
      currency: "GBP",
      cash: 10000,
    );

  @override  
  Widget build(BuildContext context) {
    Text clickCounter = Text( 
      'Clicked $clickCount times',
      style: TextStyle( 
        fontSize: 32,
        color: Colors.green
      )
    );

    TextButton clicker = TextButton(
      onPressed: () async {
        setState(() {
          buttonText = 'You clicked me!!!';
          clickCount++;
          portfolio.cash += 10000;
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        clicker,
        clickCounter,
        Text( 
          'Cash: ${portfolio.currency} ${(portfolio.cash / 100).toStringAsFixed(2)}',
        ),
      ]
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(  
          title: const Text('Your Portfolio'),
          centerTitle: true,
        ),
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
