import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_bloc.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_event.dart';
import 'package:rd_first_project/lesson_19/rating_bloc/rating_state.dart';

class CommentField extends StatefulWidget {
  const CommentField({super.key});

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: context.read<RatingBloc>().state.comment,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingBloc, RatingState>(
      listenWhen: (prev, curr) =>
          prev.comment.isNotEmpty && curr.comment.isEmpty,
      listener: (context, state) {
        _controller.clear();
      },
      child: BlocBuilder<RatingBloc, RatingState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) {
          return TextField(
            controller: _controller,
            readOnly: state.status == RatingStatus.success,
            maxLines: 3,
            style: const TextStyle(
              color: Color(0xFF1B3D70),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: state.status == RatingStatus.success
                  ? null
                  : 'Залиште коментар',
              hintStyle: const TextStyle(
                color: Color(0xFF1B3D70),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: const Color(0xFFF4FAFF),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (context.read<RatingBloc>().state.status !=
                  RatingStatus.success) {
                context.read<RatingBloc>().add(RatingCommentChanged(value));
              }
            },
          );
        },
      ),
    );
  }
}
