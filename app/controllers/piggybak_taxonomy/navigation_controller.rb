module PiggybakTaxonomy
  class NavigationController < ApplicationController
    def show
      paths = params[:path].split('/')
      nodes = recursive_path(paths, [])
      if nodes.empty?
        redirect_to main_app.root_url, :status => 301
      elsif nodes.size != params[:path].split('/').size
        redirect_to piggybak_taxonomy_url(:path => nodes.last.nav_path), :status => 301 
      end
      @node = nodes.last
    end

    def recursive_path(paths, nodes)
      return nodes if paths.empty?
      first = paths.shift
      node = NavigationNode.where(slug: first).first
      if node && (nodes.empty? || node.parent == nodes.last) && !(nodes.empty? && !node.parent.nil?)
        nodes << node
        nodes = recursive_path(paths, nodes) 
      end
      return nodes
    end
  end
end
