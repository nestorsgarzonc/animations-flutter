import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications page'),
          backgroundColor: Colors.pink,
          centerTitle: true,
        ),
        floatingActionButton: FloatingBottonNativation(),
        bottomNavigationBar: BottonNavigation(),
      ),
    );
  }
}

class BottonNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationNotifier>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          title: Text('Bones'),
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                child: BounceInDown(
                  from: 10,
                  animate: numero > 0 ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) =>
                        Provider.of<_NotificationNotifier>(context)
                            ._bounceController = controller,
                    child: Container(
                      child: Text(
                        '$numero',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          title: Text('My dog'),
        ),
      ],
    );
  }
}

class FloatingBottonNativation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      onPressed: () {
        final notificationProv =
            Provider.of<_NotificationNotifier>(context, listen: false);
        int numero = notificationProv.numero;
        numero++;
        notificationProv.numero = numero;
        if (numero > 2) {
          final controller = notificationProv._bounceController;
          controller.forward(from: 0);
        }
      },
      child: FaIcon(
        FontAwesomeIcons.play,
      ),
    );
  }
}

class _NotificationNotifier extends ChangeNotifier {
  int _numero = 0;
  AnimationController _bounceController;

  int get numero => this._numero;
  set numero(int numero) {
    this._numero = numero;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController controller) {
    this._bounceController = controller;
    notifyListeners();
  }
}
