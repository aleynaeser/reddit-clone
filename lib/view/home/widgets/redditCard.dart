import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

class RedditCard extends StatefulWidget {
  final store;

  const RedditCard({
    Key? key,
    this.store,
  }) : super(key: key);

  @override
  State<RedditCard> createState() => _RedditCardState();
}

class _RedditCardState extends State<RedditCard> {
  bool isClickedDec = false;
  bool isClickedInc = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(),
                buildThumbnail(),
                buildIcons(),
              ],
            ),
          )),
    );
  }

  Widget buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: padding, left: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.store.authorFullname ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                children: [
                  widget.store.noFollow == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.store.noFollow = !widget.store.noFollow;
                            });
                          },
                          icon: const Icon(
                            Icons.check_circle,
                            color: blue,
                          ))
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.store.noFollow = !widget.store.noFollow;
                            });
                          },
                          child: const Text("Join"),
                          style: ElevatedButton.styleFrom(
                            primary: blue,
                            onPrimary: white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.store.title ?? "",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThumbnail() {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        child: widget.store.thumbnail != "self" &&
                widget.store.thumbnail != "default"
            ? Center(
                child: Image.network(
                  widget.store.thumbnail ?? "",
                  fit: BoxFit.fill,
                ),
              )
            : Text(
                widget.store.selfText ?? "",
                style: Theme.of(context).textTheme.bodyText1,
              ),
      ),
    );
  }

  Row buildIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.store.score = widget.store.score + 1;
                    isClickedInc = !isClickedInc;
                  });
                },
                icon: Icon(
                  Icons.arrow_circle_up,
                  color: isClickedInc ? primary : grey,
                )),
            Text(widget.store.score.toString()),
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.store.score = widget.store.score - 1;
                    isClickedDec = !isClickedDec;
                  });
                },
                icon: Icon(
                  Icons.arrow_circle_down,
                  color: isClickedDec ? blue : grey,
                )),
          ],
        ),
        Row(
          children: [
            IconTheme(
              data: Theme.of(context).copyWith().iconTheme,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.comment_outlined,
                  )),
            ),
            Text(widget.store.numComments.toString()),
          ],
        ),
        Row(
          children: [
            IconTheme(
              data: Theme.of(context).copyWith().iconTheme,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                  )),
            ),
            const Text("Share"),
          ],
        ),
        IconTheme(
          data: Theme.of(context).copyWith().iconTheme,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.card_giftcard_outlined,
              )),
        ),
      ],
    );
  }
}
