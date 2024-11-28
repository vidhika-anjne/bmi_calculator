import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BMIResultScreen extends StatelessWidget {
  final double bmi;

  BMIResultScreen({required this.bmi});

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = getBMICategory(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI Result'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your BMI is ${bmi.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )
                  .animate()
                  .fadeIn(delay: 300.ms)
                  .scale(duration: 500.ms),
              SizedBox(height: 16),
              Text(
                category,
                style: TextStyle(
                  fontSize: 20,
                  color: category == 'Normal' ? Colors.green : Colors.red,
                ),
              )
                  .animate()
                  .fadeIn(delay: 600.ms)
                  .slideY(begin: 1, duration: 500.ms),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Recalculate'),
              ).animate().fadeIn(delay: 900.ms),
            ],
          ),
        ),
      ),
    );
  }
}

