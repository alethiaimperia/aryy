import './input_widget.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class InputPasswordWidget extends StatefulWidget {
  const InputPasswordWidget(
      {super.key,
      this.textController,
      required this.hintText,
      required this.hintLabelText});

  final TextEditingController? textController;
  final String hintText;
  final String hintLabelText;

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return InputWidget(
      hintText: widget.hintText,
      inputTextType: TextInputType.visiblePassword,
      appendComponent: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Text(
              widget.hintLabelText,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
