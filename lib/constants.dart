import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Colors.green;
const Color primaryColorLight = Colors.green;
const Color drawerColoPrimary = Colors.green;
const Color drawerColoSecondary = Colors.green;
final String path = 'assets/images/';

final List categories = [
  {'image': path + 'ic_username.png', 'title': 'My Profile'},
  {'image': path + 'esewa.jpg', 'title': 'Dues Detail'},
  {'image': path + 'ic_payments_64_4.png', 'title': 'News'},
  {'image': path + 'ic_transfer_32_4.png', 'title': 'Biometric'},
  {'image': path + 'ic_sch_payment_64_4.png', 'title': 'Notifications'},
  {'image': path + 'ic_scan2pay_64_4.png', 'title': 'Payment'},
];
final List transactions = [
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '10,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '11,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '12,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '13,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '14,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '15,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '16,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '55,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '15,000.00',
    date: '10-06-2019',
  ),
  Trx(
    type: 'cwdr/',
    number: '974884/9874513365478965',
    amount: '25,000.00',
    date: '10-06-2019',
  ),
];
int value = 0;
final List<Draw> drawerItems = [
  Draw(title: 'Home', icon: Icons.home),
  Draw(title: 'Search', icon: Icons.search),
  Draw(title: 'Members', icon: Icons.person_pin_rounded),
  Draw(title: 'Committees', icon: Icons.speaker_notes),
  Draw(title: 'Registered Firms', icon: Icons.settings),
  Draw(title: 'Chairman', icon: Icons.settings),
  Draw(title: 'Vice Chairman', icon: Icons.settings),
  Draw(title: 'Chairman EXC Committee', icon: Icons.settings),
  Draw(title: 'SBC Staff', icon: Icons.settings),
];
class Trx {
   String type, number, amount, date;
  Trx({ this.type,  this.amount,  this.date,  this.number});
}
class Draw {
  final String title;
  final IconData icon;
  Draw({ this.title,  this.icon});
}