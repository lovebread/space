class AddGameCharacters < ActiveRecord::Migration
  def self.up
    wow = Game.create(
		:name => "world of warcraft",
		:sale_date => "2009-5-1",
		:company => "blizzard",
		:description => "best online game ever")
    stone_age = Game.create(
		:name => "stone age",
		:sale_date => "2008-5-3",
		:company => "chinese gamer",
		:description => "worst online game ever")
    wow_a1 = GameArea.create(
		:name => "wow land 1",
		:game_id => wow.id)
    wow_a2 = GameArea.create(
		:name => "wow land 2",
		:game_id => wow.id)
    sa_a1 = GameArea.create(
		:name => "stone age land 1",
		:game_id => stone_age.id)
    sa_a2 = GameArea.create(
		:name => "stone age land 2",
		:game_id => stone_age.id)
    wow_a1_s1 = GameServer.create(
		:name => "land 1 server 1",
		:game_id => wow.id,
		:area_id => wow_a1.id,
		:ip => "59.66.130.101")
    wow_a1_s2 = GameServer.create(
		:name => "land 1 server 2",
		:game_id => wow.id,
		:area_id => wow_a1.id,
		:ip => "59.66.130.102")
    wow_a2_s1 = GameServer.create(
		:name => "land 2 server 1",
		:game_id => wow.id,
		:area_id => wow_a2.id,
		:ip => "23.123.34.21")
    sa_a1_s1 = GameServer.create(
		:name => "land 1 server 1",
		:game_id => stone_age.id,
		:area_id => sa_a1.id,
		:ip => "45.132.64.32")
    sa_a2_s1 = GameServer.create(
		:name => "land 2 server 1",
		:game_id => stone_age.id,
		:area_id => sa_a2.id,
		:ip => "34.45.56.67")
    sa_a2_s2 = GameServer.create(
		:name => "land 2 server 2",
		:game_id => stone_age.id,
		:area_id => sa_a2.id,
		:ip => "23.34.45.56")
    human = GameRace.create(
		:name => "human",
		:game_id => wow.id)
    undead = GameRace.create(
		:name => "undead",
		:game_id => wow.id)
    elf = GameRace.create(
		:name => "elf",
		:game_id => wow.id)
    orc = GameRace.create(
		:name => "orc",
		:game_id => wow.id)
    dwarf = GameRace.create(
		:name => "dwarf",
		:game_id => stone_age.id)
    peasant = GameRace.create(
		:name => "peasant",
		:game_id => stone_age.id)
    thief = GameProfession.create(
		:name => "thief",
		:game_id => wow.id)
    warrior = GameProfession.create(
		:name => "warrior",
		:game_id => wow.id)
    solider = GameProfession.create(
		:name => "solider",
		:game_id => stone_age.id)
    xman = GameProfession.create(
		:name => "xman",
		:game_id => stone_age.id)
    gaoxh = User.find_by_email("gaoxh04@gmail.com")
    micai = User.find_by_email("gaoxiahong1020@yahoo.com.cn")
    c1 = GameCharacter.create(
		:user_id => gaoxh.id,
		:game_id => wow.id,
		:server_id => wow_a1_s1.id,
		:area_id => wow_a1.id,
		:profession_id => thief.id,
		:race_id => human.id,
		:name => "big boy!",
		:level => 25,
		:playing => true)
		c1.game.ratings.create(:rating => 4, :user_id => gaoxh.id)
    c2 = GameCharacter.create(
  		:user_id => gaoxh.id,
                :game_id => wow.id, 
                :server_id => wow_a2_s1.id,
                :area_id => wow_a2.id,
                :profession_id => warrior.id,
                :race_id => undead.id,
                :name => "cute boy!",     
                :level => 35,    
                :playing => true)
		c2.game.ratings.create(:rating => 4, :user_id => gaoxh.id)
    c3 = GameCharacter.create(
		:user_id => gaoxh.id,
                :game_id => stone_age.id, 
                :server_id => sa_a1_s1.id,
                :area_id => sa_a1.id,
                :profession_id => xman.id,
                :race_id => dwarf.id,
                :name => "i am xman!",     
                :level => 25,    
                :playing => true)
		c3.game.ratings.create(:rating => 4, :user_id => gaoxh.id)
    c2 = GameCharacter.create(
                :user_id => micai.id,
                :game_id => wow.id,
                :server_id => wow_a2_s1.id,
                :area_id => wow_a2.id,
                :profession_id => warrior.id,
                :race_id => undead.id,
                :name => "cute boy!",
                :level => 35,
                :playing => false)
		c2.game.ratings.create(:rating => 4, :user_id => micai.id)
    c3 = GameCharacter.create(
                :user_id => micai.id,
                :game_id => stone_age.id,
                :server_id => sa_a1_s1.id,
                :area_id => sa_a1.id,
                :profession_id => xman.id,
                :race_id => dwarf.id,
                :name => "i am xman!",
                :level => 25,
                :playing => true)
		c3.game.ratings.create(:rating => 4, :user_id => micai.id)
    25.times do |i|
      c = GameCharacter.create(
                :user_id => User.find_by_email("user#{i}@gmail.com").id,
                :game_id => wow.id,
                :server_id => wow_a2_s1.id,
                :area_id => wow_a2.id,
                :profession_id => warrior.id,
                :race_id => undead.id,
                :name => "user#{i}'s character",
                :level => i,
                :playing => true)
			c.game.ratings.create(
								:user_id => User.find_by_email("user#{i}@gmail.com").id,
								:rating => 4)
    end
    25.times do |i|
      c = GameCharacter.create(
                :user_id => User.find_by_email("user#{i+25}@gmail.com").id,
                :game_id => stone_age.id,
                :server_id => sa_a1_s1.id,
                :area_id => sa_a1.id,
                :profession_id => xman.id,
                :race_id => dwarf.id,
                :name => "user#{i}'s character",
                :level => i,
                :playing => true)
			c.game.ratings.create(
                :user_id => User.find_by_email("user#{i}@gmail.com").id,
                :rating => 4)	
    end
  end

  def self.down
  end
end
