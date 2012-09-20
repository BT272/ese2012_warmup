class User

  # Maudlin Kummer 11-120-269
  # Adrian Kurt 11-108-271

  attr_accessor :name, :credits, :items

  def self.named( name )
    user = self.new (name)
    user
  end

  def initialize (name)
    self.name = name
    credits = 100
    self.items= Array.new
  end

  def to_s
    self.name
  end

  def payable (amount)?
    if (credits - amount >=0)
       true
    end
    if (credits - amount < 0)
      false
    end
  end

  def pay (amount)
    credits -= amount
  end

  def item_add (item)
     items.push(item)
  end

  def item_remove (item)
    items.delete(item)
  end




end