import 'package:get/get.dart';

import '../review/reviewModel.dart';

class ReviewController extends GetxController {
  var isMore = false.obs;
  var ratings = [0.1, 0.3, 0.5, 0.7, 0.9].obs;
  var reviewList = <ReviewModal>[].obs;

  toggleIsMore() {
    isMore.toggle();
  }

    void loadReviews() {
      final tempList = [
    ReviewModal(
      image: "https://cdn.iconscout.com/icon/free/png-512/avatar-370-456322.png",
      name: "John Travolta",
      rating: 3.5,
      date: "01 Jan 2021",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "https://banner2.kisspng.com/20180312/dhw/kisspng-avatar-icon-3d-character-icon-vector-material-5aa6f78e511dc5.4677270515208917903323.jpg",
      name: "Scarlett Johansson",
      rating: 2.5,
      date: "21 Feb 2021",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user1.jpg",
      name: "Jennifer Lawrence",
      rating: 4.5,
      date: "17 Mar 2021",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user11.jpg",
      name: "Michael Jordan",
      rating: 1.5,
      date: "12 Apr 2021",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    ),
    ReviewModal(
      image: "assets/images/user2.jpg",
      name: "Nicole Kidman",
      rating: 2.0,
      date: "28 May 2021",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user10.jpg",
      name: "James Franco",
      rating: 4.0,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user3.jpg",
      name: "Margot Robbie",
      rating: 1.0,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user9.jpg",
      name: "Nicolas Cage",
      rating: 3.0,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user4.jpg",
      name: "Emma Stone",
      rating: 5.0,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user8.jpg",
      name: "Johnny Depp",
      rating: 3.5,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user5.jpg",
      name: "Natalie Portman",
      rating: 3.5,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user7.jpg",
      name: "Anne Hathaway",
      rating: 3.5,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),
    ReviewModal(
      image: "assets/images/user6.jpg",
      name: "Charlize Theron",
      rating: 3.5,
      date: "14 Nov 2020",
      comment:
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
    ),

      ];
      reviewList.assignAll(tempList);
    }

    @override
    void onInit() {
      super.onInit();
      loadReviews();
    }

}

