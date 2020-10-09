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
        child.parent = self
    end

    def inspect
        "#{@value} #{@parent} #{@children}"
    end

    def remove_child(child)
        raise "Node is not a child" if !self.children.include?(child) 
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
        
        self.children.each do |child| 
            result = child.dfs(target)
            return result unless result.nil? 
        end

        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            cur_node = queue.shift
            return cur_node if cur_node.value == target
            queue += cur_node.children
        end
        nil
    end
end

# class Searchable
#     def dfs(node, target)
#         return node if node.value == target
#         self.each do |n|
#             dfs(node.children)
#         end
#     end
# end