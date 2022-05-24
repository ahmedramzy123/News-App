import 'package:flutter/material.dart';
import 'package:newsapp/modules/webview/webview_screen.dart';

class CardScreen extends StatelessWidget {
  final dynamic articles;
  CardScreen(this.articles);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WebviewScreen("${articles["url"]}")));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Expanded(child: Image.network("${articles["urlToImage"]}")),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${articles["title"]}",style: TextStyle(fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
                Text("${articles["description"]}",maxLines: 3,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.caption,),
              ],
            ),
          )
        ],),
      ),
    );

  }
}
