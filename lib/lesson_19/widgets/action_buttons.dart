import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_state.dart';
import 'package:rd_first_project/lesson_19/widgets/reset_button.dart';
import 'package:rd_first_project/lesson_19/widgets/resubmit_button.dart';
import 'package:rd_first_project/lesson_19/widgets/submit_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == RatingStatus.success) {
          return const ResubmitButton();
        }
        return Row(
          children: [
            Expanded(
              child: SubmitButton(
                isLoading: state.status == RatingStatus.loading,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(child: ResetButton()),
          ],
        );
      },
    );
  }
}
