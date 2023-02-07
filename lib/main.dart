import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'helpers/ApiHelper.dart';
import 'models/Currency.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController amount = TextEditingController();
  List currencyName = [
    "AED",
    "AFN",
    "ALL",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BRL",
    "BSD",
    "BTC",
    "BTN",
    "BWP",
    "BYN",
    "BZD",
    "CAD",
    "CDF",
    "CHF",
    "CLF",
    "CLP",
    "CNH",
    "CNY",
    "COP",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DZD",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GGP",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HRK",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "IMP",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JEP",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LBP",
    "LKR",
    "LRD",
    "LSL",
    "LYD",
    "MAD",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
    "MNT",
    "MOP",
    "MRU",
    "MUR",
    "MVR",
    "MWK",
    "MXN",
    "MYR",
    "MZN",
    "NAD",
    "NGN",
    "NIO",
    "NOK",
    "NPR",
    "NZD",
    "OMR",
    "PAB",
    "PEN",
    "PGK",
    "PHP",
    "PKR",
    "PLN",
    "PYG",
    "QAR",
    "RON",
    "RSD",
    "RUB",
    "RWF",
    "SAR",
    "SBD",
    "SCR",
    "SDG",
    "SEK",
    "SGD",
    "SHP",
    "SLL",
    "SOS",
    "SRD",
    "SSP",
    "STD",
    "STN",
    "SVC",
    "SYP",
    "SZL",
    "THB",
    "TJS",
    "TMT",
    "TND",
    "TOP",
    "TRY",
    "TTD",
    "TWD",
    "TZS",
    "UAH",
    "UGX",
    "USD",
    "UYU",
    "UZS",
    "VES",
    "VND",
    "VUV",
    "WST",
    "XAF",
    "XAG",
    "XAU",
    "XCD",
    "XDR",
    "XOF",
    "XPD",
    "XPF",
    "XPT",
    "YER",
    "ZAR",
    "ZMW",
    "ZWL",
  ];
  int indexValue = 0;
  dynamic selectedFrom = "USD";
  dynamic selectedTo = "INR";
  dynamic value = 1;
  dynamic currencyTo = 1;
  late Future<Currency?> getData;
  bool isIos = false;
  late FixedExtentScrollController scrollController;
  late FixedExtentScrollController scrollController1;

  @override
  void initState() {
    super.initState();
    getData = ApiHelper.apiHelper.fetchData();
    scrollController = FixedExtentScrollController(
        initialItem: currencyName.indexOf(selectedFrom));
    scrollController1 = FixedExtentScrollController(
        initialItem: currencyName.indexOf(selectedTo));
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    scrollController1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (isIos)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              resizeToAvoidBottomInset: false,
              navigationBar: CupertinoNavigationBar(
                border: Border(
                  bottom: BorderSide(color: Colors.indigo.shade400),
                ),
                middle: const Text(
                  "Currency Converter",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.indigo.shade400,
                trailing: CupertinoSwitch(
                    value: isIos,
                    onChanged: (val) {
                      setState(() {
                        isIos = !isIos;
                      });
                    }),
              ),
              backgroundColor: Colors.indigo.shade400,
              child: Center(
                child: FutureBuilder(
                  future: getData,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      Currency? data = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Select your currency type"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedFrom,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              scrollController.dispose();
                                              scrollController =
                                                  FixedExtentScrollController(
                                                      initialItem:
                                                          currencyName.indexOf(
                                                              selectedFrom));
                                              showCupertinoModalPopup(
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoActionSheet(
                                                  cancelButton:
                                                      CupertinoActionSheetAction(
                                                    child: const Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  actions: [
                                                    SizedBox(
                                                      height: 300,
                                                      width: MediaQuery.of(context).size.width,
                                                      child: CupertinoPicker(
                                                        scrollController: scrollController,
                                                        backgroundColor: Colors.white,
                                                        itemExtent: 55,
                                                        onSelectedItemChanged:
                                                            (val) {
                                                          setState(() {
                                                            selectedFrom =
                                                                currencyName[
                                                                    val];
                                                            indexValue =
                                                                currencyName
                                                                    .indexOf(
                                                                        val);
                                                            getData = ApiHelper
                                                                .apiHelper
                                                                .fetchData(
                                                                    from: currencyName[
                                                                        val]);
                                                          });
                                                        },
                                                        children: currencyName
                                                            .map((e) => Center(
                                                                child: Text(e,style: const TextStyle(color: Colors.black),)))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                          child: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("Enter your currency"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: CupertinoTextField(
                                      controller: amount,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      keyboardType: TextInputType.number,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo.shade400,
                                      ),
                                      placeholder: "Enter any number",
                                      placeholderStyle: TextStyle(
                                          color: Colors.grey.shade200),
                                      onChanged: (val) {
                                        setState(() {
                                          getData = ApiHelper.apiHelper
                                              .fetchData(amount: val);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Select Converted Currency type"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedTo,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              scrollController1.dispose();
                                              scrollController1 =
                                                  FixedExtentScrollController(
                                                      initialItem: currencyName
                                                          .indexOf(selectedTo));
                                              showCupertinoModalPopup(
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (context) =>
                                                    CupertinoActionSheet(
                                                  cancelButton:
                                                      CupertinoActionSheetAction(
                                                    child: const Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  actions: [
                                                    SizedBox(
                                                      height: 300,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: CupertinoPicker(
                                                        scrollController:
                                                            scrollController1,
                                                        backgroundColor:
                                                            Colors.white,
                                                        itemExtent: 55,
                                                        onSelectedItemChanged:
                                                            (val) {
                                                          setState(() {
                                                            selectedTo =
                                                                currencyName[
                                                                    val];
                                                            getData = ApiHelper
                                                                .apiHelper
                                                                .fetchData(
                                                                    to: currencyName[
                                                                        val]);
                                                          });
                                                        },
                                                        children: currencyName
                                                            .map((e) => Center(
                                                                child: Text(e,style: TextStyle(color: Colors.black),)))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                          child: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("Your Converted currency"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("${data!.result}",
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: const Text("Currency Converter"),
                centerTitle: true,
                backgroundColor: Colors.indigo.shade400,
                elevation: 0,
                actions: [
                  Switch(
                      value: isIos,
                      onChanged: (val) {
                        setState(() {
                          isIos = !isIos;
                        });
                      }),
                ],
              ),
              backgroundColor: Colors.indigo.shade400,
              body: Center(
                child: FutureBuilder(
                  future: getData,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      Currency? data = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Select your currency type"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      icon: const Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: Colors.white),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      dropdownColor: Colors.indigo.shade300,
                                      menuMaxHeight: 500,
                                      underline: Container(),
                                      value: selectedFrom,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedFrom = val;
                                          indexValue =
                                              currencyName.indexOf(val);
                                          getData = ApiHelper.apiHelper
                                              .fetchData(from: val.toString());
                                        });
                                      },
                                      items: currencyName
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  const Text("Enter your currency"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: TextField(
                                      controller: amount,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: Colors.indigo,
                                                width: 0)),
                                        hintText: "1",
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade200),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          getData = ApiHelper.apiHelper
                                              .fetchData(amount: val);
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 240,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Select Converted Currency type"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      icon: const Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Colors.white,
                                      ),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      dropdownColor: Colors.indigo.shade300,
                                      menuMaxHeight: 500,
                                      underline: Container(),
                                      value: selectedTo,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedTo = val;
                                          indexValue =
                                              currencyName.indexOf(val);
                                          getData = ApiHelper.apiHelper
                                              .fetchData(to: val.toString());
                                        });
                                      },
                                      items: currencyName
                                          .map(
                                            (e) => DropdownMenuItem(
                                              value: e,
                                              child: Text(e),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  const Text("Your Converted currency"),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("${data!.result}",
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
