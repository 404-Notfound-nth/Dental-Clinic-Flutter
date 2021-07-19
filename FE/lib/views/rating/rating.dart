import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  final int maximumRating;
  final Function(int) onRatingSelected;

  Rating(this.onRatingSelected, [this.maximumRating = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(Icons.star, size: 30, color: Colors.orange);
    } else {
      return Icon(Icons.star_border_outlined);
    }
  }

  RatingBar _cardRating(double totalRating) {
    {
      return RatingBar.builder(
        initialRating: totalRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemSize: 20,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (value) {},
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.maximumRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });

          this.widget.onRatingSelected(_currentRating);
        },
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: stars,
        ),
        // FlatButton(
        //   child: Text("Clear", style: TextStyle(color: Colors.blue)),
        //   onPressed: () {
        //     setState(() {
        //       _currentRating = 0;
        //     });
        //     this.widget.onRatingSelected(_currentRating);
        //   },
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
