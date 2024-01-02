import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TowerOfHanoi(),
    );
  }
}

class TowerOfHanoi extends StatefulWidget {
  const TowerOfHanoi({Key? key}) : super(key: key);

  @override
  State<TowerOfHanoi> createState() => _TowerOfHanoiState();
}

class _TowerOfHanoiState extends State<TowerOfHanoi> {
  TextEditingController c1 = TextEditingController();
  int x = 0;

  Map<int, Color> tower = {
    1: Colors.purple,
    2: Colors.red,
    3: Colors.green,
    4: Colors.yellow,
    5: Colors.blue,
    6: Colors.black,
    7: Colors.orange,
    8: Colors.lightGreen,
    9: Colors.indigoAccent,
    10: Colors.pinkAccent,
  };

  List<List<int>> towersList = [
    [1, 2, 3, 4, 5, 6,7,8,9,10],
    [],
    []
  ];

  int selectedDisk = 0;

  double diskSize=12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tower of Hanoi")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Container(
              width: selectedDisk * diskSize,
              decoration: BoxDecoration(
                  color: tower[selectedDisk],
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 10,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(towersList.length, (index) {
                List<int> myTower = towersList[index];
                return MyTower(
                  diskSize: diskSize,
                  towerData: tower,
                  towerList: myTower,
                  onClick: () {
                    if (selectedDisk == 0) {
                      if (towersList[index].isNotEmpty) {
                        selectedDisk = towersList[index].first;
                        towersList[index].removeAt(0);
                      }
                    } else {
                      if (towersList[index].isEmpty) {
                        towersList[index].insert(0, selectedDisk);
                        selectedDisk = 0;
                      } else if (towersList[index].first > selectedDisk) {
                        towersList[index].insert(0, selectedDisk);
                        selectedDisk = 0;
                      }else{
                        const snackBar = SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('Bigger Disk cannot be stacked on smaller disk'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      }
                    }
                    print("Selected Disk is $selectedDisk");
                    setState(() {});
                    print(towersList);
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class MyTower extends StatelessWidget {
  final Map<int, Color> towerData;
  final List<int> towerList;
  final VoidCallback onClick;
  final double diskSize;

  const MyTower({Key? key, required this.towerData, required this.towerList, required this.onClick, required this.diskSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: onClick,
          child: Container(
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height * .5,
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                  towerList.length,
                  (index) => Container(
                    width: towerList[index] * diskSize ,
                    height: 10,
                    decoration: BoxDecoration(
                      color: towerData[towerList[index]],
                      borderRadius: BorderRadius.circular(10)
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
