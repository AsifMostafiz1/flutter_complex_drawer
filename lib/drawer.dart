import 'package:flutter/material.dart';
import 'drawerList.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
        centerTitle: true,
      ),
      body: buildBody(),
      drawer: const MyDrawer(),
    );
  }

  Widget buildBody() {
    return const Center(
      child: Text('Drawer'),
    );
  }
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 1.5,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.amber, width: 2)),
        child: Column(
          children: [
            buildDrawerHeader(),
            Container(
              height: 1,
              width: double.maxFinite,
              color: Colors.grey,
            ),

            Expanded(child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                DrawerItem drawerList = drawerLists[index];
                List <String> submenuList = drawerList.submenus;

                return Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0,bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(width: 1,
                                height: submenuList.length * 30-10,
                                color: Colors.amber,),

                              const SizedBox(width: 50,),

                              SizedBox(height: submenuList.length * 32,
                                width: 150,
                                child: ListView.builder(itemBuilder: (BuildContext context,index){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(submenuList[index],style: const TextStyle(letterSpacing: .8),),
                                  );
                                },
                                  itemCount: submenuList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                )
                              ),

                            ]
                        ),
                      )
                    ],
                    //leading: Icon(Icons.email_outlined),
                    leading: Container(height: 25,width: 25,child: Image.asset(drawerList.icon,fit: BoxFit.cover,),
                    ),
                    title: Text(drawerList.title,style: const TextStyle(letterSpacing: 1,fontSize: 15),),
                    iconColor: Colors.amber,
                    textColor: Colors.amber,
                    collapsedTextColor: Colors.black,

                  ),
                );
              },
              itemCount: drawerLists.length,

            ),
            ),

            //Expanded(child: SizedBox(width: 100,))

          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20.0, bottom: 20),
      child: Row(
        children: [
          const Text(
            'Offers',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 20,),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrangeAccent, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                '25',
                style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
