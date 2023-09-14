class GamesService

  # Note: This is mocked data, at the moment. This will update when we have an endpoint for the BE. This is the expected return value of a game.
  def get_todays_game
    {
      "data": {
        "type": "game",
        "id": 1,
        "date": "09/1/23",
        "categories": [
          {
            "category": "before & after",
            "category_emoji": "🕰️",
            "questions": [
              {
                "answer": "a putting Green Eggs and Ham",
                "question": "Golf short game practice area served up in the title of a Dr. Seuss book",
                "points": 1
              },
              {
                "answer": "the Hebrew National League",
                "question": "If they used a well-known brand of kosher hot dogs instead of bats, the Dodgers & Phillies would be in this baseball group",
                "points": 2
              },
              {
                "answer": "the Cheshire Cat scan",
                "question": "Grinning enigmatic acquaintance of Alice in Wonderland seen in cross section by doctors",
                "points": 3
              }
            ]
          },
          {
            "category": "potent potables",
            "category_emoji": "🍹",
            "questions": [
              {
                "answer": "Coors",
                "question": "Their Golden, Colorado brewery is America's largest single one",
                "points": 1
              },
              {
                "answer": "sommelier",
                "question": "The French term for a wine waiter",
                "points": 2
              },
              {
                "answer": "Johnny Walker",
                "question": "Varieties of this brand of scotch include Red, Black, Gold & Blue Label",
                "points": 3
              }
            ]
          },
          {
            "category": "rhyme time",
            "category_emoji": "🕒",
            "questions": [
              {
                "answer": "down town",
                "question": "A sad city, or a city's center",
                "points": 1
              },
              {
                "answer": "glad dad",
                "question": "A pleased papa",
                "points": 2
              },
              {
                "answer": "low blow",
                "question": "Officially, a punch below the belt; unofficially, hitting a guy when he's down",
                "points": 3
              }
            ]
          }
        ]
      }
    }.deep_symbolize_keys
  end
end