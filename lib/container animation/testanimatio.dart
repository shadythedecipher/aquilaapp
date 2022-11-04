import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const String lorem=  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Vulputate dignissim '
    'suspendisse in est. Ut ornare lectus sit amet. Eget nunc lobortis mattis ';
const double buttonDimension = 56.0;

class containerDemo extends StatefulWidget{
  const containerDemo({Key? key}) : super(key: key);



  @override
  State <containerDemo> createState() => _containerDemo();
}

class _containerDemo extends State<containerDemo>{
  ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone) {

    if (isMarkedAsDone ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Step done!'),
      ));
    }
  }

  void _showSettingsBottomModalSheet(BuildContext context) {

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 125,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fade mode',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 12),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(2.0),
                    selectedBorderColor: Theme.of(context).colorScheme.primary,
                    onPressed: (int index) {
                      setModalState(() {
                        setState(() {
                          _transitionType = index == 0
                              ? ContainerTransitionType.fade
                              : ContainerTransitionType.fadeThrough;
                        });
                      });
                    },
                    isSelected: <bool>[
                      _transitionType == ContainerTransitionType.fade,
                      _transitionType == ContainerTransitionType.fadeThrough,
                    ],
                    children: const <Widget>[
                      Text('FADE'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('FADE THROUGH'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Container transform'),
         actions: [
           IconButton(
             icon: const Icon(Icons.settings),
             onPressed: () {
               _showSettingsBottomModalSheet(context);
             },
           ),
         ],
       ),
       body: ListView(
         padding: const EdgeInsets.all(20.0),
         children: <Widget>[
         _OpenContainerWrapper(
         transitionType: _transitionType,
         closedBuilder: (BuildContext _, VoidCallback openContainer) {
           return _ExampleCard(openContainer: openContainer);
         },
         onClosed: _showMarkedAsDoneSnackbar,
       ),
           const SizedBox(height: 16.0),
           // _OpenContainerWrapper(
           //   transitionType: _transitionType,
           //   closedBuilder: (BuildContext _, VoidCallback openContainer) {
           //     return _ExampleSingleTile(openContainer: openContainer);
           //   },
           //   onClosed: _showMarkedAsDoneSnackbar,
           // ),
       ],
       )
     );
  }
}

class _ExampleSingleTile {
}

class _ExampleCard extends StatelessWidget{
  const _ExampleCard({required this.openContainer});

  final VoidCallback openContainer;

  @override
  Widget build(BuildContext context) {
    return _InkWellOverlay(
      openContainer: openContainer,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black38,
              child: Center(
                child: Image.asset(
                  'assets/placeholder_image.png',
                  width: 100,
                ),
              ),
            ),
          ),
          const ListTile(
            title: Text('Title'),
            subtitle: Text('Secondary text'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur '
                  'adipiscing elit, sed do eiusmod tempor.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}

class _InkWellOverlay extends StatelessWidget{
  const _InkWellOverlay({
    this.openContainer,
    this.height,
    this.child,
  });
  final VoidCallback? openContainer;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: null,
      child: InkWell(
        onTap: openContainer,
        child: child,
      ),
    );

  }
}

class _OpenContainerWrapper extends StatelessWidget{

  const _OpenContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const _DetailsPage();
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
class _DetailsPage extends StatelessWidget{
  const _DetailsPage({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;
  @override
  Widget build(BuildContext context) {
       return Scaffold(
         body: ListView(
           children: <Widget>[
             Container(
               color: Colors.black38,
               height: 250,
               child: Padding(
                 padding: const EdgeInsets.all(70.0),
                 child: Image.asset(
                   'assets/placeholder_image.png',
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     'Title',
                     style: Theme.of(context).textTheme.headline5!.copyWith(
                       color: Colors.black54,
                       fontSize: 30.0,
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
                 ],
               ),
             ),
           ],
         ),
       );
  }

}