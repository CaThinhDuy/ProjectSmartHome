import 'package:flutter/material.dart';

class LoginSCreen extends StatelessWidget {
  const LoginSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    String mess = "";
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 300,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Tài khoản",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 5),
                    ),
                  ),
                  controller: username,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Mật khẩus",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  controller: password,
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize:MaterialStateProperty.all<Size>(const Size(200,50)), 
                  side: MaterialStateProperty.all<BorderSide>(
                    const BorderSide(color: Colors.blue, width: 2),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  // Xử lý sự kiện khi nhấn nút
                },
                child: const Text('Đăng nhập'),
              )
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(40)
              //   ),
              //   child: ElevatedButton(
              //     onPressed: (){},
              //    child: const Text("Đăng nhập")
              //    ),
              // )
            ])),
      ),
    );
  }
}//Thinh Ngu Bo lan 2000
