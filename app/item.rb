class Item
  attr_accessor :price, :name, :state , :owner

  def initialize (name, price, owner)
    self.name= name
    self.price=price
    self.state= true
    self.owner=owner
  end

  def set_inactive
    self.state=false
  end

  def set_active
    self.state=true
  end


end