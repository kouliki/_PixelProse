import 'package:flutter/material.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            //padding: EdgeInsets.zero,
            // decoration: BoxDecoration(
            //   image: DecorationImage(image: AssetImage('lib/images/bg_6.jpeg'),fit: BoxFit.fill,opacity: 50,filterQuality: FilterQuality.high)
            // ),

            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(accountName: Text('Butterfly',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900,)), accountEmail: Text('App Developer',style: TextStyle(
                    fontSize: 18,fontWeight: FontWeight.bold
                ),),

                  currentAccountPicture: CircleAvatar(radius: 30,
                    child: ClipOval(child: Image.asset('lib/images/my_pic.jpeg',fit: BoxFit.cover,)),  // image kou
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('lib/images/texture_3.jpeg'),fit: BoxFit.cover)
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.account_circle,color: Colors.black,),
                    title: Text('profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    //  tileColor: Colors.grey,
////               profile section //////////

                    onTap: (){
                      // Navigator.pop(context);
                      // Navigator.push(
                      //   context, MaterialPageRoute(builder:(content) =>ProfilePage()),
                      // );
                    }
                ),
                ListTile(
                  leading: Icon(Icons.notifications,color: Colors.black,),
                  title: Text('notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: ()=> print('notifications'),
                ),
                ListTile(
                  leading: Icon(Icons.settings,color: Colors.black,),
                  title: Text('settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: ()=> print('settings'),
                ),
                ListTile(
                  leading: Icon(Icons.contact_support_rounded,color: Colors.black,),
                  title: Text('contact us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: ()=> print('log out'),
                ),
                ListTile(
                  leading: Icon(Icons.history,color: Colors.black,),
                  title: Text('History',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: ()=> print('log out'),
                ),
                ListTile(
                  leading: Icon(Icons.login,color: Colors.black,),
                  title: Text('log out',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onTap: ()=> print('log out'),
                ),


              ],
            ),

          ),
        )

    );
  }
}

