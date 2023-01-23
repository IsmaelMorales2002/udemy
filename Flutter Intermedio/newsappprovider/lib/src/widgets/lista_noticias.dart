import 'package:flutter/material.dart';
import 'package:newsappprovider/src/models/news_models.dart';
import 'package:newsappprovider/src/theme/tema.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(
    this.noticias
  );
    

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: noticias.length,
    itemBuilder: ( _ , int index){
      return _Noticia(noticia: noticias[index], index: index);
    }
    );
  }
}

class _Noticia extends StatelessWidget {
  const _Noticia({
    required this.noticia, 
    required this.index});

  final Article noticia;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          _TarjetaTopBar(noticia: noticia,index: index,),

          _TarejtaTitulo(noticia),

          _TarjetaImagen(noticia),

          _TarjetaBody(noticia),
      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;
  const _TarjetaBody(this.noticia);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description != null?noticia.description : ''),
    );
  }
}


class _TarjetaImagen extends StatelessWidget {
  const _TarjetaImagen(this.noticia);

  final Article noticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null)
          ? FadeInImage(
            placeholder: AssetImage('assets/img/giphy.gif'),
            image: NetworkImage(noticia.urlToImage),
            )
          : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
  }
}

class _TarejtaTitulo extends StatelessWidget {

  final Article noticia;
  const _TarejtaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(noticia.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
    );
  }
}


class _TarjetaTopBar extends StatelessWidget {
  const _TarjetaTopBar({
    required this.noticia, 
    required this.index,
  });

  final Article noticia;
  final int index;
   
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index+1}.',style: TextStyle(color: miTema.accentColor),)
        ],
      ),
    );
  }
}