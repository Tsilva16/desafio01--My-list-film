import 'package:flutter/material.dart';


class MovieInfoComponent extends StatelessWidget {
  final String movieTitle;
  final String movieDate;
  final String movieVoteAverage;

  MovieInfoComponent(this.movieTitle, this.movieDate, this.movieVoteAverage,
      {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(2.0, 1.0),
              )
            ],
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(10), 
            ),
            height: 100,
            child: Padding(
              padding: EdgeInsets.only(left:100, right:10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 10),
                  MovieInfoRowComponent(
                    movieTitle,
                  Icon(
                    Icons.local_play_rounded,
                    color: Colors.white,
                    size: 20,
                  )),
                  MovieInfoRowComponent(
                    movieDate,
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 20,
                    )),
                  MovieInfoRowComponent(
                    movieVoteAverage,
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.white,
                      size: 20,
                    )),
                  Container(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieInfoRowComponent extends StatelessWidget {
  final String movieText;
  final Icon textIcon;

  MovieInfoRowComponent(this.movieText,this.textIcon, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(   
      children: [
        textIcon,
        Container(
          width: 10,
        ),
        Expanded(child: Text(
          movieText,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
          ),
        ),
      ],  
    );
  }
}


class PosterComponent extends StatelessWidget {
  final String posterUrl;

  PosterComponent(this.posterUrl,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 1.0,
            offset: new Offset(1, 0),
             ),
        ], borderRadius: BorderRadius.circular(10)),
        child: FractionallySizedBox(
          widthFactor: 0.3,
          child: ClipRRect(
            child: 
                Image.network('https://image.tmdb.org/t/p/w300/' + posterUrl),
              borderRadius: BorderRadius.circular(10),
                ), 
        )
    );    
  }
}