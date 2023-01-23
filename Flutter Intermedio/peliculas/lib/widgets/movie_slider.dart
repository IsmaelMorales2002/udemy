import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSliderScreen extends StatefulWidget {
   
  final List<Movie> movies;
  final String? title;
  final Function onNetxPage;
  const MovieSliderScreen({
    Key? key, 
    required this.movies, 
    required this.onNetxPage,
    this.title, 
    }) : super(key: key);

  @override
  State<MovieSliderScreen> createState() => _MovieSliderScreenState();
}

class _MovieSliderScreenState extends State<MovieSliderScreen> {


  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        widget.onNetxPage();
      }
    });
  }
  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text( widget.title! ,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),

          const SizedBox(height: 5,),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _, int index) => _MoviePoster(movies:widget.movies[index],)
            ),
          ),

        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movies;

  const _MoviePoster({Key? key, 
   required this.movies
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 130,
       height: 190,
       margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
       child: Column(
         children:  [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: movies),
            child: Hero(
              tag: movies.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image:  NetworkImage(movies.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 5,),

          Flexible(
            child: Text(
            movies.title,
            overflow: TextOverflow.ellipsis,                                      
            textAlign: TextAlign.center,
            ),
          ),

         ],
       ),
     );
  }
}