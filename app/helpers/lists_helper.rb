module ListsHelper
  def list_photo(list)
    list.photo.attached? ? cl_image_path(list.photo.key) : "https://images.unsplash.com/photo-1505775561242-727b7fba20f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
  end
end
