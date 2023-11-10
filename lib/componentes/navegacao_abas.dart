import 'package:facebook2/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  final List<IconData> icones;
  final int indiceAbaSelecionadas;
  final Function(int) onTap;
  final bool indicalEmbaixo;
  const NavegacaoAbas({
    super.key,
    required this.icones,
    required this.indiceAbaSelecionadas,
    required this.onTap,
    required this.indicalEmbaixo
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
            border: indicalEmbaixo 
              ? Border(
                bottom: BorderSide(color: PaletaCores.azulFacebook, width: 3)
                )
              : Border(
                top: BorderSide(color: PaletaCores.azulFacebook, width: 3))
                ),
        tabs: icones
            .asMap()
            .map((indice, icone) {
              return MapEntry(
                  indice,
                  Tab(
                    icon: Icon(icone,
                        color: indiceAbaSelecionadas == indice
                            ? PaletaCores.azulFacebook
                            : Colors.black,
                        size: 30),
                  ));
            } // fecahs tabs
                )
            .values
            .toList() // fecha tabs
        );
  }
}
