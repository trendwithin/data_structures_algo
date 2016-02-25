module OddlyEven
  class << self

    def initialize
      @ll_odds = nil
      @ll_evens = nil
    end

    def separate_odds_from_evens ll
      return nil if ll.nil?
      return [ll] if ll.next.nil?
      until ll.nil?
        @ll_odds.nil? ? @ll_odds = Node.new(ll.val)  : @ll_odds.next = Node.new(ll.val)
        @ll_evens.nil? ? @ll_evens = Node.new(ll.next.val) : @ll_evens.next = Node.new(ll.next.val)
        ll = ll.next.next
      end
      [@ll_odds, @ll_evens]
    end
  end
end

class Node
  attr_accessor :val, :next

  def initialize val
  @val = val
  @next = nil
  end
end
