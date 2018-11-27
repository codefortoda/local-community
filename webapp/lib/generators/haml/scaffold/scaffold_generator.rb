require "rails/generators/erb/scaffold/scaffold_generator"
# erb 用の generator を継承する
class Haml::ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
  source_root File.expand_path('../templates', __FILE__)

  protected
  def handler
    :haml
  end
end
