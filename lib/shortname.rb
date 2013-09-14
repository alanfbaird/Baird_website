def shortname
  if @item[:shortname].nil?
    @item[:shortname]=@item[:title]
  else
    @item[:shortname]
  end
end