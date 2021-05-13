import 'package:bitcoin_converter/coin.dart';
import 'package:bitcoin_converter/netWorkServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  NetWorkServices netWorkServices = NetWorkServices();


  String selectedCurrency = 'USD';
  double etcRate;
  double btcRate;
  double ltcRate;
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  Future<double> getETC() async {
    var data = await netWorkServices.getETC(currency:selectedCurrency );
    setState(() {
      etcRate = data['rate'];
    });
    return etcRate;
  }
  // Future<double> getBTC() async {
  //   var data = await netWorkServices.getBTC(currency:selectedCurrency );
  //   setState(() {
  //     btcRate = data['rate'];
  //   });
  //   return btcRate;
  // }
  // Future<double> getLTC() async {
  //   var data = await netWorkServices.getLTC(currency:selectedCurrency );
  //   setState(() {
  //     ltcRate = data['rate'];
  //   });
  //   return ltcRate;
  // }

  @override
  void initState() {
    getETC();
    // getBTC();
    // getLTC();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // getETC();
    // getBTC();
    // getLTC();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        children: <Widget>[
          buildRate("ETH",etcRate),
          buildRate("BTC",btcRate),
          buildRate("LTC",ltcRate),
          Spacer(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }

  Padding buildRate(crypto,double rate) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1$crypto = ${rate.toString()}CNY',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// https://rest.coinapi.io/v1/exchangerate/LTC/AUD?apiKey=66E68CA3-66DB-425F-8681-8BE5443BD0CD
