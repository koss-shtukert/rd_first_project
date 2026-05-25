import 'package:flutter/foundation.dart';

enum RatingStatus { initial, loading, success, error }

@immutable
class RatingState {
  const RatingState({
    this.status = RatingStatus.initial,
    this.rating = 0,
    this.comment = '',
  });

  final RatingStatus status;
  final int rating;
  final String comment;

  RatingState copyWith({RatingStatus? status, int? rating, String? comment}) {
    return RatingState(
      status: status ?? this.status,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }
}
