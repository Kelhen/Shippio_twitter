Types::QueryType = GraphQL::ObjectType.define do
  name "Post"

  # queries are just represented as fields
  field :allTwitt, !types[Types::TwittType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { Twitt.all }
  end
end
