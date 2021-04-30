import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/core/share_ui/shared/note_text.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';

import 'app_colors.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final String label;
  final Function(String) onChanged;
  final List<TextInputFormatter> formatter;
  final int maxLines, maxLength;
  final Widget suffix;
  final Widget prefix;
  final Color validationColor;

  InputField({
    @required this.controller,
    @required this.placeholder,
    @required this.label,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.formatter,
    this.maxLength,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.suffix,
    this.prefix,
    this.validationColor = AppColors.accent,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword;
  double fieldHeight = 45;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: widget.smallVersion ? 60 : 113,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: widget.validationColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.prefix ?? SizedBox(),
              horizontalSpaceSmall,
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,

                  inputFormatters: widget.formatter ?? [],
                  onEditingComplete: () {
                    if (widget.enterPressed != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  // onFieldSub                                                                                                         mitted: (value) {
                  //   if (widget.nextFocusNode != null) {
                  //     widget.nextFocusNode.requestFocus();
                  //   }
                  // },
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  // decoration:
                  // InputDecoration.collapsed(hintText: widget.placeholder),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.only(top: 10),
                    hintText: widget.placeholder,
                    border: InputBorder.none,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    hintStyle:
                        TextStyle(fontSize: widget.smallVersion ? 12 : 15),
                    // suffix:
                  ),
                ),
              ),
              widget.suffix ??
                  GestureDetector(
                    onTap: () => setState(() {
                      isPassword = !isPassword;
                    }),
                    child: widget.password
                        ? Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            child: Icon(
                              isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                              size: 20,
                            ),
                          )
                        : Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                          ),
                  ),
            ],
          ),
        ),
        (widget.validationMessage != null)
            ? NoteText(
                widget.validationMessage,
                color: Colors.red,
              )
            : SizedBox(),
        (widget.additionalNote != null) ? verticalSpace(5) : SizedBox(),
        (widget.additionalNote != null)
            ? NoteText(widget.additionalNote)
            : SizedBox(),
      ],
    );
  }
}
