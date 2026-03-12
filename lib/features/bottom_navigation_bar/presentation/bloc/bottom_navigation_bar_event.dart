abstract class BottomNavEvent {}

class ChangeTabEvent extends BottomNavEvent {
  final int selectedIndex;
  ChangeTabEvent({this.selectedIndex = 0});
}
