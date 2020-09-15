import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/qna_heading.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/qna_layout.dart';
import 'package:skite_buyer/styles/colors.dart';

class ProductQnas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15),
      margin: EdgeInsets.only(bottom: 50),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QnaHeading(
            heading: 'Questions and Answers',
          ),
          Column(
            children: product.productQnas
                .map((qna) => QnaLayout(
                      question: {
                        'text': qna['qsn'],
                        'date': qna['qsn_date'],
                        'name': product.getQnamesLocal(qna['customer_uid'])
                      },
                      answer: {'text': qna['ans'], 'date': qna['ans_date']},
                      index: product.productQnas.indexOf(qna),
                      length: product.productQnas.length,
                    ))
                .toList(),
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Ask a question',
                style: GoogleFonts.openSans(
                  color: AppColors().primaryBlue(),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
