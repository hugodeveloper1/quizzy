import 'package:app_web/domain/models/question_entity_model.dart';
import 'package:app_web/ui/pages/questions/widgets/questions/item_card.dart';
import 'package:app_web/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ItemQuestion extends StatefulWidget {
  const ItemQuestion({
    super.key,
    this.title = '',
    required this.selectedAnswer,
    this.questions,
    this.indexQuestion = 1,
    this.totalQuestions = 1,
    this.next,
    this.isFinish = false,
    this.onFinish,
    required this.paddingBlocLeft,
  });

  final String title;
  final QuestionEntityModel? questions;
  final Function(bool isSelected) selectedAnswer;
  final int indexQuestion;
  final int totalQuestions;
  final VoidCallback? next;
  final bool isFinish;
  final VoidCallback? onFinish;
  final double paddingBlocLeft;

  @override
  State<ItemQuestion> createState() => _ItemQuestionState();
}

class _ItemQuestionState extends State<ItemQuestion>
    with TickerProviderStateMixin {
  String correctAnswer = '';
  String userAnswer = '';
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..addListener(() {
        setState(() {});
      });
    animationController.addStatusListener(_statusListener);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _statusListener(status) {
    if (status == AnimationStatus.completed) {
      animationController.stop();
      correctAnswer = widget.questions?.answerId ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ItemCard(
      marginHorizontal: widget.paddingBlocLeft,
      controller: animationController,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyLarge,
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: [
                Text(
                  'Tiempo restante',
                  style: textTheme.bodySmall,
                ),
                const SizedBox(width: 8),
                Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.red,
                  ),
                  child: Text(
                    '${animationController.duration!.inSeconds - (animationController.value * animationController.duration!.inSeconds).toInt()} seg.',
                    style: textTheme.bodySmall!.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: [
        ListTile(
          title: Text(
            '${widget.indexQuestion}. ${widget.questions?.question ?? 'N/A'}',
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...(widget.questions?.answers ?? []).map(
          (e) {
            final selected = userAnswer == e.id || correctAnswer == e.id;

            return ListTile(
              title: Text(
                e.answer,
                style: textTheme.bodyMedium,
              ),
              tileColor: selected ? color(e.id) : null,
              trailing: selected ? icon(e.id) : null,
              onTap: () {
                if (userAnswer.isEmpty) {
                  userAnswer = e.id;
                  correctAnswer = widget.questions?.answerId ?? '';
                  animationController.stop();
                  widget.selectedAnswer(e.id == widget.questions?.answerId);
                  setState(() {});
                }
              },
            );
          },
        ),
      ],
      bottom: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '''${widget.indexQuestion} '''
              '''de'''
              ''' ${widget.totalQuestions} '''
              '''preguntas''',
              style: textTheme.bodyMedium,
            ),
            Row(
              children: [
                (animationController.isCompleted || correctAnswer.isNotEmpty) &&
                        widget.next != null
                    ? CustomButton(
                        value: 'Siguiente',
                        onTap: widget.next?.call,
                      )
                    : const SizedBox.shrink(),
                widget.isFinish
                    ? CustomButton(
                        value: 'Terminar',
                        onTap: widget.onFinish?.call,
                        backgroundColor: Colors.red.withOpacity(0.8),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget icon(String value) {
    if (value == widget.questions?.answerId) {
      return Icon(
        Icons.check_circle_outline_outlined,
        color: Colors.yellow.shade600,
      );
    } else {
      return Icon(
        Icons.cancel,
        color: Colors.red.shade600,
      );
    }
  }

  Color color(String value) {
    if (value == widget.questions?.answerId) {
      return Colors.yellow.shade200;
    } else {
      return Colors.red.shade200;
    }
  }
}
