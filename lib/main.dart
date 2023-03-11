import 'dart:ffi';

import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  yes mate;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StopWatchTimer _obj = StopWatchTimer();
  final bool _isHour = true;
  bool isDisable = false;

  void functioncall(){
    if (isDisable==false){
      isDisable = true;
    }
    else {
      isDisable = false;
    }
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obj.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title: const Text('Stop Watch'),
          ),
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder <int>(
                      stream: _obj.rawTime,
                      initialData: _obj.rawTime.value,
                      builder: (context, snapshot) {
                        final Value = snapshot.data;
                        final displaytime = StopWatchTimer.getDisplayTime(Value!,
                            hours: _isHour);
                        return Text(displaytime,
                            style: const TextStyle(
                                fontSize: 40,color: Colors.white, fontWeight: FontWeight.bold));
                      }),
                  const SizedBox(
                    height: 30,
                  ),


                  ElevatedButton(onPressed: isDisable ? (){
                    functioncall();
                    _obj.onExecute.add(StopWatchExecute.start);
                    }
                    :null,
                      style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
                       child: const Text('Start',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                       ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    child: Text('Stop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
                    style: TextButton.styleFrom(primary: Colors.lightBlueAccent),
                    onPressed: ()  {
                      _obj.onExecute.add(StopWatchExecute.stop);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    child: Text('Reset', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
                    style: TextButton.styleFrom(primary: Colors.lightBlueAccent),
                    onPressed: () {
                      _obj.onExecute.add(StopWatchExecute.reset);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
