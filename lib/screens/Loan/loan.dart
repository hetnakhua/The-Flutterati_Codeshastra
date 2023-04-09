import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/models/loan.dart' as L;
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:flutterati_codeshastra/screens/Loan/widgets/debt_item_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loan extends StatefulWidget {
  const Loan({super.key});

  @override
  State<Loan> createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController emiPerMonthController = TextEditingController();
  TextEditingController daysLeftController = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: raisinBlack,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Loan",
          style: TextStyle(color: white),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "My Loans",
              style: GoogleFonts.outfit(fontSize: 20),
            ),
          ),
          StreamBuilder(
              stream: homeController.getUserLoanDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => DebtItemWidget(
                    debt: snapshot.data![index],
                  ),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: 400,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // heading
                            RichText(
                              text: TextSpan(
                                // style: TextStyle(color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Category ',
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -7.0),
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            // textfield
                            TextField(
                              keyboardType: TextInputType.text,
                              controller: categoryController,
                              decoration: InputDecoration(
                                hintText: "Category",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[150],
                                filled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // heading
                            RichText(
                              text: TextSpan(
                                // style: TextStyle(color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Amount ',
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -7.0),
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),

                            // textfield
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: amountController,
                              decoration: InputDecoration(
                                hintText: "Amount",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[150],
                                filled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // heading
                            RichText(
                              text: TextSpan(
                                // style: TextStyle(color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'EMI ',
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -7.0),
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            // textfield
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: emiPerMonthController,
                              decoration: InputDecoration(
                                hintText: "EMI",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[150],
                                filled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // heading
                            RichText(
                              text: TextSpan(
                                // style: TextStyle(color: Colors.black, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Tenure ',
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0.0, -7.0),
                                      child: Text(
                                        '*',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 11),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8),
                            // textfield
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: daysLeftController,
                              decoration: InputDecoration(
                                hintText: "Tenure in Days",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[150],
                                filled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ));
                            L.Loan loan = L.Loan(
                                daysLeft: int.parse(daysLeftController.text),
                                totalAmount: int.parse(amountController.text),
                                categoryName: categoryController.text,
                                emiPerMonth:
                                    int.parse(emiPerMonthController.text));
                            homeController.addLoan(loan: loan);

                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: midnightGreenLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )

                        //submit(context, _category.text.trim(), _amount.text),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
