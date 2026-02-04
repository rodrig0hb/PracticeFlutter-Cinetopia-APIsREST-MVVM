import 'package:cinetopia/app/viewmodels/search_movies_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:cinetopia/ui/screens/movie_details.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {

  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  final TextEditingController _textController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getMovie(_textController.text), // legal como uma classe de serviço é usada na build da tela, e a tela intanciada numa classe extendida por statewidgets.
      builder: (context, snapshot) => snapshot.hasData ? CustomScrollView(
        slivers:<Widget>[
          SliverToBoxAdapter(child: Image.asset('assets/popular.png', width: 120, height: 120)),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(bottom:40.0),
            child: Text('Filmes Populares', 
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFFEBEBEB)), 
            textAlign: TextAlign.center),
          ),
          ),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(bottom:32.0),
            child: TextField(
              controller: _textController,
              onEditingComplete: () {
                //viewmodel.getMovie(_textController.text); chamaria a função de busca de filmes com o texto do input, mas já tá chamando lá em cima no futurebuilder, usando if se tiver texto no input.
                FocusScope.of(context).unfocus(); // fecha o teclado após completar a edição
                setState(() {}); // atualiza a tela para mostrar os resultados da busca
              },
              decoration: InputDecoration(
                hintText: 'Buscar filmes',
                //No slivers outlineinputborder é a borda que demarca o input, retangular por padrão, mas recebe radius circular.
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
          ),
          SliverList.builder(itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder:(context) => MovieDetails(movie: viewmodel.moviesList[index]),)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: MovieCard(movie: viewmodel.moviesList[index],),
            ),
          ),
          itemCount: viewmodel.moviesList.length,
          ),
        ],
      ) : Center(child: CircularProgressIndicator(),) // mostra um indicador de carregamento enquanto os dados estão sendo buscados
    );
  }  
}