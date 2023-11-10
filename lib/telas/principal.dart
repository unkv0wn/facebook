import 'package:facebook2/componentes/navagecao_abas_desktop.dart';
import 'package:facebook2/componentes/navegacao_abas.dart';
import 'package:facebook2/dados/dados.dart';
import 'package:facebook2/telas/home.dart';
import 'package:facebook2/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _telas = [
    Home(),
    Scaffold(
      backgroundColor: Colors.green,
    ),
    Scaffold(
      backgroundColor: Colors.yellow,
    ),
    Scaffold(
      backgroundColor: Colors.purple,
    ),
    Scaffold(
      backgroundColor: Colors.black54,
    ),
    Scaffold(
      backgroundColor: Colors.orange,
    ),
  ];

  int _indicieAbaSelecionada = 0;

  List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];
  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    Size tamanho = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
              preferredSize: Size(tamanho.width, 100),
               child: NavegacaoAbasDesktop(
                usuario: usuarioAtual,
                icones: _icones,
                indiceAbaSelecionadas: _indicieAbaSelecionada,
                onTap: (indice) {
                  setState(() {
                    _indicieAbaSelecionada = indice;
                  });
                },
               )
               )
            : null,
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavegacaoAbas(
                icones: _icones,
                indiceAbaSelecionadas: _indicieAbaSelecionada,
                indicalEmbaixo: false,
                onTap: (indice) {
                  setState(() {
                    _indicieAbaSelecionada = indice;
                  });
                
                },
              ),
      ),
    );
  }
}
