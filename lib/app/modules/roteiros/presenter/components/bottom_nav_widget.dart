import "package:flutter/material.dart";

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.white;
                    },
                  ),
                ),
                onPressed: () {},
                child: Icon(Icons.replay_outlined, color: Colors.grey[600])),
            Text('Versão 0.1.4', style: TextStyle(color: Colors.grey[600])),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return Colors.white;
                    },
                  ),
                ),
                onPressed: () {},
                child: Icon(Icons.info_outline, color: Colors.grey[600]))
          ],
        ),
      );
  }
}
