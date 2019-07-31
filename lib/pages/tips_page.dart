import 'package:flt_rest/blocs/bloc_provider.dart';
import 'package:flt_rest/blocs/bloc_widget/bloc_state_builder.dart';
import 'package:flt_rest/blocs/trans/trans_event.dart';
import 'package:flt_rest/blocs/trans/trans_state.dart';
import 'package:flt_rest/blocs/trans/translations_bloc.dart';
import 'package:flt_rest/commons/app_style.dart';
import 'package:flt_rest/commons/const.dart';
import 'package:flt_rest/blocs/global_bloc.dart';
import 'package:flt_rest/mixin/AppUtils.dart';
import 'package:flt_rest/widgets/language_btn.dart';
import 'package:flt_rest/widgets/language_widget.dart';
import 'package:flt_rest/widgets/pending.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../widgets/custom_flat_button.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> with AppUtils {
  @override
  void initState() {
    super.initState();
  }

  TransBloc transBloc;
  GlobalKey<ScaffoldState> _tipScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    transBloc = BlocProvider.of<TransBloc>(context);
    final String newLanguage = globalBloc.currentLanguage == VIETNAM_CODE
        ? VIETNAM_CODE
        : ENGLISH_CODE;
    return SafeArea(
      child: BlocEventStateBuilder<TransState>(
          bloc: transBloc,
          builder: (BuildContext context, TransState state) {
            if (state.changing) {
              return PendingPage();
            }
            return Scaffold(
              key: _tipScaffoldKey,
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
                    iconNext: Icons.arrow_forward,
                    iconPrevious: Icons.arrow_back,
                  ),
                  children: _buildTipsPage(context, transBloc, newLanguage)),
            );
          }),
    );
  }

  List<Widget> _buildTipsPage(
      BuildContext context, TransBloc transBloc, String newLanguage) {
    List<Widget> result = [];
    result.add(Container(
        color: Colors.lime,
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Text(
                  globalBloc.text('pages.tips.0.title'),
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
                    text: TextSpan(
                        text: globalBloc.text('pages.tips.0.desc'),
                        style: tipsPageDescStyle)),
              ),
              LanguageSettingWidget(),
            ],
          )
        ])));

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
                  title: globalBloc.text('pages.tips.0.desc'),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  textColor: Colors.black87,
                  onPressed: () {
                    setState(() {
                      // retrieve bloc
                      transBloc.setSeeTips();
                    });
                    Navigator.of(context).pushReplacementNamed(PAGE_HOME);
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
