module PiggybakTaxonomy
  class SellableTaxonomy < ActiveRecord::Base
    belongs_to :navigation_node, :class_name => "::PiggybakTaxonomy::NavigationNode"
    belongs_to :sellable, :class_name => "::Piggybak::Sellable"
    default_scope { order('sort ASC') }
    
    validates_presence_of :sellable, :sort

    def admin_label
      self.sellable ? "#{self.sellable.description.gsub('"', '&quot;')} (#{self.sort})" : "New"
    end

    # TODO: Add as configuration
    # validate :single_assignment
    # def single_assignment
    #   if self.new_record? && !self.sellable.navigation_nodes.empty?
    #     self.errors.add(:sellable_id, "is already assigned to navigation node #{self.sellable.navigation_nodes.first.title}")
    #   end
    # end
  end
end
