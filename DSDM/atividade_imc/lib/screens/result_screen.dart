import 'package:atividade_imc/core/app_results.dart';
import 'package:atividade_imc/models/result_model.dart';
import 'package:atividade_imc/widgets/result_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final double imc;
  final String tipo;

  const ResultScreen({
    Key? key,
    required this.imc,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResultModel result = Result().getResult(imc, tipo);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Resultado',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: ResultCardWidget(
                imc: imc.roundToDouble(),
                tipo: tipo,
              )),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.faixa,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      result.titulo,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: Text(
                  result.descricao,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
