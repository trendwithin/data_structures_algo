function Stack() {
  this.length = 0;
  this.head = null;
  this.tail = null;
};

Stack.prototype.node = function (val) {
  return {
    val: val,
    next: null
  };
};

Stack.prototype.push = function (n) {
  var node = n
  if(this.length == 0) {
    this.head = node;
  } else {
    node.next = this.head;
    this.head = node;
  }
  this.length++
};

Stack.prototype.pop = function () {
  if (this.length == 0) throw "Empty"
  var del = this.head;
  this.head = this.head.next;
  this.length--;
  return del;
};

module.exports = Stack;
