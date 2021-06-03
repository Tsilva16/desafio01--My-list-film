import 'package:filmslist/movie_class.dart';
import 'package:filmslist/movie_components.dart';
import 'package:filmslist/movie_controller.dart';
import 'package:flutter/material.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = MoviesController();
  int selectedIndex = 0;
  String title;
  Future<Movies> future;

  @override
  void initState() {
    super.initState();
    controller.getNowPlayingMovies();
    future = controller.nowPlayingMovies;
    title = "Lançamentos";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850], title: Center(child: Text(title))),
      backgroundColor: Colors.grey[900],
      body: FutureBuilder<Movies>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done){
            return Center(child: CircularProgressIndicator());
          }

          if(snapshot.hasData){
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.results.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            MovieInfoComponent(
                              snapshot.data.results[index].title,
                              snapshot.data.results[index].releaseDate,
                              snapshot.data.results[index].voteAverage
                                  .toString()),
                            PosterComponent(snapshot
                                .data.results[index].posterPath),
                          ]),
                        );
                    }))
                ],
              ),
            );
          } else if(snapshot.hasData) {
            return AlertDialog(
              title: Text("Ocorreu um erro"),
              content: SingleChildScrollView(
                child: ListBody(children: <Widget>[
                  Text(snapshot.error,
                      style: TextStyle(fontSize: 18, color: Colors.red))
                ]),
              ),
              actions: <Widget>[
                TextButton(onPressed: () => setState((){
                  controller.getNowPlayingMovies();
                }),
                child: Text("Tente novamente"))
              ],
            );
          }
          return Container();
        }),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play_rounded), label: "Em cartaz"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: "Em breve"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate_rounded), label: "Bem avaliados"),  
        ],
        backgroundColor: Colors.grey[850],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.purple[300],
        onTap: onTapMovies,
      ),
    ));
  }


  void onTapMovies(int index) {
    switch (index) {
      case 0:
      {
        controller.getNowPlayingMovies();
        setState(() {
          selectedIndex = index;
          future = controller.nowPlayingMovies;
          title = "Lançamentos";
        });
      }
      break;

    case 1 :
    {
      controller.getUpComingMovies();
      setState(() {
        selectedIndex = index;
        future = controller.upcomingMovies;
        title = "Em breve";
      });
    }
      break;

    case 2:
    {
      controller.getTopRatedMovies();
      setState(() {
        selectedIndex = index;
        future = controller.getTopRatedMovies();
        title = "Bem avaliados";
      });
    }
      break;
    }
  }
}