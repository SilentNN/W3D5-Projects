class PolyTreeNode
    attr_reader :value, :parent, :children
    # TODO: mark private maybe

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        return if self.parent == new_parent
        if self.parent
            self.parent.children.delete(self)
        end
        @parent = new_parent 
        new_parent.children << self unless self.parent.nil?
    end

    def add_child(child)

    end
end