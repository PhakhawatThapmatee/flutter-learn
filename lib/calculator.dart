import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _MyCalculatorPageState();
}

class _MyCalculatorPageState extends State<CalculatorPage> {
  String _answer = "0";
  double? _firstNumber;
  String? _operator;
  bool _isNewNumber = true;
  String _textAll = "0";

  void addNumber(int number) {
    setState(() {
      if (_isNewNumber) {
        _answer = number.toString();
        _isNewNumber = false;
      } else {
        if (number == 0 && _answer == "0") {
          //
        } else if (number != 0 && _answer == "0") {
          _answer = number.toString();
        } else {
          _answer += number.toString();
        }
      }
    });
  }

  void deleteAll() {
    setState(() {
      _answer = "0";
      _textAll = "0";
    });
  }

  void deleteNumber() {
    setState(() {
      if (_answer.length > 1) {
        _answer = _answer.substring(0, _answer.length - 1);
      } else {
        _answer = "0";
      }
    });
  }

  void setOperator(String operator) {
    setState(() {
      _firstNumber = double.parse(_answer);
      _operator = operator;
      _isNewNumber = true;
      if (_textAll == "0") {
        _textAll = _answer + operator;
      } else {
        _textAll += _answer + operator;
      }
    });
  }

  void calculateResult() {
    setState(() {
      double secondNumber = double.parse(_answer);
      double result;

      switch (_operator) {
        case "+":
          result = (_firstNumber ?? 0) + secondNumber;
          break;
        case "-":
          result = (_firstNumber ?? 0) - secondNumber;
          break;
        case "*":
          result = (_firstNumber ?? 0) * secondNumber;
          break;
        case "/":
          result = (_firstNumber ?? 0) / secondNumber;
          break;
        default:
          result = secondNumber;
      }

      _answer = result.toString();
      _operator = null;
      _isNewNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Column(
        children: <Widget>[
          answerWidget(),
          numPadWidget(),
        ],
      ),
    );
  }

  Widget answerWidget() {
    return Expanded(
        flex: 150,
        child: Container(
            color: const Color.fromARGB(0, 60, 60, 60),
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints.expand(height: 180),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(_textAll,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text(_answer,
                          style: const TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold))
                    ]))));
  }

  Widget numPadWidget() {
    return Expanded(
        flex: 300,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(0, 60, 60, 60),
                  child: Row(children: <Widget>[
                    numberButtonWidget(
                        "e", 100, Colors.white, Colors.blue, () {}),
                    numberButtonWidget(
                        "μ", 100, Colors.white, Colors.blue, () {}),
                    numberButtonWidget(
                        "sin", 100, Colors.white, Colors.blue, () {}),
                    numberButtonWidget(
                        "deg", 100, Colors.white, Colors.blue, () {}),
                  ]),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(0, 60, 60, 60),
                  child: Row(children: <Widget>[
                    numberButtonWidget("Ac", 100, Colors.white, Colors.blue,
                        () {
                      deleteAll();
                    }),
                    numberButtonWidget("⌫", 100, Colors.white, Colors.blue, () {
                      deleteNumber();
                    }),
                    numberButtonWidget("/", 100, Colors.white, Colors.blue, () {
                      setOperator('/');
                    }),
                    numberButtonWidget("*", 100, Colors.white, Colors.blue, () {
                      setOperator('*');
                    }),
                  ]),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: const Color.fromARGB(0, 60, 60, 60),
                  child: Row(children: <Widget>[
                    numberButtonWidget("7", 100, Colors.white, Colors.blue, () {
                      addNumber(7);
                    }),
                    numberButtonWidget("8", 100, Colors.white, Colors.blue, () {
                      addNumber(8);
                    }),
                    numberButtonWidget("9", 100, Colors.white, Colors.blue, () {
                      addNumber(9);
                    }),
                    numberButtonWidget("-", 100, Colors.white, Colors.blue, () {
                      setOperator('-');
                    }),
                  ]),
                )),
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              color: const Color.fromARGB(0, 60, 60, 60),
                              child: Row(
                                children: [
                                  numberButtonWidget(
                                      "4", 100, Colors.white, Colors.blue, () {
                                    addNumber(4);
                                  }),
                                  numberButtonWidget(
                                      "5", 100, Colors.white, Colors.blue, () {
                                    addNumber(5);
                                  }),
                                  numberButtonWidget(
                                      "6", 100, Colors.white, Colors.blue, () {
                                    addNumber(6);
                                  }),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              color: const Color.fromARGB(0, 60, 60, 60),
                              child: Row(
                                children: [
                                  numberButtonWidget(
                                      "1", 100, Colors.white, Colors.blue, () {
                                    addNumber(1);
                                  }),
                                  numberButtonWidget(
                                      "2", 100, Colors.white, Colors.blue, () {
                                    addNumber(2);
                                  }),
                                  numberButtonWidget(
                                      "3", 100, Colors.white, Colors.blue, () {
                                    addNumber(3);
                                  }),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              color: const Color.fromARGB(0, 60, 60, 60),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                        color:
                                            const Color.fromARGB(0, 60, 60, 60),
                                        child: Row(
                                          children: [
                                            numberButtonWidget("0", 100,
                                                Colors.white, Colors.blue, () {
                                              addNumber(0);
                                            }),
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                    color: const Color.fromARGB(0, 60, 60, 60),
                                    child: Row(
                                      children: [
                                        numberButtonWidget(".", 100,
                                            Colors.white, Colors.blue, () {}),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            )),
                          ],
                        )),
                    Expanded(
                        child: Container(
                      color: const Color.fromARGB(0, 60, 60, 60),
                      child: Column(
                        children: [
                          numberButtonWidget(
                              "+", 100, Colors.blue, Colors.white, () {
                            setOperator('+');
                          }),
                          numberButtonWidget(
                              "=", 100, Colors.blue, Colors.white, () {
                            calculateResult();
                          }),
                        ],
                      ),
                    )),
                  ],
                ))
          ],
        ));
  }

  Widget numberButtonWidget(String label, double height, Color color,
      Color textColor, Function() onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16), // ปรับขนาดมุมโค้งที่นี่
            ),
            height: height,
            child: Center(
                child: Text(label,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: textColor)))),
      ),
    );
  }
}
