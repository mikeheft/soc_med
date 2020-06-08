require 'blueprinter/base'

class BaseBlueprint < Blueprinter::Base
  identifier :id
  fields :owner_id, :owner_type, :target_id, :target_type
end