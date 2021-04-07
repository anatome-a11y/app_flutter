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
          if (showButtons) _RetryButton(),
          if (!showButtons) Expanded(child: Container()),
          Text('Versão 0.1.4'),
          if (showButtons)
            _InformationButton(infoButtonPressed: infoButtonPressed),
          if (!showButtons) Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _InformationButton extends StatelessWidget {
  const _InformationButton({
    Key? key,
    required this.infoButtonPressed,
  }) : super(key: key);

  final Function()? infoButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}

class _RetryButton extends StatelessWidget {
  const _RetryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.white;
          },
        ),
      ),
      onPressed: () {},
      child: Icon(
        Icons.replay_outlined,
        color: Colors.grey[600],
      ),
    );
  }
}
