import 'dart:collection';

class Stack<T> {
  final _stack = Queue<T>();

  void push(T element) {
    _stack.addLast(element);
  }

  T pop() {
    T lastElement = _stack.last;
    if (_stack.isNotEmpty) {
      _stack.removeLast();
      return lastElement;
    }
  }

  List<T> toList() {
    List l = List<T>();
    for (var t in _stack) {
      l.add(t);
    }
    return l;
  }
}
