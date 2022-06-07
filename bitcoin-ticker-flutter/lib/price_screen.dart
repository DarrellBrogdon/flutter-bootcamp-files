import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double usdBTCVal = 0.0;
  double usdETHVal = 0.0;
  double usdLTCVal = 0.0;

  @override
  void initState() {
    super.initState();
    cryptoList.forEach((element) {
      // getCoinData(element);
    });
  }

  void getCoinData(String coinType) async {
    try {
      var coinData = await CoinData().getCoinData(selectedCurrency, coinType);

      setState(() {
        if (coinData != null) {
          switch (coinType) {
            case 'BTC':
              usdBTCVal = coinData['rate'];
              break;
            case 'ETH':
              usdETHVal = coinData['rate'];
              break;
            case 'LTC':
              usdLTCVal = coinData['rate'];
              break;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList
          .map((e) => DropdownMenuItem(child: Text(e), value: e))
          .toList(),
      onChanged: (String newValue) {
        setState(() {
          selectedCurrency = newValue;
          cryptoList.forEach((element) {
            getCoinData(element);
          });
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (int index) {
        selectedCurrency = currenciesList[index];
        cryptoList.forEach((element) {
          getCoinData(element);
        });
      },
      children: currenciesList.map((e) => Text(e)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                priceCard(
                    '1 BTC = ${usdBTCVal == 0.0 ? "?" : usdBTCVal.toInt()} $selectedCurrency'),
                priceCard(
                    '1 ETH = ${usdETHVal == 0.0 ? "?" : usdETHVal.toInt()} $selectedCurrency'),
                priceCard(
                    '1 LTC = ${usdLTCVal == 0.0 ? "?" : usdLTCVal.toInt()} $selectedCurrency'),
              ],
            ),
          ),
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

  Widget priceCard(String content) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
