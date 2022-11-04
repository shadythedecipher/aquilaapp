import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const String lorem=  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate diagnosis '
    'suspendisse in est. Ut ornare lectures sit amet. Egret nun loris mattes ';


class test2 extends StatefulWidget{
  const test2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return _test2();
  }


}

class _test2 extends State<test2>{
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const _DetailsPage(
          includeMarkAsDoneButton: false,
        );
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return const Icon(
          Icons.location_on,
          color: Colors.limeAccent,

        );
      },
    );
  }
}


class _DetailsPage extends StatelessWidget{
  const _DetailsPage({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;
  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: <Widget>[
          Container(
            // constraints: const BoxConstraints.expand(),
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage(  'assets/image/n1.jpg', ),
                fit: BoxFit.cover,
              ),
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Region Name:',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'City Name:',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Street Name:',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Plot number',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.black54,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  lorem,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Colors.black54,
                    height: 1.5,
                    fontSize: 16.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FloatingActionButton(

                    onPressed: null,
                    child: Icon(
                        FontAwesomeIcons.streetView ,
                      color: Colors.lime,
                ),
                ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  }
}