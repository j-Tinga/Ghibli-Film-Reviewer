import 'package:cis2203_final_exam/database/ghibi_database.dart';
import 'package:cis2203_final_exam/mixins/ValidationMixin.dart';
import 'package:cis2203_final_exam/models/review.dart';
import 'package:cis2203_final_exam/widgets/CustomTextFormField.dart';
import 'package:cis2203_final_exam/widgets/LargeTextFormField.dart';
import 'package:cis2203_final_exam/widgets/NumbersOnlyTextFormField.dart';
import 'package:cis2203_final_exam/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';

class WriteReviewPage extends StatefulWidget {
  static const String routeName = "WriteReviewPage";

  final Map film;
  final int filmIndex;
  final String filmPoster;
  const WriteReviewPage(
      {Key? key,
      required this.film,
      required this.filmIndex,
      required this.filmPoster})
      : super(key: key);

  @override
  _WriteReviewPageState createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage>
    with ValidationMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController scoreTextController = TextEditingController();
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Review ${widget.film["title"]}"),
        ),
        body: ListView(
          children: [
            Image.network(widget.filmPoster,
                height: MediaQuery.of(context).size.height / 2.3),
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            "${widget.film["title"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                            ),
                          ),
                        ),
                        Text(
                          "${widget.film["original_title"]} / ${widget.film["original_title_romanised"]}",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red[500],
                  ),
                  Text(
                    "${widget.film["rt_score"]}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    NumbersOnlyTextFormField(
                      labelText: "Rating",
                      hintText: "0-100%",
                      iconData: Icons.star,
                      textEditingController: scoreTextController,
                      textInputType: TextInputType.emailAddress,
                      validation: validateRating,
                    ),
                    SizedBox(height: 20.0),
                    CustomTextFormField(
                      labelText: "Review Title",
                      hintText: "Summarize your thoughts",
                      iconData: Icons.title,
                      textEditingController: titleTextController,
                      textInputType: TextInputType.emailAddress,
                      validation: validateTitle,
                    ),
                    SizedBox(height: 20.0),
                    LargeTextFormField(
                      labelText: "Review Description",
                      hintText: "Write your thoughts on the film",
                      iconData: Icons.description,
                      textEditingController: descriptionTextController,
                      textInputType: TextInputType.emailAddress,
                      validation: validateDescription,
                    ),
                    SizedBox(height: 20.0),
                    PrimaryButton(
                        text: "Submit Review",
                        iconData: Icons.reviews,
                        onPress: () {
                          addReview(context);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addReview(context) async {
    var snackBarText;
    if (formKey.currentState!.validate()) {
      if (await GhibiDatabase.instance.readReview(widget.filmIndex) != null) {
        snackBarText = "Film already has a review";
      } else {
        final newReview = Review(
            score: int.parse(scoreTextController.text),
            filmIndex: widget.filmIndex,
            title: titleTextController.text,
            description: descriptionTextController.text);
        await GhibiDatabase.instance.createReview(newReview);
        snackBarText = "Film review added";
      }

      final snackBar = SnackBar(
        content: Text(snackBarText),
        duration: Duration(seconds: 1, milliseconds: 500),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
