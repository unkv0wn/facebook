import 'package:facebook2/componentes/area_criar_postagem.dart';
import 'package:facebook2/componentes/area_estoria.dart';
import 'package:facebook2/componentes/botao_circulo.dart';
import 'package:facebook2/componentes/cartao_postagem.dart';
import 'package:facebook2/componentes/lista_contatos.dart';
import 'package:facebook2/componentes/lista_opcoes.dart';
import 'package:facebook2/dados/dados.dart';
import 'package:facebook2/modelos/modelos.dart';
import 'package:facebook2/uteis/paleta_cores.dart';
import 'package:facebook2/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile(
            scrollController: _scrollController,
          ),
          tablet: HomeMobile(
            scrollController: _scrollController,
          ),
          desktop: HomeDesktop(
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          // expandedHeight: 250,
          floating: true,
          centerTitle: false,
          title: Text(
            "facebook",
            style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2),
          ),
          actions: [
            BotaoCirculo(
              icone: Icons.search,
              iconeTamanho: 30,
              onPressed: () {},
            ),
            BotaoCirculo(
              icone: LineIcons.facebookMessenger,
              iconeTamanho: 30,
              onPressed: () {},
            )
          ],
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStoria(
              usuario: usuarioAtual,
              estorias: estorias,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, indice) {
          Postagem postagem = postagens[indice];
          return CartaoPostagem(postagem: postagem);
        }, childCount: postagens.length))
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: ListaOpcoes(usuario: usuarioAtual),
        ),
      ),
      Spacer(),
      Flexible(
          flex: 6,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              /*   SliverAppBar(
            backgroundColor: Colors.white,
            // expandedHeight: 250,
            floating: true,
            centerTitle: false,
            title: Text(
              "facebook-d",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2
              ),
            ),
            actions: [
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
          ),*/
              //area Story
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: AreaStoria(
                    usuario: usuarioAtual,
                    estorias: estorias,
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: AreaCriarPostagem(
                  usuario: usuarioAtual,
                ),
              ),

              SliverList(
                  delegate: SliverChildBuilderDelegate((context, indice) {
                Postagem postagem = postagens[indice];
                return CartaoPostagem(postagem: postagem);
              }, childCount: postagens.length))
            ],
          )),
      Spacer(),
      Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: ListaContatos(usuarios: usuariosOnline),
          )),
    ]);
  }
}
