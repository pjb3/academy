module ApplicationHelper
  def class_for(status:, disabled: false)
    if disabled
      :disabled
    elsif status == :complete
      'list-group-item-success'
    end
  end
end
