import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards()
            ]),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.amber,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text('HOLA', style: TextStyle(fontSize: 16),)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
 
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),

          SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('Original Title', style: textTheme.titleSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),

              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text('movieAverage', style: textTheme.labelSmall,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}


class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Amet consectetur eiusmod sunt veniam eu ipsum ipsum. Laborum ipsum sit consequat nulla nostrud dolor veniam veniam culpa sit sunt laborum do mollit. Dolore do aliqua ipsum nulla sunt amet consectetur nulla qui consequat.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.bodyMedium
      ),
    );
  }
}