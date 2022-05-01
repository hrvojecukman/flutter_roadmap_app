import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/common/info/info_cubit.dart';
import 'package:login_template_firebase/common/utils/flushbar_utils.dart';

const emptyString = " ";

class InfoListener extends StatelessWidget with FlushBarUtils {
  final Widget child;

  const InfoListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<InfoCubit, InfoState>(
      listener: (context, state) {
        if (state is ErrorHasOccurred) {
          showErrorFlushBar(
            context: context,
            message: state.message ?? emptyString,
            title: state.title ?? emptyString,
          );
        } else if (state is ShowInfo) {
          showInfoFlushBar(
            context: context,
            message: state.message ?? emptyString,
            title: state.title ?? emptyString,
          );
        }
      },
      child: child,
    );
  }
}
