module User::CommentsHelper

  def comment_deletable_by_current_user comment
    commentable = comment.commentable
    case commentable.class.name.underscore
      when 'event'    then  (current_user == commentable.poster)
      when 'guild'    then  (current_user == commentable.president)
    end  
  end

end
