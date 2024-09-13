import 'package:bmi_flutter/diet_plan.dart';
import 'package:bmi_flutter/splash_screen.dart';
import 'package:flutter/material.dart';
//add other units option also plus dont let user put text in the text form field let them number only
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();

  var ftController = TextEditingController();

  var inController = TextEditingController();

  var result = "";

  var bgcolor = Colors.orange.shade200 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Center(child: Text('BMI APP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) ,)),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Your Name'), // Customize with user's name
              accountEmail: Text('your@email.com'), // Customize with user's email
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_image.jpg'), // Add user's profile image
              ),
            ),

            ListTile(
              title: const Text('Diet Plan'),
              onTap: () {

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DietPlan()));
              },
            ),



          ],
        ),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Calculate your BMI Here'),
                const SizedBox(height: 15, ),
                TextFormField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('enter your weight (in kg)'),
                        prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                // Image(image: Image.asset('assets/images/'))
                 SizedBox(height: 15,),
                TextFormField(
                  controller: ftController,

                  decoration: const InputDecoration(
                    label: Text('enter your height (in feet)'),
                    prefixIcon: Icon(Icons.arrow_upward),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11,),
                TextFormField(
                  controller: inController,
                  decoration: const InputDecoration(
                    label: Text('Enter your height (in inches)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 25,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!= ""&& ft!= ""&& inch!= ""){
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);
//wt*1? //convert to int
                    var tInch = (iFt*12)+ iInch;
                     var tCm = tInch*2.54;
                     var tM = tCm/100;
                     var bmi = iWt/(tM*tM);
                    var mgs = "";
                     if(bmi>25){
                       mgs = "you are over weight";
                       bgcolor = Colors.orange.shade200;

                     }
                     else if (bmi<18){
                       mgs = "you are under weight";
                       bgcolor = Colors.red.shade200;
                     }
                     else{
                       mgs = "you are healthy";
                       bgcolor = Colors.green.shade200;
                     }

                     setState(() {
                       result = '$mgs \n your bmi is: ${bmi.toStringAsFixed(2)}';
                     });

                  }
                  else{
                    setState(() {
                      result='Please enter all the required fields';
                    });
                  }
                }, child: const Text('Calculate')),
                 Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

