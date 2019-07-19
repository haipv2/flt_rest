import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/commons/text_style.dart';
import 'package:flt_rest/widgets/tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets/custom_flat_button.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  TransBloc transBloc;

  @override
  void initState() {
    super.initState();
    transBloc = new TransBloc();
  }

  final List<Tips> tipsPage = [
    Tips(
        child: Icon(
          Icons.language,
          size: 100,
        ),
        title: 'Language',
        desc: 'Select your language'),
    Tips(
        child: Icon(
          Icons.info,
          size: 50,
        ),
        title: 'Seller',
        desc: 'seller info')
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransBloc>(
        bloc: transBloc,
        child: SafeArea(
          child: Scaffold(
            body: Swiper.children(
                autoplay: false,
                index: 0,
                loop: false,
                pagination: SwiperPagination(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white30,
                      activeColor: Colors.blueAccent,
                      size: 6.5,
                      activeSize: 8.0),
                ),
                control: SwiperControl(
                  iconNext: Icons.arrow_downward,
                  iconPrevious: Icons.arrow_back,
                ),
                children: _buildTipsPage(context, tipsPage, transBloc)),
          ),
        ));
  }

  List<Widget> _buildTipsPage(
      BuildContext context, List<Tips> tipsPage, TransBloc transBloc) {
    List<Widget> result = [];
    result.add(Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(
              child: Text('EN'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('VI'),
              onPressed: () {},
            )
          ],
        ),
      ),
    ));
    for (var page in tipsPage) {
      result.add(Container(
          color: Colors.orangeAccent,
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: page.child,
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Text(
                    page.title,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: tipsPageTitleStyle,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  child: RichText(
                      text:
                          TextSpan(text: page.desc, style: tipsPageDescStyle)),
                )
              ],
            )
          ])));
    }
    result.add(Container(
      color: Colors.lime,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.play_arrow,
              size: 250,
              color: Colors.indigoAccent,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
              child: CustomFlatButton(
                  title: "START",
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.black87,
                  onPressed: () {
                    setState(() {
                      // retrieve bloc
                      transBloc.setSeeTips();
                    });
                    Navigator.of(context).pushReplacementNamed(HOME_PAGE);
                  },
                  splashColor: Colors.black12,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  color: Colors.orangeAccent),
            )
          ],
        ),
      ),
    ));
    return result;
  }
}
