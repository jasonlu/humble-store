module ApplicationHelper

def tab(value)
  @page_tab = value
end

def generate_uuid
  uuid = UUID.new
  self.uuid = uuid.generate
end

end
