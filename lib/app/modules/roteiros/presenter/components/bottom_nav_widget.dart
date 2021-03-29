import "package:flutter/material.dart";

class BottomNav extends StatelessWidget {
  final Function()? infoButtonPressed;
  final bool showButtons;

  const BottomNav({Key? key, this.infoButtonPressed, required this.showButtons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showButtons)
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
          if (!showButtons) Expanded(child: Container()),
          Text(
            'Versão 0.1.4',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          if (showButtons)
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.white;
                  },
                ),
              ),
              onPressed: infoButtonPressed,
              child: Icon(
                Icons.info_outline,
                color: Colors.grey[600],
              ),
            ),
          if (!showButtons) Expanded(child: Container()),
        ],
      ),
    );
  }
}
