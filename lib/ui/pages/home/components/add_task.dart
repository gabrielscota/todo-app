import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  final Function handleAddingTask;
  AddTask({
    Key key,
    @required this.handleAddingTask,
  }) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskController = TextEditingController();
  final focusNode = FocusNode();

  bool isAddingTask = false;
  bool showNoteButton = false;

  @override
  void initState() {
    focusNode.addListener(() {
      focusNode.hasFocus ? handleAddingTask(true) : handleAddingTask(false);
    });
    super.initState();
  }

  void handleAddingTask(bool value) async {
    isAddingTask = value;
    widget.handleAddingTask(value);
    if (value == false) {
      await Future.delayed(Duration(milliseconds: 800));
    }
    showNoteButton = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 12.0, top: 24.0, right: 12.0, bottom: 24.0),
      decoration: BoxDecoration(
        gradient: isAddingTask
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(252, 252, 252, 0.7),
                  Color.fromRGBO(252, 252, 252, 1.0),
                ],
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    width: isAddingTask
                        ? MediaQuery.of(context).size.width - 24
                        : 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: Color.fromRGBO(58, 58, 58, 0.05),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        hintText: 'Adicione uma nova tarefa..',
                      ),
                      maxLines: isAddingTask ? 3 : 1,
                      minLines: 1,
                      textInputAction: TextInputAction.done,
                      focusNode: focusNode,
                      controller: taskController,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Color.fromRGBO(58, 58, 58, 1.0),
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(58, 58, 58, 1.0),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  isAddingTask
                      ? Positioned(
                          right: 12,
                          top: 8,
                          child: Row(
                            children: [
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity: isAddingTask ? 1.0 : 0.0,
                                curve: Curves.easeInOut,
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(252, 252, 252, 1.0),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Icon(Icons.calendar_today, size: 16),
                                ),
                              ),
                              SizedBox(width: 4),
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 300),
                                opacity: isAddingTask ? 1.0 : 0.0,
                                curve: Curves.easeInOut,
                                child: Container(
                                  height: 32,
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(252, 252, 252, 1.0),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 12,
                                        width: 12,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 60,
                                        padding: const EdgeInsets.only(
                                            left: 6.0, right: 16),
                                        child: Text(
                                          'Geral',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Icon(Icons.arrow_circle_down_outlined,
                                          size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            opacity: showNoteButton ? 0.0 : 1.0,
            child: Visibility(
              visible: !showNoteButton,
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10,
                      spreadRadius: 0,
                      color: Color.fromRGBO(58, 58, 58, 0.05),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.short_text_rounded,
                  size: 24.0,
                  color: Color.fromRGBO(58, 58, 58, 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
