
module.paths.push('/usr/local/lib/node_modules');
var expect = require('chai').expect;
var DoubleLinkedList = require('../lib/doubleLinkedList.js');


describe('New Double Link List', function() {
  var dbl = new DoubleLinkedList();

  it('should have a length 0, head/tail null', function() {
    // var dbl = new DoubleLinkedList();

    expect(dbl).to.have.property('length').that.equals(0);
    expect(dbl).to.have.property('head').that.equals(null);
    expect(dbl).to.have.property('tail').that.equals(null);
  })

  it ('should have a new Node', function() {
    // var dbl = new DoubleLinkedList();
    var n = dbl.node(2);

    expect(n).to.have.property('val').that.equals(2);
    expect(n).to.have.property('nexxt').that.equals(null);
    expect(n).to.have.property('prev').that.equals(null);

  })

  it ('should add a new Node', function () {
    var n = dbl.node(2);
    dbl.addition(n);
    expect(dbl).to.have.property('length').that.equals(1);
    expect(n.nexxt).to.eql(null);
    expect(n.prev).to.eql(null);
  })

  it ('should have two elements', function () {
    //var m = dbl.node(2);
    expect(dbl).to.have.property('length').that.equals(1);
    var n = dbl.node(3);
    //dbl.addition(m);
    dbl.addition(n);
    expect(dbl).to.have.property('length').that.equals(2);
    expect(n.nexxt).to.eql(null);
    expect(n.prev.val).to.eql(2);
  })

  it ( 'should have three elements', function() {
    var n = dbl.node(10);
    dbl.addition(n);
    expect(dbl).to.have.property('length').that.equals(3);
    expect(n.nexxt).to.eql(null);
    expect(n.prev.val).to.eql(3);
  })

  it (' should be able to search for a value and return nil if not found', function() {
    var value = dbl.search(3);
    expect(value).to.eql(3);
    var value = dbl.search(11);
    expect(value).to.eql(undefined);
  })

  it ('should be able to remove a value', function() {
    var value = dbl.remove(3);
    expect(value).to.eql(3);
    //expect(dbl.length).to.eql(2);
    var va = dbl.search(3);
    expect(va).to.eql(undefined);
  })

  it ( 'should print out the values', function() {

  })

})
