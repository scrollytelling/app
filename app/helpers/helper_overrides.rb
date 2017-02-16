module HelperOverrides
  # The Pageflow version includes the cname, which we find ugly.
  def pretty_entry_title(entry)
    entry.title
  end
end
