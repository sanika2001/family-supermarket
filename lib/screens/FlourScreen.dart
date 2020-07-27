import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:familysupermarket/components/riceCard.dart';
import 'package:familysupermarket/models/rice.dart';
import 'package:familysupermarket/bloc/FlourBloc.dart';

class FlourScreen extends StatefulWidget {
  @override
  _FlourScreenState createState() => _FlourScreenState();
}

class _FlourScreenState extends State<FlourScreen> {
  final FlourBloc _flourBloc = FlourBloc();

  @override
  void dispose() {
    super.dispose();
    _flourBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        child: StreamBuilder<List<Rice>>(
            stream: _flourBloc.flourListStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Rice>> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return RiceCard(
                          rice: snapshot.data[index],
                          cancelAdd: () {
                            setState(() {
                              snapshot.data[index].pressed = false;
                            });
                          },
                          addTap: () {
                            setState(() {
                              snapshot.data[index].pressed = true;
                            });
                          },
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
