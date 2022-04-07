ActiveAdmin.register Game do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :game_name, :price, :description, :role, :publisher_id, :image

  #DSL - Domain Specific language - easy way to implment something using code like syntax without writing
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute


    f.inputs do
      f.input :image, as:  :file, hint: f.object.image.present? ? image_tag(f.object.image, size: "200x200") : ""
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
end
