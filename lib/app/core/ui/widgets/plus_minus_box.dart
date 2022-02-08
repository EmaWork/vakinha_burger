import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_rouded_button.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevation;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    Key? key,
    required this.quantity,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.elevation = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                VakinhaRoudedButton(
                  onPressed: () {
                    minusCallback();
                  },
                  label: '-',
                ),
                Text('$quantity'),
                VakinhaRoudedButton(
                  onPressed: () {
                    plusCallback();
                  },
                  label: '+',
                ),
              ],
            ),
            Visibility(
              visible: label == null,
              child: const Spacer(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 10),
              constraints: const BoxConstraints(minHeight: 70),
              alignment: Alignment.center,
              child: Text(
                FormatterHelper.formatCurrency(
                  calculateTotal ? price * quantity : price,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
