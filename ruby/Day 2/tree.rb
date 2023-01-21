class Tree
  attr_accessor :name, :children

  def initialize(hash_structure)
    p hash_structure
    name_key, serialized_children = hash_structure.first
    @name = name_key.to_s
    @children =
      serialized_children.map { |key, value| Tree.new({ key => value }) }
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    block.call self
    @children.each { |child| child.visit_all(&block) }
  end

  def to_s
    @name
  end
end

tree = Tree.new({ 'root' => { 'l' => {}, 'r' => { 'rl' => {}, 'rr' => {} } } })
tree.visit_all { |a| p a }
