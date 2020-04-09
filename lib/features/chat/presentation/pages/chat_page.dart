import 'package:chatr/features/chat/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global chat'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<ChatBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChatBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<ChatBloc, ChatState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Text(
                      'Empty',
                    );
                  } else if (state is Loading) {
                    return Text(
                      'return LoadingWidget();',
                    );
                  } else if (state is Loaded) {
                    return Text(
                      'Loaded',
                    );
                  } else if (state is Error) {
                    return Text(
                      'Error',
                    );
                  } else {
                    return Text('Unreachable');
                  }
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              MessageControls()
            ],
          ),
        ),
      ),
    );
  }

  MessageControls() {}
}
