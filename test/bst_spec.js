module.paths.push('/usr/local/libs/node_modules');
var expect = require('chai').expect;
var BinarySearchTree = require('../lib/binary_search_tree.js');

describe ('BinarySearchTree', function(){

  var bst = new BinarySearchTree();
  var n = bst.node(10);

  it ('should have a null root', function() {
    expect(bst).to.have.property('root').that.equals(null);
  })

  it ('should have a node with null left and right', function(){
    expect(n.val).to.eql(10);
    expect(n.left).to.eql(null);
    expect(n.right).to.eql(null);
  })

  it ('should insert the new node', function(){
    bst.insert(n);
  })

  it ('should insert a second node to left', function() {
    o = bst.node(5);
    bst.insert(o);
    expect(n.left.val).to.eql(o.val);
  })

  it ('should insert a third node to right', function() {
    p = bst.node(15);
    bst.insert(p);
    expect(n.right.val).to.eql(p.val);
  })

  it ('should insert a fourth node to the left', function() {
    q = bst.node(1);
    bst.insert(q);
    expect(o.left.val).to.eql(q.val);
  })

  it ('should insert 7 to the right of 5', function() {
    r = bst.node(7);
    bst.insert(r);
    expect(o.right.val).to.eql(r.val);
  })

  it ('should have return true searching for 5', function () {
    bst.contains(5);
    expect(bst.contains(5)).to.eql(true);
  })

  it ('should return undefined if searching for nunber not there', function() {
    expect(bst.contains(20)).to.eql(false);
  })

  it ('should return 5 for current size', function(){
    expect(bst.size).to.eql(5);
  })

  it('should return depth', function(){
    expect(bst.deep(n)).to.eql(3);
  })

  it('should test for balance', function(){
    expect(bst.balanced(n)).to.eql(1);
  })

  it ('should return imbalanced if so', function(){
    a = bst.node(35);
    e = bst.node(100);
    bst.insert(e);
    bst.insert(a);
    expect(bst.balanced(n)).to.eql(0);
  })
});
