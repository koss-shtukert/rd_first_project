sealed class RatingEvent {}

class RatingSelected extends RatingEvent {
  RatingSelected(this.rating);
  final int rating;
}

class RatingCommentChanged extends RatingEvent {
  RatingCommentChanged(this.comment);
  final String comment;
}

class RatingSubmitted extends RatingEvent {}

class RatingResubmit extends RatingEvent {}

class RatingReset extends RatingEvent {}
