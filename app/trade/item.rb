=begin
 Authors: Maudlin Kummer 11-120-169
          Adrian Kurt 11-108-271
=end

class Item
  attr_accessor :price, :name, :state , :owner

  def initialize (name, price, owner)
    self.name= name
    self.price=price
    self.state= false
    self.owner=owner
  end

  def set_inactive
    self.state=false
  end

  def set_active
    self.state=true
  end

  def buyable?
    if (self.state == true) # AK this is unnecessary, just do
      true
    else
      false
    end
    # self.state # this
  end


end
