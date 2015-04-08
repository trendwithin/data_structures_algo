module.paths.push('/usr/local/libs/node_modules');
var expect = require('chai').expect;
var Stack = require('../lib/stack.js');

describe ('Stack', function(){

  var stacked = new Stack();
  console.log(stacked);

  it ('should have a lenght of 0, head/tail null', function() {
    console.log(stacked.length);
    expect(stacked).to.have.property('length').that.equals(0);
    expect(stacked).to.have.property('head').that.equals(null);
    expect(stacked).to.have.property('tail').that.equals(null);
  })

  it ( 'should make a new node', function() {
    var n = stacked.node(1);

    expect(n).to.have.property('val').that.equals(1);
    expect(n).to.have.property('next').that.equals(null);
  })

  it ( 'should be able to push node onto stack', function() {
    var n = stacked.node(1);
    stacked.push(n);

     expect(stacked).to.have.property('length').that.equals(1);
     //expect(n.next).to_eql(null);
  })

  it ( 'should have the value 1 as next after adding another node', function() {
    var n = stacked.node(2);
    stacked.push(n);
    expect(stacked).to.have.property('length').that.equals(2);
    expect(n.next.val).to.eql(1);
  })

  it ( 'should have 2 as the next value after adding a node', function() {
    var n = stacked.node(10);
    stacked.push(n);
    expect(stacked).to.have.property('length').that.equals(3);
    expect(n.next.val).to.eql(2);
  })

  it ( 'should remove the last item placed', function() {
    stacked.pop();
    expect(stacked).to.have.property('length').that.equals(2);
    expect(stacked.head.val).to.eql(2);
  })
});
