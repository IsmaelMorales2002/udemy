import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Buscar Película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: () => query = '', 
        icon: const Icon(Icons.clear),
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton( 
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      }, 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResult');
  }

  Widget _emptyContainer(){
    return Container(
      child: const Center(
      child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 130,),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
    return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context,listen: false);

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: ( _, AsyncSnapshot<List<Movie>> snapshot){
        if( !snapshot.hasData) return _emptyContainer();
        
        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: ( _,int index) => _MovieItem(movie: movies[index],),
          );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem({Key? key, 
  required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (){
        Navigator.pushNamed(context, 'details',arguments: movie);
      },
    );
  }
}