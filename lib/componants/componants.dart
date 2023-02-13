import 'package:flutter/material.dart';
import 'package:news_app/screens/webvew.dart';

Widget BuldArticalItem(artical, context) => InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WbVewNews(
                  title: artical["title"],
                  url: artical["url"],
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            artical["urlToImage"] != null
                ? Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage("${artical["urlToImage"]}"),
                            fit: BoxFit.cover)),
                  )
                : Container(
                    height: 120,
                    width: 120,
                    child: Center(
                      child: Text("لا يوجد صورة",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                          textDirection: TextDirection.rtl,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          "${artical["title"]}",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    Text(
                      "${artical["publishedAt"]}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
