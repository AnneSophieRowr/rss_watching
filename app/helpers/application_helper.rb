module ApplicationHelper

  def users
    User.all.collect {|u| [u.decorate.name, u.id]}
  end

  def feeds
    Feed.all.collect {|f| [f.name.capitalize, f.id]}
  end

end
