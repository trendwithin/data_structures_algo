function BinarySearchTree() {
  this.root = null;
  this.size = 0;
  this.depth = 0;
};

BinarySearchTree.prototype.node = function(val){
  this.size++
  return{
    val: val,
    left: null,
    right: null
  };
};

BinarySearchTree.prototype.insert = function(node){
  if(this.root === null){
    this.root = node;
  }
  else{
    this.insertNode(this.root, node);
  }
  root
};

BinarySearchTree.prototype.insertNode = function(node, current){
  if(current.val < node.val) {
    if(node.left === null) {
      node.left = current;
    } else{
      this.insertNode(node.left, current);
    }
  } else{
    if(node.right === null){
      node.right = current;
    } else {
      this.insertNode(node.right, current);
    }
  }
};

BinarySearchTree.prototype.contains = function(val) {
  var found = false;
  current = this.root;

  while (!found && current) {
    if (val < current.val){
      current = current.left;
    } else if (val > current.val){
      current = current.right;
    } else {
      found = true;
    }
  }
  return found;
}
BinarySearchTree.prototype.deep = function(node){
  if (node == null){
    return 0;
   }
  var left_count = this.deep(node.left);
  var right_count = this.deep(node.right);
  return left_count > right_count ? left_count + 1 : right_count + 1;
}

BinarySearchTree.prototype.balanced = function(node){
  var left_height;
  var right_height;

  if (node == null){
    return 1;
  }
  left_height = this.deep(node.left);
  right_height = this.deep(node.right);

  if (Math.abs(left_height - right_height) <= 1 &&
    this.balanced(node.left) && this.balanced(node.right)){
    return 1;
  }
  else{
  return 0;
  }
}
module.exports = BinarySearchTree;

