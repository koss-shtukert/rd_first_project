import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_event.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(const RatingState()) {
    on<RatingSelected>(_onRatingSelected);
    on<RatingCommentChanged>(_onCommentChanged);
    on<RatingSubmitted>(_onSubmitted);
    on<RatingReset>(_onReset);
    on<RatingResubmit>(_onResubmit);
  }

  void _onRatingSelected(RatingSelected event, Emitter<RatingState> emit) {
    emit(state.copyWith(rating: event.rating));
  }

  void _onCommentChanged(
    RatingCommentChanged event,
    Emitter<RatingState> emit,
  ) {
    emit(state.copyWith(comment: event.comment));
  }

  Future<void> _onSubmitted(
    RatingSubmitted event,
    Emitter<RatingState> emit,
  ) async {
    if (state.rating == 0) return;
    emit(state.copyWith(status: RatingStatus.loading));
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(status: RatingStatus.success));
  }

  void _onReset(RatingReset event, Emitter<RatingState> emit) {
    emit(const RatingState());
  }

  void _onResubmit(RatingResubmit event, Emitter<RatingState> emit) {
    emit(const RatingState());
  }
}
