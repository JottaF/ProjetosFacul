import 'package:atividade_imc/screens/result_screen.dart';
import 'package:atividade_imc/widgets/input_widget.dart';
import 'package:atividade_imc/widgets/button_widget.dart';
import 'package:atividade_imc/widgets/type_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double peso = 0;
  double altura = 0;

  var typeCardWidget = TypeCardWidget();

  double calcularImc(double peso, double altura) {
    var alt = (altura * altura);
    var imc = peso / (alt < 1 ? alt + 1 : alt);
    return imc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Calculadora IMC',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFf2f2f2),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: typeCardWidget,
              ),
              Expanded(
                child: Column(
                  children: [
                    InputWidget(
                      label: 'Digite seu peso em Kg',
                      onChange: (value) {
                        setState(() {
                          value != '' ? peso = double.parse(value) : peso = 0;
                        });
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InputWidget(
                      label: 'Digite sua altura em cm',
                      onChange: (value) {
                        setState(() {
                          value != ''
                              ? altura = (double.parse(value) / 100)
                              : altura = 0;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: ButtonWidget(
                  label: 'Calcular',
                  onTap: () {
                    print('$peso $altura ${typeCardWidget.manIsSelected}');
                    if (altura != 0 &&
                        peso != 0 &&
                        typeCardWidget.getSelected() != 'null')
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => ResultScreen(
                              imc: calcularImc(peso, altura),
                              tipo: typeCardWidget.getSelected()),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
