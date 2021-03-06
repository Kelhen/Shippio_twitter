Types::QueryType = GraphQL::ObjectType.define do
  name 'Post'

  # queries are just represented as fields
  field :allTwitt, !types[Types::TwittType], 'ALl User' do
    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, _args, _ctx) { Twitt.all }
  end

  field :myTwitt, !types[Types::TwittType], 'MY Twitt' do
    argument :user_id, !types.ID
    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, args, _ctx) { Twitt.where('user_id = ?', args[:user_id]) }
  end

  field :allUser, !types[Types::UserType], 'ALl Twitt' do
    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, _args, _ctx) { User.all }
  end

  field :myUser, !types[Types::UserType], 'My user' do
    argument :id, !types.ID
    type Types::UserType
    # argument :id, !types.String, prepare: ->(limit, _ctx) { [limit, 1].min }
    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, args, _ctx) { User.find_by id: args[:id] }
  end

  field :followed, !types[Types::FollowType], 'My followed' do
    argument :user_id, !types.ID
    # type Types::FollowType

    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, args, _ctx) { Followed.where('user_id = ?', args[:user_id]) }
    # resolve ->(_obj, args, _ctx) { Followed.all }
  end

  field :feed, !types[Types::TwittType], 'Twitt Feed' do
    argument :user_id, !types.ID
    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, args, _ctx) {
              sql = "SELECT twitts.* FROM twitts
                LEFT JOIN followeds ON twitts.user_id = followeds.followed_id
                JOIN users on twitts.user_id = users.id
                WHERE followeds.user_id = #{args[:user_id]}"
              # ActiveRecord::Base.connection.execute(sql)
              Twitt.find_by_sql(sql)
            }
  end
end
