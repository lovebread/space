class GameCharacter < ActiveRecord::Base

  searcher_column :name

  belongs_to :user

  belongs_to :game

  belongs_to :area, :class_name => 'GameArea'

  belongs_to :server, :class_name => 'GameServer'

  belongs_to :race, :class_name => 'GameRace'

  belongs_to :profession, :class_name => 'GameProfession'

	belongs_to :guild

	acts_as_resource_feeds

  def validate
    if user_id.blank?
      errors.add_to_base("没有用户")
      return
    end

    if name.blank?
      errors.add_to_base("没有名字")
      return
    end

    if level.blank?
      errors.add_to_base("没有等级")
      return
    end

    if game_id_changed? or area_id_changed? or server_id_changed?    
    if game_id.blank?
      errors.add_to_base("没有游戏")
      return
    else
      game = Game.find(:first, :conditions => {:id => game_id})
      if game.blank?
        errors.add_to_base("游戏不存在")
        return
      else
        if game.no_areas
          if !area_id.blank?
            errors.add_to_base("服务区不应该有")
            return 
          elsif server_id.blank? 
            errors.add_to_base("没有服务器")
            return
          elsif GameServer.find(:first, :conditions => {:game_id => game_id, :id => server_id}).blank?
            errors.add_to_base("服务器不存在")
            return
          end
        else
          if area_id.blank?
            errors.add_to_base("没有服务区")
            return
          else
            area = GameArea.find(:first, :conditions => {:game_id => game_id, :id => area_id})
            if area.blank?
              errors.add_to_base("服务区不存在")
              return
            elsif server_id.blank?
              errors.add_to_base("没有服务器")
              return
            elsif GameServer.find(:first, :conditions => {:game_id => game_id, :area_id => area_id, :id => server_id}).blank?
              errors.add_to_base("服务器不存在")
              return
            end
          end
        end
        
        if game.no_races
          if !race_id.blank?
            errors.add_to_base("种族不应该有")
            return
          end
        else
          if race_id.blank?
            errors.add_to_base("没有种族")
            return
          elsif GameRace.find(:first, :conditions => {:game_id => game_id, :id => race_id}).blank?   
            errors.add_to_base("种族不存在")
            return
          end
        end
        
        if game.no_professions
          if !profession_id.blank?
            errors.add_to_base("职业不应该有")
            return
          end
        else
          if profession_id.blank?
            errors.add_to_base("没有职业")
            return
          elsif GameProfession.find(:first, :conditions => {:game_id => game_id, :id => profession_id}).blank?
            errors.add_to_base("职业不存在")
            return
          end
        end
      end
    end
    end

  end

end
