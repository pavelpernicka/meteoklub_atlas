import 'package:flutter/material.dart';

void main() {
  runApp(CloudAtlasApp());
  print('CloudAtlasApp started');
}

class CloudAtlasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building CloudAtlasApp');
    return MaterialApp(
      title: 'Atlas Oblaků',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CloudHomeScreen(),
    );
  }
}

class CloudHomeScreen extends StatefulWidget {
  @override
  _CloudHomeScreenState createState() => _CloudHomeScreenState();
}

class _CloudHomeScreenState extends State<CloudHomeScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Cloud> filteredClouds = [];

  @override
  void initState() {
    super.initState();
    filteredClouds = clouds;
  }

  void _startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      filteredClouds = clouds;
    });
  }

  void _searchClouds(String query) {
    setState(() {
      filteredClouds = clouds
          .where((cloud) => cloud.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  final List<Cloud> clouds = [
    Cloud(name: 'Cumulus', description: 'Nízké, bělavé oblačné útvary s plochou základnou.', imagePath: 'assets/cumulus.jpg'),
    Cloud(name: 'Cirrus', description: 'Vysoké, jemné oblačné pruhy, často připomínající vlákna.', imagePath: 'assets/cirrus.jpg'),
    Cloud(name: 'Stratus', description: 'Nízké, rovnoměrně rozložené šedivé oblačné vrstvy.', imagePath: 'assets/stratus.jpg'),
    Cloud(name: 'Altocumulus', description: 'Středně vysoké mraky v podobě malých oblačných chomáčků.', imagePath: 'assets/altocumulus.jpg'),
    Cloud(name: 'Nimbostratus', description: 'Tmavé, nízké a husté oblačné vrstvy, přinášející srážky.', imagePath: 'assets/nimbostratus.jpg'),
    Cloud(name: 'Cumulonimbus', description: 'Velké bouřkové mraky s vertikálním rozsahem.', imagePath: 'assets/cumulonimbus.jpg'),
    Cloud(name: 'Altostratus', description: 'Šedivé či modravé oblačné vrstvy, často přikrývající oblohu.', imagePath: 'assets/altostratus.jpg'),
    Cloud(name: 'Cirrostratus', description: 'Tenké, průhledné vrstvy mraků, pokrývající většinu oblohy.', imagePath: 'assets/cirrostratus.jpg'),
    Cloud(name: 'Cirrocumulus', description: 'Vysoké mraky v podobě malých chomáčků s jemnou strukturou.', imagePath: 'assets/cirrocumulus.jpg'),
    Cloud(name: 'Stratocumulus', description: 'Nízké oblačné chomáče s tmavými a světlými oblastmi.', imagePath: 'assets/stratocumulus.jpg'),
    Cloud(name: 'Mammatus', description: 'Unikátní mraky s boulovitými útvary na spodní straně.', imagePath: 'assets/mammatus.jpg'),
    Cloud(name: 'Lenticularis', description: 'Mraky čočkovitého tvaru, často vznikající nad horami.', imagePath: 'assets/lenticularis.jpg'),
    Cloud(name: 'Pileus', description: 'Malé mraky podobající se čepici, tvořící se na vrcholu jiných mraků.', imagePath: 'assets/pileus.jpg'),
    Cloud(name: 'Kelvin-Helmholtz', description: 'Vlnovité mraky vznikající kvůli rychlostnímu střihu větru.', imagePath: 'assets/kelvin_helmholtz.jpg'),
    Cloud(name: 'Noctilucent', description: 'Vysoké, velmi tenké mraky svítící za soumraku.', imagePath: 'assets/noctilucent.jpg'),
    Cloud(name: 'Pyrocumulus', description: 'Mraky vznikající při lesních požárech či sopečných erupcích.', imagePath: 'assets/pyrocumulus.jpg'),
    Cloud(name: 'Fractus', description: 'Nízké, roztřepené oblačné útvary, často pod jinými mraky.', imagePath: 'assets/fractus.jpg'),
    Cloud(name: 'Contrail', description: 'Mraky tvořené kondenzačními stopami za letadly.', imagePath: 'assets/contrail.jpg'),
    Cloud(name: 'Foehn Wall', description: 'Stacionární mraky vytvářející se při větrném jevu foehn.', imagePath: 'assets/foehn_wall.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    print('Building CloudHomeScreen');
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;
        return Scaffold(
          appBar: AppBar(
            title: isSearching
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Hledat oblaky...',
                              border: InputBorder.none,
                            ),
                            onChanged: _searchClouds,
                          ),
                        ),
                        if (!isMobile)
                          ElevatedButton(
                            onPressed: () => _searchClouds(searchController.text),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: Text('Hledat', style: TextStyle(color: Colors.white)),
                          ),
                        IconButton(
                          icon: Icon(Icons.clear, color: Colors.teal),
                          onPressed: _stopSearch,
                        ),
                      ],
                    ),
                  )
                : Text('Atlas Oblaků'),
            actions: [
              if (!isSearching)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.teal,
                    mini: true,
                    onPressed: _startSearch,
                    child: Icon(Icons.search, color: Colors.white),
                    tooltip: 'Vyhledávání',
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.teal,
                  mini: true,
                  onPressed: () {
                    print('Tapped on Přidat');
                    // Implement add functionality here
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  tooltip: 'Přidat',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  mini: true,
                  onPressed: () {
                    print('Tapped on Odznáčky');
                    // Implement badge functionality here
                  },
                  child: Icon(Icons.emoji_events, color: Colors.white),
                  tooltip: 'Odznáčky',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  mini: true,
                  onPressed: () {
                    print('Tapped on Uživatelské informace');
                    // Implement user info functionality here
                  },
                  child: Icon(Icons.account_circle, color: Colors.white),
                  tooltip: 'Uživatelské informace',
                ),
              ),
            ],
          ),
          drawer: isMobile
              ? Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                        ),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.cloud, color: Colors.teal.shade800),
                        title: Text('Všechny oblaky'),
                        onTap: () {
                          print('Tapped on Všechny oblaky');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info, color: Colors.teal.shade800),
                        title: Text('O aplikaci'),
                        onTap: () {
                          print('Tapped on O aplikaci');
                        },
                      ),
                    ],
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
                        ),
                        child: Text(
                          'Menu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.cloud, color: Colors.teal.shade800),
                        title: Text('Všechny oblaky'),
                        onTap: () {
                          print('Tapped on Všechny oblaky');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info, color: Colors.teal.shade800),
                        title: Text('O aplikaci'),
                        onTap: () {
                          print('Tapped on O aplikaci');
                        },
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 2 : 4,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filteredClouds.length,
                    itemBuilder: (context, index) {
                      print('Building GridTile for ${filteredClouds[index].name}');
                      return GestureDetector(
                        onTap: () {
                          print('Tapped on ${filteredClouds[index].name}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CloudDetailScreen(cloud: filteredClouds[index]),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                child: Image.asset(
                                  filteredClouds[index].imagePath,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  filteredClouds[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  filteredClouds[index].description,
                                  style: TextStyle(fontSize: 14),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CloudDetailScreen extends StatelessWidget {
  final Cloud cloud;

  CloudDetailScreen({required this.cloud});

  @override
  Widget build(BuildContext context) {
    print('Building CloudDetailScreen for ${cloud.name}');
    return Scaffold(
      appBar: AppBar(
        title: Text(cloud.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(cloud.imagePath, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                cloud.description,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cloud {
  final String name;
  final String description;
  final String imagePath;

  Cloud({required this.name, required this.description, required this.imagePath});
}
