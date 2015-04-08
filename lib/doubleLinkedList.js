
function DoubleLinkedList () {
  this.length = 0;
  this.head = null;
  this.tail = null;
};

DoubleLinkedList.prototype.node = function (val) {
  return {
    val:   val,
    nexxt: null,
    prev:  null
  };
}

DoubleLinkedList.prototype.addition = function (n) {

  var node = n

  if (this.length === 0) {
    this.head = node;
    this.tail = node;
  } else {
    this.tail.nexxt = node;
    node.prev = this.tail;
    this.tail = node;
  }

  this.length++;
  //console.log(this.tail);

  return node;
};

DoubleLinkedList.prototype.remove = function(n) {
  var value = n;
  var node = this.head;
  if (this.length > 0) {

    if (this.length == 1) {
      var del = node.nexxt;
      node.nexxt = tail;
      node.nexxt.prev = null;
      return del;
    }

    while(node != null) {

      if (node.val == value) {
        var del = node.val;
        node.nexxt.prev = node.prev;
        node.prev.nexxt = node.nexxt;
        node.prev = null;
        node.nexxt = null;

      }
       node = node.nexxt
    }
    this.lenght -= 1;
    return del
  }
}
DoubleLinkedList.prototype.to_s = function (dbl){
  while (this.length > 0){
    console.log(dbl.val);
    length -= 1;
  }
};

DoubleLinkedList.prototype.search = function (value) {
  var value = value;
  var node = this.head;
  //console.log(value);
  if (this.length > 0) {
    while (node != null) {

      if (node.val == value) {
        return value;
      }
      node = node.nexxt
    }
  }
};

module.exports = DoubleLinkedList;
