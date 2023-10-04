
import 'package:cybzone_neoline/Common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../cntrl/review_cnrl.dart';
import '../review/reviewModel.dart';



class Reviews extends StatelessWidget {
  final ReviewController _controller = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "4.5",
                              style: TextStyle(fontSize: 48.0),
                            ),
                            TextSpan(
                              text: "/5",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: sclr,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(height: 16.0),
                      Obx(() => Text(
                        "${_controller.reviewList.length} Reviews",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: sclr, // Assuming `sclr` is defined somewhere
                        ),
                      )),
                    ],
                  ),
                  Container(
                    width: 200.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(width: 4.0),
                            Icon(Icons.star, color: Colors.orange),
                            SizedBox(width: 8.0),
                            LinearPercentIndicator(
                              lineHeight: 6.0,
                              // linearStrokeCap: LinearStrokeCap.roundAll,
                              width: MediaQuery.of(context).size.width / 2.8,
                              animation: true,
                              animationDuration: 2500,
                              percent: _controller.ratings[index],
                              progressColor: Colors.orange,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              itemCount: _controller.reviewList.length, // Use the reviewList from the controller
              itemBuilder: (context, index) {
                final review = _controller.reviewList[index]; // Get the review from the list
               return ReviewUI(
                  image: review.image,
                  name: review.name,
                  date: review.date,
                  comment: review.comment,
                  rating: review.rating,
                  onTap: () => _controller.toggleIsMore(),
                  isLess: _controller.isMore.value,
                  onPressed: () => print("More Action $index"),
                );

              },
              separatorBuilder: (context, index) {
                return Divider(
                );
              },
            )
            ,
          ),
        ],
      ),
    );
  }
}


class ReviewUI extends StatelessWidget {
  final String image, name, date, comment;
  final double rating;
  final Function onTap, onPressed;
  final bool isLess;

  const ReviewUI({
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
    required this.onTap,
    required this.isLess,
    required this.onPressed,
  }  ) ;

  @override
  Widget build(BuildContext context) {
    final ReviewController _controller = Get.find(); // Get the controller instance

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200
        ),
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 45.0,
                  width: 45.0,
                  margin: EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: NetworkImage("https://th.bing.com/th/id/OIP.BnA6j7-fw_WIPYdOjfsJjwHaHa?pid=ImgDet&rs=1"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(44.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _controller.toggleIsMore();
                    onPressed(); // Call the provided onPressed function
                  },
                  icon: Icon(Icons.more_vert),
                ),

              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(width: 8.0),
                Text(
                  date,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: onTap as void Function()?, // Cast onTap to a nullable function
              child: isLess
                  ? Text(
                comment,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              )
                  : Text(
                comment,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
