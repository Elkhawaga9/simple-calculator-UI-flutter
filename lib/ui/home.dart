import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController firstNum = TextEditingController();
  TextEditingController secondNum = TextEditingController();
  FocusNode num1Focus = FocusNode();
  FocusNode num2Focus = FocusNode();
  String result = "Result";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: firstNum,
              focusNode: num1Focus,
              keyboardType: TextInputType.number,
              onSubmitted: (T){FocusScope.of(context).requestFocus(num2Focus);},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the first number',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: secondNum,
              focusNode: num2Focus,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the second number'
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                  Expanded(child: ElevatedButton(
                    onPressed: (){
                      num num1 = double.parse(firstNum.text);
                      num num2 = double.parse(secondNum.text);
                      num ans = (num1+num2);
                      setState(() {
                        result = ans.toString();
                      });
                    },
                    child: const Text('+'),
                  )
                ),
                const SizedBox(width: 20),
                Expanded(child: ElevatedButton(
                  onPressed: (){

                    num num1 = double.parse(firstNum.text);
                    num num2 = double.parse(secondNum.text);
                    num ans = (num1-num2);
                    setState(() {
                      result = ans.toString();
                    });
                  },
                  child: const Text('-'),
                )
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: ElevatedButton(
                  onPressed: (){

                    num num1 = double.parse(firstNum.text);
                    num num2 = double.parse(secondNum.text);
                    num ans = (num1*num2);
                    setState(() {
                      result = ans.toString();
                    });
                  },
                  child: const Text('*'),
                )
                ),
                const SizedBox(width: 20),
                Expanded(child: ElevatedButton(
                  style: const ButtonStyle(

                  ),
                  onPressed: (){
                    num num1 = double.parse(firstNum.text);
                    num num2 = double.parse(secondNum.text);
                    num ans = (num1/num2);
                    setState(() {
                      result = ans.toString();
                    });
                  },
                  child: const Text('/'),
                )
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Expanded(
                child: ElevatedButton(onPressed: () {
                  firstNum.clear();
                  secondNum.clear();
                  setState(() {
                    result = 'Result';
                    FocusScope.of(context).requestFocus(num1Focus);
                  });
                },
                    child: Text('clear')
                ),
              ),
            ),
            const SizedBox(height: 20),
             SizedBox(
              width: double.infinity,
              child: Text( result,

              style: TextStyle(
                fontSize: 20
              ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
