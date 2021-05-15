import 'package:atividade_imc/core/app_images.dart';
import 'package:atividade_imc/models/result_model.dart';

class Result {
  ResultModel getResult(double imc, String tipo) {
    if (imc <= 18.5 && tipo == 'homem') {
      return ResultModel(
        imc: imc,
        faixa: '18,5 ou menos',
        titulo: 'Abaixo do peso',
        descricao:
            'Procure um médico. Algumas pessoas têm um baixo peso por características do seu organismo e tudo bem. Outras podem estar enfrentando problemas, como a desnutrição. É preciso saber qual é o caso.',
        imagem: AppImages.h1,
      );
    } else if (imc > 18.5 && imc <= 25 && tipo == 'homem') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 18,6 e 24,9',
        titulo: 'Normal',
        descricao:
            'Que bom que você está com o peso normal! E o melhor jeito de continuar assim é mantendo um estilo de vida ativo e uma alimentação equilibrada.',
        imagem: AppImages.h2,
      );
    } else if (imc >= 25 && imc < 30 && tipo == 'homem') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 25,0 e 29,9',
        titulo: 'Sobrepeso',
        descricao:
            'Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já apresentam doenças associadas, como diabetes e hipertensão. Importante rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar na faixa da obesidade pra valer.',
        imagem: AppImages.h3,
      );
    } else if (imc >= 30 && imc < 35 && tipo == 'homem') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 30,0 e 34,9',
        titulo: 'Obesidade grau I',
        descricao:
            'Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! Cuide de sua alimentação. Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista.',
        imagem: AppImages.h4,
      );
    } else if (imc >= 35 && imc < 40 && tipo == 'homem') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 35,0 e 39,9',
        titulo: 'Obesidade grau II',
        descricao:
            'Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde.',
        imagem: AppImages.h5,
      );
    } else if (imc > 18.5 && imc < 20 && tipo == 'homem') {
      return ResultModel(
        imc: imc,
        faixa: 'Acima de 40,0',
        titulo: 'Obesidade grau III',
        descricao:
            'Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.',
        imagem: AppImages.h6,
      );
    } else if (imc <= 18.5 && tipo == 'mulher') {
      return ResultModel(
        imc: imc,
        faixa: '18,5 ou menos',
        titulo: 'Abaixo do peso',
        descricao:
            'Procure um médico. Algumas pessoas têm um baixo peso por características do seu organismo e tudo bem. Outras podem estar enfrentando problemas, como a desnutrição. É preciso saber qual é o caso.',
        imagem: AppImages.m1,
      );
    } else if (imc > 18.5 && imc <= 25 && tipo == 'mulher') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 18,6 e 24,9',
        titulo: 'Normal',
        descricao:
            'Que bom que você está com o peso normal! E o melhor jeito de continuar assim é mantendo um estilo de vida ativo e uma alimentação equilibrada.',
        imagem: AppImages.m2,
      );
    } else if (imc >= 25 && imc < 30 && tipo == 'mulher') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 25,0 e 29,9',
        titulo: 'Sobrepeso',
        descricao:
            'Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já apresentam doenças associadas, como diabetes e hipertensão. Importante rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar na faixa da obesidade pra valer.',
        imagem: AppImages.m3,
      );
    } else if (imc >= 30 && imc < 35 && tipo == 'mulher') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 30,0 e 34,9',
        titulo: 'Obesidade grau I',
        descricao:
            'Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! Cuide de sua alimentação. Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista.',
        imagem: AppImages.m4,
      );
    } else if (imc >= 35 && imc < 40 && tipo == 'mulher') {
      return ResultModel(
        imc: imc,
        faixa: 'Entre 35,0 e 39,9',
        titulo: 'Obesidade grau II',
        descricao:
            'Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde.',
        imagem: AppImages.m5,
      );
    } else {
      return ResultModel(
        imc: imc,
        faixa: 'Acima de 40,0',
        titulo: 'Obesidade grau III',
        descricao:
            'Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.',
        imagem: AppImages.m6,
      );
    }
  }
}
