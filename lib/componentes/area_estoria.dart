import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook2/componentes/imagem_perfil.dart';
import 'package:facebook2/dados/dados.dart';
import 'package:facebook2/modelos/modelos.dart';
import 'package:facebook2/uteis/paleta_cores.dart';
import 'package:facebook2/uteis/responsivo.dart';
import 'package:flutter/material.dart';

class AreaStoria extends StatelessWidget {
  final Usuario usuario;
  final List<Estoria> estorias;

  const AreaStoria({Key? key, required this.usuario, required this.estorias})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + estorias.length, //1 + 8 = 9
          itemBuilder: (context, indice) {
            if (indice == 0) {
              Estoria estoriaUsuario = Estoria(
                  usuario: usuarioAtual, urlImagem: usuarioAtual.urlImagem);

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: CartaoEstoria(
                  adicionarEstoria: true,
                  estoria: estoriaUsuario,
                ),
              );
            }

            Estoria estoria = estorias[indice - 1]; //1

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: CartaoEstoria(
                estoria: estoria,
              ),
            );
          }),
    );
  }
}

class CartaoEstoria extends StatelessWidget {
  final Estoria estoria;
  final bool adicionarEstoria;

  const CartaoEstoria(
      {Key? key, required this.estoria, this.adicionarEstoria = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: estoria.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              gradient: PaletaCores.degradeEstoria,
              borderRadius: BorderRadius.circular(12)),
        ),
        Positioned(
            top: 8,
            left: 8,
            child: adicionarEstoria
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.add),
                      iconSize: 30,
                      color: PaletaCores.azulFacebook,
                      onPressed: () {},
                    ),
                  )
                : ImagemPerfil(
                    urlImagem: estoria.usuario.urlImagem,
                    foiVisualizado: estoria.foiVisualizado,
                  )),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              adicionarEstoria ? "Criar Story" : estoria.usuario.nome,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))
      ],
    );
  }
}
