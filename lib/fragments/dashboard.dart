import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screen = MediaQuery.of(context).size;
    return Material(
      child: SizedBox(
        height: screen.height / 6,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: FlatButton(
                      child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 5 / 5,
                  child: Image.asset('assets/blue.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('widget.title', 
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),maxLines: 2, overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 7.0,),
                      Text('widget.time'.toString(),
                        overflow: TextOverflow.clip,
                      ),
                      SizedBox(height: 5.0,),
                      Text('widget.place',
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

}