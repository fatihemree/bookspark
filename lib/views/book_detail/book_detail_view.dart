import 'package:flutter/material.dart';
import '../../core/extension/context_extension.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left_sharp),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'İçimizdeki Şeytan',
          style: context.textTheme.headline6.copyWith(
              fontWeight: FontWeight.bold, fontSize: context.width * .05),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildBookImages(context),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * .03,
                  horizontal: context.width * .15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textButton(context),
                      Container(
                          height: context.height * .1,
                          child: VerticalDivider(
                            color: context.colors.secondaryVariant,
                            thickness: 1,
                          )),
                      textButton(context),
                    ],
                  ),
                  Divider(
                    color: context.colors.secondaryVariant,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textButton(context),
                      Container(
                          height: context.height * .1,
                          child: VerticalDivider(
                            color: context.colors.secondaryVariant,
                            thickness: 1,
                          )),
                      textButton(context),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.height * .05),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: context.height * .03,
                    horizontal: context.width * .15),
                color: Colors.white,
                width: context.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Künye',
                      style: context.textTheme.bodyText1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    bookTag(context),
                    bookTag(context),
                    bookTag(context),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.height * .03,
                  horizontal: context.width * .15),
              color: Colors.white,
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hakkında',
                    style: context.textTheme.bodyText1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  Text(
                      '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText bookTag(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Adı: ',
          children: <TextSpan>[
            TextSpan(
                text: 'İçimizdeki Şeytan', style: context.textTheme.subtitle2)
          ],
          style: context.textTheme.subtitle2
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget textButton(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Okuyanlar',
              children: <TextSpan>[
                TextSpan(
                    text: '\n78',
                    style: context.textTheme.subtitle2
                        .copyWith(fontWeight: FontWeight.bold))
              ],
              style: context.textTheme.subtitle2),
        ),
        Icon(
          Icons.chevron_right_rounded,
          color: context.colors.secondaryVariant,
        )
      ],
    );
  }

  Center buildBookImages(BuildContext context) {
    return Center(
      child: Container(
        width: context.width * .3,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 1),
              color: context.colors.secondaryVariant,
              spreadRadius: 5)
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
              'https://img.kitapyurdu.com/v1/getImage/fn:1105911/wh:true/miw:200/mih:200'),
        ),
      ),
    );
  }
}
