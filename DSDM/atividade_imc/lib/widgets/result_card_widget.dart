import 'package:atividade_imc/core/app_results.dart';
import 'package:atividade_imc/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultCardWidget extends StatelessWidget {
  final double imc;
  final String tipo;

  const ResultCardWidget({
    Key? key,
    required this.imc,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResultModel result = Result().getResult(imc, tipo);

    return Container(
      height: 175,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFF2F2F2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 18,
              offset: Offset(0, 4),
              spreadRadius: 2,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage(result.imagem),
            height: 130,
          ),
          Text(
            'Seu IMC: $imc',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
