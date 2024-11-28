import 'package:flutter/material.dart';
import 'package:testkarima/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Pays = [
    {
      "Pays": "Tunisie",
      "capitale": 'Tunisia',
      "Population": '12 million',
      "Langue": 'Arab',
      "images": 'assets/img/tunisie.png',
    },
    {
      "Pays": 'Maroc',
      "capitale": 'Rabat',
      "Population": '38 million',
      "Langue": 'Arab',
      "images": 'assets/img/maroc.png',
    },
    {
      "Pays": "USA",
      "capitale": 'Washington',
      "Population": '332 million',
      "Langue": 'Anglais',
      "images": 'assets/img/usa.png',
    },
    {
      "Pays": "France",
      "capitale": 'Paris',
      "Population": '68 million',
      "Langue": 'Francais',
      "images": 'assets/img/france.png',
    },
    {
      "Pays": "Brasil",
      "capitale": 'PaBrasilia',
      "Population": '214 million',
      "Langue": 'Portoguese',
      "images": 'assets/img/brasil.png',
    },
  ];

  Map<String, String>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atlas Monde'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FloatingActionButton pressed");
          print(Pays[0]["pays"]);
        },
        child: Icon(Icons.cloud),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
          Text(
            'Cliquez sur un pays',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var pays in Pays)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCountry = pays;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(pays["Pays"]!),
                  ),
                ),
            ],
          ),
          if (selectedCountry != null) ...[
            CountryInfo(
                text: 'Capitale: ${selectedCountry!["capitale"]}',
                color: Colors.green),
            CountryInfo(
                text: 'Population: ${selectedCountry!["Population"]}',
                color: Colors.pink),
            CountryInfo(
                text: 'Langue: ${selectedCountry!["Langue"]}',
                color: Colors.orange),
            SizedBox(height: 8),
            Image.asset(
              'assets/img/${selectedCountry!["images"]?.replaceFirst('assets/img/', '')}',
              height: 200,
            ),
          ],
        ],
      ),
    );
  }
}

class CountryInfo extends StatelessWidget {
  final String text;
  final Color color;

  CountryInfo({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 16),
      ),
    );
  }
}
