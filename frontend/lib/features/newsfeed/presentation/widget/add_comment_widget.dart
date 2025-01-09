import 'package:flutter/material.dart';
import 'package:travel_connector/core/widget/custom_text_field.dart';

class AddCommentWidget extends StatefulWidget {
  final Function(String content) onAddComment;

  const AddCommentWidget({super.key, required this.onAddComment});

  @override
  State<AddCommentWidget> createState() => _AddCommentWidgetState();
}

class _AddCommentWidgetState extends State<AddCommentWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: _controller,
              hintText: "Добавить комментарий...",
            )
          ),
          SizedBox(width: 8),
          IconButton(
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                widget.onAddComment(_controller.text.trim());
                _controller.clear();
              }
            },
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
