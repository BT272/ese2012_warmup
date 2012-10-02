=begin
 Authors: Maudlin Kummer 11-120-169
          Adrian Kurt 11-108-271
=end

class User
  attr_accessor :name, :credits, :items

  def self.named( name )
    user = self.new(name) # AK you could just do
    user
    # self.new(name) # this
  end

  def initialize(name)
    self.name = name
    self.credits = 100
    self.items= Array.new # AK prefer the empty array literal `[]`
  end

  def to_s
    self.name
  end

  def payable?(amount)
    if (self.credits - amount >=0) # AK again, this can be simplified
       true
    else
      false
    end
    # self.credits >= amount # like this
  end

  def pay(amount)
    self.credits -= amount
  end

  def receive_money(amount)
    self.credits += amount
  end

  def item_add (item)
    self.items.push(item)
  end

  def item_remove(item)
    self.items.delete(item)
  end

  def activate_for_sale(item)
     item.set_active
  end

  def deactivate(item)
    item.set_inactive # AK aliasses! that's the ruby spirit ^^
  end

  def add_item_to_system (item, price)
    item_add(Item.new(item, price, self.name)) # AK Why add the name and not the reference?
  end

  def buy_from (item, user)
    # AK I read once, that you should return as early as possible, because it
    # reduces the complexity of the code. In this example, I would write
    #
#    fail 'Not for sale' if not item.buyable?
#    fail 'Not enough money' if not payable?(item.price)
#
#    user.item_remove(item)
#    pay(item.price)
#    user.receive_money(item.price)
#    item_add(item)
#    item.owner = self.name
#    deactivate(item)
    # so that it takes the special cases right out of the way and
    # clears everything for the interesting case.

    if (item.buyable? == true)
      if (self.payable?(item.price) == true)
        user.item_remove(item)
        pay(item.price)
        user.receive_money(item.price)
        item_add(item)
        item.owner = self.name
        deactivate(item)
      else
        puts 'Sorry, but you don\'t have enough money to buy the item.'
      end
    else
      puts 'Sorry, but the item isn\'t for sale.'
    end
  end

  # AK this should return an array
  def list_active_items
    s = String.new("Active items:")
    for i in 0..(self.items.length-1) # AK iterate over arrays, not indeces
      if (self.items.slice(i).state == true) # use items[i] instead of slice
        s = s + "#{self.items.slice(i).name}" + "\n"
      end
    end
    s
    # AK This is a common pattern and therefore, there's a method for that:
#    self.items \
#      .select{|i| i.state} \ # filters the items
#      .collect{|i| i.name} \ # gives the name for each remaining item
#      .join("\n")            # makes a string with "\n" between the items
    # Of course, you could use immediate variables too, but I got used to
    # reading such a "functional style"
  end
end
