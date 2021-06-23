import 'package:cis2203_final_exam/models/review.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String imageUrl;
  final String filmTitle;
  final Review? review;

  ReviewCard({
    required this.imageUrl,
    required this.filmTitle,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: new EdgeInsets.all(5),
      margin: new EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )),
          Expanded(
            flex: 7,
            child: Container(
              margin: new EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              filmTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.red[500],
                        ),
                        Text(
                          '${review!.score.toString()}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '"${review!.title}" \n',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      '${review!.description} \n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
