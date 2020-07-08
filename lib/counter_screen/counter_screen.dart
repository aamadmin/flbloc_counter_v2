import 'package:flbloc_counter_v2/counter_screen/bloc/counter_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CounterScreenBloc _counterScreenBloc =
    //     BlocProvider.of<CounterScreenBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Bloc V2'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<CounterScreenBloc, CounterScreenState>(
      builder: (context, state) {
        if (state is ShowCounterValue) {
          return buildCounterScreen(context, state.counterValue);
        } else if (state is ShowLoadingCounterScreen) {
          return buildLoadingScreen();
        } else {
          return Container(child: Text('something is wrong...'));
        }
        //return (Text('something is wrong...'));
      },
    );
  }
}

Widget buildCounterScreen(BuildContext context, int counterValue) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('Counter'),
      Text(
        '${counterValue.toString()}',
        style: TextStyle(fontSize: 35.0),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterScreenBloc>(context)
                    .add(IncrementCounterValue());
              },
              child: Icon(Icons.add),
              tooltip: 'increment',
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterScreenBloc>(context)
                    .add(DecrementCounterValue());
              },
              child: Icon(Icons.remove),
              tooltip: 'decrement',
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterScreenBloc>(context)
                    .add(GenerateRandomCounterValue());
              },
              child: Icon(Icons.slow_motion_video),
              tooltip: 'random',
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterScreenBloc>(context)
                    .add(ResetCounterValue());
              },
              child: Icon(Icons.refresh),
              tooltip: 'refresh',
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildLoadingScreen() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

// class CounterScreen extends StatefulWidget {
//   @override
//   _CounterScreenState createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   //CounterScreenBloc _counterScreenBloc;
//   @override
//   Widget build(BuildContext context) {
//     // CounterScreenBloc _counterScreenBloc =
//     //     BlocProvider.of<CounterScreenBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter Bloc V2'),
//       ),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     return BlocBuilder<CounterScreenBloc, CounterScreenState>(
//       builder: (context, state) {
//         if (state is ShowCounterValue) {
//           return buildCounterScreen(context, state.counterValue);
//         } else if (state is ShowLoadingCounterScreen) {
//           return buildLoadingScreen();
//         } else {
//           return Container(child: Text('something is wrong...'));
//         }
//         //return (Text('something is wrong...'));
//       },
//     );
//   }
// }

// Widget buildCounterScreen(BuildContext context, int counterValue) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Text('Counter'),
//       Text(
//         '${counterValue.toString()}',
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 100),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FloatingActionButton(
//               onPressed: () {
//                 BlocProvider.of<CounterScreenBloc>(context)
//                     .add(IncrementCounterValue());
//               },
//               child: Icon(Icons.add),
//               tooltip: 'increment',
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 BlocProvider.of<CounterScreenBloc>(context)
//                     .add(DecrementCounterValue());
//               },
//               child: Icon(Icons.remove),
//               tooltip: 'decrement',
//             ),
//             FloatingActionButton(
//               onPressed: () {
//                 BlocProvider.of<CounterScreenBloc>(context)
//                     .add(GenerateRandomCounterValue());
//               },
//               child: Icon(Icons.slow_motion_video),
//               tooltip: 'random',
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

// Widget buildLoadingScreen() {
//   return Center(
//     child: CircularProgressIndicator(),
//   );
// }
