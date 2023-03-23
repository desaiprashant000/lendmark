import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lendmark/bottom_bar_page/bottom_bar_page.dart';
import 'package:lendmark/lendmark.dart';
import 'package:lendmark/listinformetion.dart';
import 'package:lendmark/modal.dart';

void main() {
  runApp(const MaterialApp(
    home: NavigatorAllPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> with SingleTickerProviderStateMixin {
  // TabController? _tabController;
  //
  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   _tabController!.addListener(() {
  //     _tabController!.animateTo(_tabController!.index);
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // bottomNavigationBar: TabBar(
      //   controller: _tabController,
      //   onTap: (value) {
      //     print(value);
      //     _tabController!.animateTo(value);
      //   },
      //   unselectedLabelColor: Colors.white,
      //   labelColor: Colors.blue,
      //   indicator: BoxDecoration(
      //       borderRadius: BorderRadius.circular(50), color: Colors.grey),
      //   tabs: const [
      //     Tab(
      //       icon: Icon(
      //         Icons.star,
      //       ),
      //       text: 'Featured',
      //     ),
      //     Tab(
      //       icon: Icon(
      //         Icons.list,
      //       ),
      //       text: 'List',
      //     ),
      //   ],
      // ),
      // body: Navigator(
      //   onGenerateRoute: (settings) => MaterialPageRoute(
      //     builder: (context) => TabBarView(
      //       controller: _tabController,
      //       children: const [
      //         first(),
      //         second(),
      //       ],
      //     ),
      //   ),
      //   key: _navKey,
      // ),
      backgroundColor: Colors.black,
    );
  }
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  listdata? ldata;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.account_circle),
                  ),
                ],
                backgroundColor: Colors.black,
              ),
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      title: const Text(
                        'Featured',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    SizedBox(
                      height: 250,
                      child: FutureBuilder(
                        future: Modeldata.featuredLandmarks(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            var lanmarks = snapshot.data as List<landmark>;
                            return GFCarousel(
                              autoPlay: true,
                              hasPagination: true,
                              items: lanmarks
                                  .map(
                                    (e) => Container(
                                      margin: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0)),
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                                'image/${e.imageName}.jpg',
                                                fit: BoxFit.cover,
                                                width: 1000.0),
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${e.name}',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${e.park}',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onPageChanged: (index) {
                                setState(() {
                                  index;
                                });
                              },
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: const [
                          Text(
                            'Lakes',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: FutureBuilder(
                        future: Modeldata.allLandmarks(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<landmark>> snapshot) {
                          if (snapshot.hasData) {
                            var landmarkList = snapshot.data as List<landmark>;

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: landmarkList.length,
                              itemBuilder: (context, index) {
                                return landmarkList[index].category == 'Lakes'
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () async {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {

                                                return listdata(
                                                    landmarkList[index]);
                                              },
                                            )).then((value) => setState(() {}));

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //       builder: (context) =>
                                            //           listdata(landmarkList[index]),
                                            //     ));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GFAvatar(
                                                  radius: 80,
                                                  backgroundImage: AssetImage(
                                                      'image/${landmarkList[index].imageName}.jpg'),
                                                  shape:
                                                      GFAvatarShape.standard),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${landmarkList[index].name}',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container();
                              },
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: const [
                          Text(
                            'Mountains',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: FutureBuilder(
                        future: Modeldata.allLandmarks(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<landmark>> snapshot) {
                          if (snapshot.hasData) {
                            var landmarkList = snapshot.data as List<landmark>;

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: landmarkList.length,
                              itemBuilder: (context, index) {
                                return landmarkList[index].category ==
                                        'Mountains'
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // _navKey.currentState!.push(MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         listdata(landmarkList[index])));
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return listdata(
                                                    landmarkList[index]);
                                              },
                                            )).then((value) => setState(() {}));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GFAvatar(
                                                  radius: 80,
                                                  backgroundImage: AssetImage(
                                                      'image/${landmarkList[index].imageName}.jpg'),
                                                  shape:
                                                      GFAvatarShape.standard),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${landmarkList[index].name}',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container();
                              },
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: const [
                          Text(
                            'Rivers',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: FutureBuilder(
                        future: Modeldata.allLandmarks(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<landmark>> snapshot) {
                          if (snapshot.hasData) {
                            var landmarkList = snapshot.data as List<landmark>;

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: landmarkList.length,
                              itemBuilder: (context, index) {
                                return landmarkList[index].category == 'Rivers'
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // _navKey.currentState!.push(MaterialPageRoute(
                                            //     builder: (context) =>
                                            //         listdata(landmarkList[index])));
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return listdata(
                                                    landmarkList[index]);
                                              },
                                            )).then((value) => setState(() {}));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GFAvatar(
                                                  radius: 80,
                                                  backgroundImage: AssetImage(
                                                      'image/${landmarkList[index].imageName}.jpg'),
                                                  shape:
                                                      GFAvatarShape.standard),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${landmarkList[index].name}',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container();
                              },
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.black,
                    title: const Text(
                      'Landmarks',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Favorites Only',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      GFToggle(
                        onChanged: (value) {
                          setState(() {
                            if (val) {
                              val = false;
                            } else {
                              val = true;
                            }
                          });
                        },
                        value: val,
                        type: GFToggleType.ios,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 695,
                    child: FutureBuilder(
                      future: Modeldata.allLandmarks(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<landmark>> snapshot) {
                        if (snapshot.hasData) {
                          List<landmark> landmarks = [];
                          if (val) {
                            print("test$val");
                            landmarks = snapshot.data!
                                .toList()
                                .where((element) => element.isFavorite == true)
                                .toList();
                          } else {
                            landmarks = snapshot.data as List<landmark>;
                          }
                          return ListView.builder(
                              itemCount: landmarks.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // _navKey.currentState!.push(MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         listdata(landmarks[index])));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              listdata(landmarks[index]),
                                        )).then((value) => setState(() {}));
                                  },
                                  child: Card(
                                    child: Container(
                                      color: Colors.grey,
                                      height: 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: AssetImage(
                                                'image/${landmarks[index].imageName}.jpg'),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${landmarks[index].name}',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(landmarks[index].isFavorite ==
                                                  true
                                              ? Icons.star
                                              : Icons.star_border),
                                          // Row(
                                          //   children: [
                                          //     landmarks[index].isFavorite==true?IconButton(onPressed: () {
                                          //
                                          //       landmarks[index].isFavorite=!landmarks[index].isFavorite;
                                          //       print(landmarks[index].isFavorite);
                                          //
                                          //
                                          //     }, icon: Icon(Icons.star)):
                                          //     IconButton(onPressed: ()  {
                                          //
                                          //       landmarks[index].isFavorite=!landmarks[index].isFavorite;
                                          //       print(landmarks[index].isFavorite);
                                          //
                                          //     }, icon: Icon(Icons.star_border))
                                          //   ],
                                          // ),
                                          const Icon(Icons.arrow_forward_ios),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/*return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Featured',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
          ),
          SizedBox(
            height: 250,
            child: FutureBuilder(
              future: Modeldata.favoriteLandmarks(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  var lanmarks = snapshot.data as List<landmark>;
                  return GFCarousel(
                    autoPlay: true,
                    hasPagination: true,
                    items: lanmarks
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: [
                                  Image.asset('image/${e.imageName}.jpg',
                                      fit: BoxFit.cover, width: 1000.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${e.name}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${e.park}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onPageChanged: (index) {
                      setState(() {
                        index;
                      });
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: const [
                Text(
                  'Lakes',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: Modeldata().landmarks,
              builder: (BuildContext context,
                  AsyncSnapshot<List<landmark>> snapshot) {
                if (snapshot.hasData) {
                  var landmarkList = snapshot.data as List<landmark>;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: landmarkList.length,
                    itemBuilder: (context, index) {
                      return landmarkList[index].category == 'Lakes'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return listdata(landmarkList[index]);
                                    },
                                  ));

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           listdata(landmarkList[index]),
                                  //     ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GFAvatar(
                                        radius: 80,
                                        backgroundImage: AssetImage(
                                            'image/${landmarkList[index].imageName}.jpg'),
                                        shape: GFAvatarShape.standard),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${landmarkList[index].name}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container();
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: const [
                Text(
                  'Mountains',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: Modeldata().landmarks,
              builder: (BuildContext context,
                  AsyncSnapshot<List<landmark>> snapshot) {
                if (snapshot.hasData) {
                  var landmarkList = snapshot.data as List<landmark>;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: landmarkList.length,
                    itemBuilder: (context, index) {
                      return landmarkList[index].category == 'Mountains'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // _navKey.currentState!.push(MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         listdata(landmarkList[index])));
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return listdata(landmarkList[index]);
                                    },
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GFAvatar(
                                        radius: 80,
                                        backgroundImage: AssetImage(
                                            'image/${landmarkList[index].imageName}.jpg'),
                                        shape: GFAvatarShape.standard),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${landmarkList[index].name}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container();
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          SizedBox(
            height: 30,
            child: Row(
              children: const [
                Text(
                  'Rivers',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: FutureBuilder(
              future: Modeldata().landmarks,
              builder: (BuildContext context,
                  AsyncSnapshot<List<landmark>> snapshot) {
                if (snapshot.hasData) {
                  var landmarkList = snapshot.data as List<landmark>;

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: landmarkList.length,
                    itemBuilder: (context, index) {
                      return landmarkList[index].category == 'Rivers'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  // _navKey.currentState!.push(MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         listdata(landmarkList[index])));
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return listdata(landmarkList[index]);
                                    },
                                  ));
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GFAvatar(
                                        radius: 80,
                                        backgroundImage: AssetImage(
                                            'image/${landmarkList[index].imageName}.jpg'),
                                        shape: GFAvatarShape.standard),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            '${landmarkList[index].name}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container();
                    },
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
    */
