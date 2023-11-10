import 'package:facebook2/componentes/botao_circulo.dart';
import 'package:facebook2/componentes/botao_imagem_perfl.dart';
import 'package:facebook2/componentes/navegacao_abas.dart';
import 'package:facebook2/modelos/modelos.dart';
import 'package:facebook2/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NavegacaoAbasDesktop extends StatelessWidget {
  final Usuario usuario;
  final List<IconData> icones;
  final int indiceAbaSelecionadas;
  final Function(int) onTap;

  const NavegacaoAbasDesktop({
    super.key,
    required this.usuario,
    required this.icones,
    required this.indiceAbaSelecionadas,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 4,
        )
      ]),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "facebook",
            style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: -1.2),
          )),
          Expanded(
            child: NavegacaoAbas(
              icones: icones,
              indiceAbaSelecionadas: indiceAbaSelecionadas,
              onTap: onTap,
              indicalEmbaixo: true,
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BotaoImagemPerfil(
                usuario: usuario,
                onTap: (){},               
              ),
              BotaoCirculo(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: (){},
              ),
              BotaoCirculo(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: (){},
              )
            ],
          )),
        ],
      ),
    );
  }
}
