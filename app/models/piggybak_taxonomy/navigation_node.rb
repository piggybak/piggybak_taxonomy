module PiggybakTaxonomy
  class NavigationNode < ActiveRecord::Base
    has_many :sellable_taxonomies, :class_name => "::PiggybakTaxonomy::SellableTaxonomy"
    has_many :sellables, :through => :sellable_taxonomies, :class_name => "::Piggybak::Sellable"
    accepts_nested_attributes_for :sellable_taxonomies, :allow_destroy => true
   # attr_accessible :title, :slug, :position, :sellable_taxonomies_attributes #sellables_ids, :sellables

    validates :title, presence: true
    validates :slug, presence: true

    # UPGRADE TODO 
    # validates_format_of :slug, :with => /^[a-z_]+$/

    has_ancestry

    def nav_path
      "#{self.path.collect { |n| n.slug }.join('/')}"
    end
    def full_path
      "/n/#{self.nav_path}"
    end

    def recursive_sellables
      results = self.sellables.clone
      self.children.each do |child|
        results << child.recursive_sellables
      end
      results.flatten.uniq
    end
    # TODO: Add configuration for setting per page
    def paginated_sellables(page, per = 10)
      Kaminari.paginate_array(self.recursive_sellables).page(page).per(per)
    end
  end
end
