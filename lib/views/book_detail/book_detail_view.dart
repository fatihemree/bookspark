import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/product/widget/card/shadowContainer.dart';
import '../../core/extension/context_extension.dart';
import '../../product/widget/bottomSheet/bottomSheet.dart';

class BookDetail extends StatelessWidget {
  final String imgUrl;
  final String about;
  final Object tag; // model ekleme
  BookDetail({
    Key key,
    @required this.imgUrl,
    @required this.about,
    @required this.tag,
  }) : super(key: key);

  static List<Example> deneme = [
    Example(name: 'Adi', value: 'İçimizdeki Şeytan'),
    Example(name: 'Adi', value: 'İçimizdeki Şeytan'),
    Example(name: 'Adi', value: 'İçimizdeki Şeytan'),
  ];
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
      body: pageContent(context),
    );
  }

  SingleChildScrollView pageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBookImages(context, imgUrl),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: context.height * .03,
                horizontal: context.width * .15),
            child: bookStatisticsArea(context),
          ),
          ShadowContainer(
            child: bookTagArea(context),
          ),
          ShadowContainer(
            child: bookAbout(context, about),
          )
        ],
      ),
    );
  }

  Column bookTagArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Künye',
          style:
              context.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
        ),
        Divider(),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          addAutomaticKeepAlives: true,
          itemCount: deneme.length,
          itemBuilder: (context, index) => Align(
            alignment: Alignment.centerLeft,
            child: bookTag(context, deneme[index]),
          ),
        ),
      ],
    );
  }

  Column bookStatisticsArea(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomSheeet(
              child: textButton(context, 'Okuyonlar', '78'),
              bottomSheet: Text('deneme'),
            ),
            Container(
                height: context.height * .1,
                child: VerticalDivider(
                  color: context.colors.secondaryVariant,
                  thickness: 1,
                )),
            textButton(context, 'Alıntılar', '34'),
          ],
        ),
        Divider(
          color: context.colors.secondaryVariant,
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textButton(context, 'Ort. Gün', '12'),
            Container(
                height: context.height * .1,
                child: VerticalDivider(
                  color: context.colors.secondaryVariant,
                  thickness: 1,
                )),
            textButton(context, 'Ort. Sayfa', '34/Gün'),
          ],
        ),
      ],
    );
  }

  Column bookAbout(BuildContext context, String about) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Hakkında',
          style:
              context.textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
        ),
        Divider(),
        Text(about ?? '...')
      ],
    );
  }

  RichText bookTag(BuildContext context, Example item) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          // text: item.name != null ? '$item.name: ' : 'deneme',
          text: '${item.name} : ',
          children: <TextSpan>[
            TextSpan(
              text: item.value ?? 'deneme',
              style: context.textTheme.subtitle2,
            )
          ],
          style: context.textTheme.subtitle2
              .copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget textButton(BuildContext context, String title, String value) {
    return Container(
      width: context.width * .3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              AutoLocaleText(
                value: title,
                style: context.textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              AutoLocaleText(
                value: value,
                style: context.textTheme.subtitle2
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: context.colors.secondaryVariant,
          )
        ],
      ),
    );
  }

  Center buildBookImages(BuildContext context, String imgUrl) {
    const _defaultBookImg = 'asset/image/no_img.jpg';
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: context.height * .020),
        child: Container(
          width: context.width * .3,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 2),
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5)
            // context.shadowContainerDefault,
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: imgUrl != null
                ? Image.network(imgUrl)
                : Image.asset(_defaultBookImg),
          ),
        ),
      ),
    );
  }
}

class Example {
  String name;
  String value;

  Example({this.name, this.value});

  Example.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
