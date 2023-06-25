import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizduell/question/question_model.dart';
import 'package:quizduell/question/question_view.dart';

import 'cubit/cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyCubit>(
      create: (context) => MyCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<MyCubit, MyState>(
          builder: (context, state) {
            if (state is S0State) {
              return QuestionCard();
            } else if (state is STState) {
              return StartToBetView();
            } else
              QuestionCard();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final myCubit = BlocProvider.of<MyCubit>(context);
            myCubit.changeToBState();
          },
          tooltip: 'Change to BState',
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
