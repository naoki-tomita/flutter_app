import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void InputCallback(String string);

class TodoInputComponent extends StatefulWidget {
  TodoInputComponent({ this.onInput }) : super();
  final InputCallback onInput;
  @override
  State<StatefulWidget> createState() {
    return _TodoInputComponentState();
  }
}


class _TodoInputComponentState extends State<TodoInputComponent> {
  TextEditingController _controller = TextEditingController(text: "");
  _TodoInputComponentState();

  @override
  void initState() {
    super.initState();
    _controller.clear();
  }

  onInput() {
    if (_controller.text != "") {
      widget.onInput(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 3,
        child: TextField(
          controller: _controller,
          onEditingComplete: () => onInput(),
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(left: 4),
          child: RaisedButton(
            child: Text("Create"),
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: () => onInput(),
          ),
        ),
      ),
    ],);
  }
}
