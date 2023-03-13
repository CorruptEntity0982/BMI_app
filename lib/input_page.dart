import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: ReusableCard(
                      rang: Color(0xFF1D1E33),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      rang: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ReusableCard(
                rang: Color(0xFF1D1E33),
              ),
            ),
            Expanded(
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: ReusableCard(
                      rang: Color(0xFF1D1E33),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      rang: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.rang});
  final Color rang;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: rang,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
