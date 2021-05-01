import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';

import 'note_text.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
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

  InputField({
    @required this.controller,
    @required this.label,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.formatter = const [],
    this.maxLength,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.suffix = const SizedBox(),
    this.prefix,
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
          height: widget.smallVersion ? 70 : 113,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.prefix ?? SizedBox(),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  focusNode: widget.fieldFocusNode,
                  textInputAction: widget.textInputAction,
                  onChanged: widget.onChanged,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines,
                  inputFormatters: widget.formatter,
                  onEditingComplete: () {
                    if (widget.enterPressed != null) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      widget.enterPressed();
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (widget.nextFocusNode != null) {
                      widget.nextFocusNode.requestFocus();
                    }
                  },
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    height: 0.5,
                  ),
                  obscureText: isPassword,
                  cursorColor: Colors.white,
                  readOnly: widget.isReadOnly,
                  decoration: InputDecoration(
                    // labelText: widget.label,
                    // contentPadding:
                    //     EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    labelText: widget.label,
                    labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      // height: ,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              widget.suffix,
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
        verticalSpaceSmall
      ],
    );
  }
}
