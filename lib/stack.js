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
    //this.tail = node;
  } else {
    node.next = this.head;
    this.head = node;
  }
  this.length++
};

Stack.prototype.pop = function () {
  if (this.length == 0) throw "Empty"
  this.head = this.head.next;
  this.length--;
};

module.exports = Stack;
