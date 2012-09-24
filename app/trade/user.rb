=begin
 Authors: Maudlin Kummer 11-120-169
          Adrian Kurt 11-108-271
=end

class User
  attr_accessor :name, :credits, :items

  def self.named( name )
    user = self.new(name)
    user
  end

  def initialize(name)
    self.name = name
    self.credits = 100
    self.items= Array.new
  end

  def to_s
    self.name
  end

  def payable?(amount)
    if (self.credits - amount >=0)
       true
    else
      false
    end
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
    item.set_inactive
  end

  def add_item_to_system (item, price)
    item_add(Item.new(item, price, self.name))
  end

  def buy_from (item, user)
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

  def list_active_items
    s = String.new("Active items:")
    for i in 0..(self.items.length-1)
      if (self.items.slice(i).state == true)
        s = s + "#{self.items.slice(i).name}" + "\n"
      end
    end
    s
  end
end