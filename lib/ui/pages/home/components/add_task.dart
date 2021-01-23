import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  final Function handleAddingTask;
  final FocusNode focusNode;

  const AddTask({
    @required this.handleAddingTask,
    this.focusNode,
  });

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskController = TextEditingController();

  bool isAddingTask = false;
  bool showNoteButton = false;

  @override
  void initState() {
    widget.focusNode.addListener(() {
      widget.focusNode.hasFocus
          ? handleAddingTask(value: true)
          : handleAddingTask(value: false);
    });
    super.initState();
  }

  Future<void> handleAddingTask({bool value}) async {
    isAddingTask = value;
    widget.handleAddingTask(value);
    if (value == false) {
      await Future.delayed(const Duration(milliseconds: 500));
    }
    showNoteButton = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 12.0,
        top: 24.0,
        right: 12.0,
        bottom: 24.0,
      ),
      decoration: BoxDecoration(
        gradient: isAddingTask
            ? const LinearGradient(
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    width: isAddingTask
                        ? MediaQuery.of(context).size.width - 24
                        : 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 10,
                          color: Color.fromRGBO(58, 58, 58, 0.05),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                        hintText: 'Adicione uma nova tarefa..',
                      ),
                      maxLines: isAddingTask ? 3 : 1,
                      minLines: 1,
                      textInputAction: TextInputAction.done,
                      focusNode: widget.focusNode,
                      controller: taskController,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: const Color.fromRGBO(58, 58, 58, 1.0),
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(58, 58, 58, 1.0),
                      ),
                    ),
                  ),
                  if (isAddingTask)
                    Positioned(
                      right: 12,
                      top: 8,
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isAddingTask ? 1.0 : 0.0,
                            curve: Curves.easeInOut,
                            child: Container(
                              width: 32,
                              height: 32,
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(252, 252, 252, 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: SvgPicture.asset(
                                'lib/ui/assets/icons/calendar_clean.svg',
                                height: 16,
                                width: 16,
                                color: const Color.fromRGBO(25, 44, 93, 1.0),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isAddingTask ? 1.0 : 0.0,
                            curve: Curves.easeInOut,
                            child: Container(
                              height: 32,
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(252, 252, 252, 1.0),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
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
                                      style: GoogleFonts.quicksand(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromRGBO(
                                            25, 44, 93, 1.0),
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'lib/ui/assets/icons/chevron_down.svg',
                                    height: 16,
                                    width: 16,
                                    color:
                                        const Color.fromRGBO(25, 44, 93, 1.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ],
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            opacity: showNoteButton ? 0.0 : 1.0,
            child: Visibility(
              visible: !showNoteButton,
              child: Container(
                margin: const EdgeInsets.only(left: 8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10,
                      color: Color.fromRGBO(58, 58, 58, 0.05),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'lib/ui/assets/icons/note.svg',
                  height: 24,
                  width: 24,
                  color: const Color.fromRGBO(25, 44, 93, 1.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
