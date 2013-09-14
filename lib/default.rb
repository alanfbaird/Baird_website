
require "nanoc/toolbox"

# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::Tagging
include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::LinkTo
include Nanoc3::Helpers::Breadcrumbs

# Helpers of the nanoc-toolbox
include Nanoc::Toolbox::Helpers::GoogleAnalytics




module PostHelper
  def get_pretty_date(post)
    attribute_to_time(post[:mtime]).strftime('%-d %B, %Y %H:%M %Z')
  end
end

include PostHelper




#def item_tree(item, options = {})
#  crumb = item[:crumb] || item[:title]
#  options[:heading_level] ||= 1 if options.fetch(:headings, true)
#  child_html = ""
#  if options.fetch(:depth,1) > 0
#    child_opts = options.dup
#    child_opts[:depth] -= 1 if child_opts.has_key?(:depth)
#    child_opts[:heading_depth] -= 1 if child_opts.has_key?(:heading_depth)
#    child_opts[:heading_level] += 1 if child_opts[:heading_level]
#    child_opts.delete(:omit_self)
#    item.children.sort_by{|c| c[:crumb] || c[:title]}.each do |child|
#      next if child[:navigable] == false
#      child_html << item_tree(child, child_opts)
#    end
#  else
#    options.delete(:heading_level)
#  end
#  child_html = render("partials/sidebar/container", :contents => child_html) unless child_html.size == 0
#  css_class = nil
#  contents = unless options[:omit_self]
#    item_opts = {
#      :current_item => item,
#      :selected => !!@item.identifier[item.identifier],
#      :crumb => item[:crumb] || item[:title]
#    }
#    if options[:heading_level] && (options.fetch(:heading_depth, 1) > 0)
#      render("partials/sidebar/heading",
#        item_opts.merge(:heading => "h#{options[:heading_level]}")
#      )
#    else
#      render("partials/sidebar/item", item_opts)
#    end
#  end
#  %Q{#{contents}#{child_html}}
#end
