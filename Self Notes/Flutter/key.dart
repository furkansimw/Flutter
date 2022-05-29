//key with widget get size and position

GlobalKey _widgetKey = const GlobalKey();

void _getWidgetInfo(_) {
    final RenderBox renderBox = _widgetKey.currentContext?.findRenderObject() as RenderBox;
 
    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    print('Size: ${size.width}, ${size.height}');
 
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    print('Offset: ${offset.dx}, ${offset.dy}');
    print('Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  }
